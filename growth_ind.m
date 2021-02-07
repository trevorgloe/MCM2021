function dudt = growth_ind(t,u,n_x,dx,nu,gamma1,alpha1,mu,a,allx,conc)
%growth_ind computes the pde descritized in space using the method of lines
%here u is a 1 x 2*d_x+1 vector
%first 2*d_x values are rho and n 
%last value is C
dudt = zeros(1,n_x*2);
%growth model implimentation using method of lines approximation
%growth model equations:
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma
C = u(2*n_x+1);

n0 = 2; 

%u(1-200) is a 1x200 vector with each pair of points being rho and n for a
%specific x value
% u(2) = t*sigma+u0(2);   %boundary conditions for x = 0;
% u(1) = t*(10*u(2))+u0(1);   %boundary conditions for x = 0;
% u(2) = 10*t;
% dudt(1) = u(2)*n - d;
u(2*n_x-1) = 0;  %boundary conditions for x = L;
u(2*n_x) = 0;    %boundary conditions for x = L;
% dudt(1) = u(2)*nu - d;
% u(2) = 6.7;
u(2) = conc*0.709*(4e-7)*a*t;    %need to include adjustment on boundary condition whenever implimenting C term
% u(2) = a*t; 
% u(1) = 1;
dudt(1) = conc*(0.709*(1e7)*C*u(4)*nu - gamma1*u(1));
% dudt(1) = u(4)*nu - gamma1*u(1);
dudt(2) = conc*(nu*((u(6)-u(4))-(u(4)-u(2)))/(2*dx) + alpha1*u(2) - mu*u(2)*u(1));

for i = [2:n_x]
    d = gamma1*u(2*i-1);
    rho = u(2*i-1);
    n = u(2*i);
    dudt(2*i-1) = conc*(0.709*(1e9)*C*n*nu - d);
%     dudt(2*i-1) = n*nu - d;
    dnvdx = nu*(u(2*i)-u(2*i-2))/dx;
    dudt(2*i) = conc*(-dnvdx + alpha1*n - mu*n*rho);
end

dudt = dudt';


end

