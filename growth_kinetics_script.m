%implimentation of the growth model coupled with the kinetics (Michealis
%menten) model for reaction kinetics

%growth model is given by the equations
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma

%michealis menten equation is given by the equation
%dC/dt = K*B*C/(K_e + C)


%%
%Setting up domains ----------------------------------------
L = 200;    %size of x space
n_x = 100;   %number of points in x dim (number of ODEs)

x = linspace(0,L,n_x);
t = linspace(0,1500,500);
dx = L/n_x;

%%
%initial conditions -----------------------------------------
ic_rho_n = zeros(1,2*n_x);
u0 = [0 0];
C0 = 1000;

%%
%parameters ----------------------------------------------
%environmental conditions
T = 25;  %degrees celcius
psi = -0.5;  %water potential
alpha2 = 0.311;     %intercept in S_M equation
lambda = 0.345;     %multiplier for S_M equation
S_M = alpha2 - lambda*log10(-psi);
S_T = 1;

%growth model
nu = 0.250;     %tip elongation speed
% d = 200;
gamma1 = 0.73;    %hyphal death rate
a = 0.56;     %boundary proliferation parameter
% sigma = 10;
alpha1 = 1.2372;    %branching rate
mu = 5.40e-5;   %anastomosis coefficient

%decomposition kinetics
r = 0.437;  %proportion of total enzymes that are the specific enzyme in question
r_e = 0.04;     %proportion of microbial biomass that is enzymes
g = 1e-4;  %decomposition rate constant (converts mm of hyphae to g carbon/day)
K = S_M*S_T*r*r_e*g;
K_e = 7*(C0/(1.7867));     %convert half-saturation coefficient from mols to grams of carbon


%%
%Solving and pulling data ----------------------------------------------

[tout, u] = ode45(@growth_kinetics,t,[ic_rho_n C0],[],n_x,u0,dx,nu,gamma1,alpha1,mu,a,x,K,K_e);

rho = zeros(length(t),n_x);
n = zeros(length(t),n_x);
for i = [1:length(u(1,:))/2]
    rho(:,i) = u(:,2*i-1);
    n(:,i) = u(:,2*i);
end
%recalculation
n(:,1) = a.*t;
C = u(:,201);

%%
%Plotting

figure
surf(x,t,rho);
title('rho')
xlabel('space x [mm]')
ylabel('time [days]')
colormap cool

figure
surf(x,t,n);
title('n')
xlabel('space x [mm]')
ylabel('time [days]')
colormap cool

figure
plot(t,C)
title('Carbon-y bois')
