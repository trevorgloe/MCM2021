function dudt = total_growth_decom(t,u,n_x,dx,nu_vec,gamma1,alpha1,mu,a,allx,r_e_vec,r_mat,S_T,S_M,G,K_e)
%total_growth_decom this boy does it all
%u is a 1x7345 array 
%the first 7200 correspond to the 36 discretized pde's for each fungus
%the next 144 terms correspond to the carbon decay rates for a spcific
%fungus and specific enzy,e
%the last term corresponds to the total carbon


%evaluating all the discretized pde's
for i = [1:36]
    %calculate dudt for the i'th fungi
    nu = nu_vec(i);
    u_temp = [u(((i-1)*36+1):i*36) u(7345)];
    dudt(((i-1)*36+1):i*36) = growth_ind(t,u,n_x,dx,nu,gamma1,alpha1,mu,a,allx);
end



