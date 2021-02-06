function [c,f,s] = growth_model(x,t,u,dxdt)
%growth_model
%implimentation of growth model equations 
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma

%two equations, so each c,f, and s will be a 2 element vector
rho = u(1);
n = u(2);
nu = 10;
gamma = 100;
d = 2;
sigma = 10;

c = [1; 1];
s = zeros(2,1);
s(1) = n*nu - d;
s(2) = sigma;
f = zeros(2,1);
f(1) = 0;
f(2) = n*nu;


end

