function dudt = growth_kinetics(t,u,n_x,u0,dx,nu,gamma1,alpha1,mu,a,allx,K,K_e)
%growth_kinetics - impliments growth model coupled with michealis menten
%equation for enzyme catalyzed reation dynmaics
%u is a n_x*2+1 element vector, the (n_x*2+1)st element being C

dudt = zeros(1,n_x*2+1);
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
u(2) = a*t;
dudt(1) = u(2)*nu - gamma1*u(1);
% dudt(2) = nu*(u(4)-u(2))/dx + alpha1*u(2) - mu*u(2)*u(1);

for i = [2:n_x]
    d = gamma1*u(2*i-1);
    rho = u(2*i-1);
    n = u(2*i);
    dudt(2*i-1) = n*nu - d;
    dnvdx = nu*(u(2*i)-u(2*i-2))/dx;
    dudt(2*i) = -dnvdx + alpha1*n - mu*n*rho;
end

%reaction dynamics model (michealis menten equation)
%kinetics equation:
%dC/dt = K*B*C/(K_e + C)

%calculate B based off of growth model (inetegral of rho over all space)
rho_vals = zeros(1,(length(u)-1)/2);
for j = [1:(length(u)-1)/2]
    rho_vals(j) = u(2*j-1);
end
B = trapz(allx,rho_vals);    %assuming equal spacial steps
% B = 3;
dudt(n_x*2+1) = -K*(B)*C/(K_e+C);


dudt = dudt';




end

