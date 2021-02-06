function dudt = growth_mol(t,u,n_x,u0,dx,nu,d,sigma)
%growth_mol function to compute the two coupled pdes using the method of
%lines approximation
%growth model equations:
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma

%u is a 1x200 vector with each pair of points being rho and n for a
%specific x value
% u(2) = t*sigma+u0(2);   %boundary conditions for x = 0;
% u(1) = t*(10*u(2))+u0(1);   %boundary conditions for x = 0;
% u(2) = 10*t;
% dudt(1) = u(2)*n - d;
u(2*n_x-1) = 0;  %boundary conditions for x = L;
u(2*n_x) = 0;    %boundary conditions for x = L;
% dudt(1) = u(2)*nu - d;
% u(1) = 0;
% u(2) = 0;
% dudt(2) = sigma;




for i = [2:n_x]
    rho = u(2*i-1);
    n = u(2*i);
    dudt(2*i-1) = n*nu - d;
    dnvdx = nu*(u(2*i)-u(2*i-2))/dx;
    dudt(2*i) = -dnvdx + sigma;
end
dudt = dudt';



end

