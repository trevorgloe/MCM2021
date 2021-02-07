%simulating the growth and decomposition systems coupled for several
%different fungi, each with 4 different enzymes

%define what fungi are present
fungi_vec = zeros(1,36);    %must be normalized to 1

%define domains
d_x = 100;
t = linspace(0,2000,400);
x = linspace(0,100,100);

%initial conditions
C_tot0 = 1000;
ic_rho_n = zeros(1,2*d_x);  %should be the same for all fungi
ic_es = zeros(1,36*4);

IC = [repmat(ic_rho_n,1,36) ic_es C_tot0];



fungi_enzyme_mat = zeros(4,36); %each row is a type of enzyme, each column is a specific fungus
% ^ the r values for each fungi and enzyme



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
% nu = 0.250;     %tip elongation speed
% d = 200;
gamma1 = 5.3e-3;    %hyphal death rate
a = nu/1000;     %boundary proliferation parameter
% sigma = 10;
alpha1 =1.7;    %branching rate
mu = 0.3;   %anastomosis coefficient

%decomposition kinetics
% r = 0.437;  %proportion of total enzymes that are the specific enzyme in question
r_e_scal = 0.04;     %proportion of microbial biomass that is enzymes
r_e_vec = r_e*fungi_vec;
G = 4.2e-3;  %decomposition rate constant (converts mm of hyphae to g carbon/day)
% K = S_M*S_T*r*r_e*G;
% K_e = 7*(C0/(1.7867));     %convert half-saturation coefficient from mols to grams of carbon

nu_vec = ones(1,36);    %should be based on T and M

K_e = ones(1,4);    %half-saturation coeficients for each type of enzyme




