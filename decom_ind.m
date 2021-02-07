function dudt = decom_ind(t,u,n_x,u0,dx,nu,gamma1,alpha1,mu,a,allx,K,K_e,B)
%decom_ind impliments decomposition kinetics for a specific fungi and
%specific enzyme
%here, u is just C
%B should already be calculated going into 
B = trapz(allx,rho_vals);    %assuming equal spacial steps
% B = 3;
dudt = -K*(B)*C/(K_e+C);



end

