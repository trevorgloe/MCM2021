%implimentation of the growth model using a method of lines approximation
%method

%growth model is given by the equations
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma

L = 100;    %size of x space
n_x = 1000;   %number of points in x dim (number of ODEs)

x = linspace(0,L,n_x);
t = linspace(0,5,500);

ic = zeros(1,2*n_x);
dx = L/n_x;
nu = 10;
d = 2;
sigma = 10;
u0 = 0;

[tout, u] = ode45(@growth_mol,t,ic,[],n_x,u0,dx,nu,d,sigma);

rho = zeros(length(t),n_x);
n = zeros(length(t),n_x);
for i = [1:length(u)/2]
    rho(:,i) = u(:,2*i-1);
    n(:,i) = u(:,2*i);
end
figure
surf(x,t,rho);

