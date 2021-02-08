function dudt = total_growth_decom(t,u,n_x,dx,nu_vec,gamma1,alpha1,mu,a,allx,r_e_vec,r_mat,S_T,S_M,G,K_e_vec,fungi_vec,anual_cycle_nu1,anual_cycle_psi1,anual_cycle_nu2,anual_cycle_psi2)
%total_growth_decom this boy does it all
%u is a 1x7141 array 
%the first 7000 correspond to the 36 discretized pde's for each fungus
%the next 140 terms correspond to the carbon decay rates for a spcific
%fungus and specific enzy,e
%the last term corresponds to the total carbon
dudt = zeros(1,7141);

% [nu1 psi1] = nu_for_psi(t,anual_cycle_nu1,anual_cycle_psi1);
% [nu2 psi2] = nu_for_psi(t,anual_cycle_nu2,anual_cycle_psi2);
% nu_vec(1) = nu1;
% nu_vec(2) = nu2;
% disp(nu1)

%evaluating all the discretized pde's
for i = [1:35]
    %calculate dudt for the i'th fungi
    nu = nu_vec(i);
    u_temp = [u(((i-1)*200+1):i*200)' u(7141)];
    conc = fungi_vec(i);
    dudt(((i-1)*200+1):i*200) = growth_ind(t,u_temp,n_x,dx,nu,gamma1,alpha1,mu,a,allx,conc);
end


%evaluating all the different decomposition kinetics for individual fungi
%and individual enzymes

B = zeros(1,35);
dedt = zeros(1,4*35);
for i = [1:35]
    %different fungi
    r_e = r_e_vec(i);
    u_temp = u(((i-1)*200+1):i*200);  %rho and n for a specific fungi
%     disp(u_temp)
    rho = zeros(1,length(u_temp)/2);
    for k=[1:length(u_temp)/2]
        rho(k) = u_temp(2*k-1);
    end
    B(i) = trapz(allx,rho);
    
    for j = [1:4]
        %different enzymes
        r = r_mat(j,i);
        K = S_M*S_T*r*r_e*G;
        K_e = K_e_vec(j);
        C_val = u(7141);
        rate = decom_ind(t,C_val,n_x,dx,gamma1,alpha1,mu,a,allx,K,K_e,B(i));
%         disp(rate)
        dudt(7000+(i-1)*4+j) = rate;
        dedt((i-1)*4+j) = rate;
    end
end


%calculate the total carbon being lost as the sum of all the contributions
%by each enzyme in each fungi
dudt(7141) = sum(dedt);
% disp(B)

dudt = dudt';
        


