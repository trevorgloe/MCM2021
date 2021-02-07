%simulating the growth and decomposition systems coupled for several
%different fungi, each with 4 different enzymes

clear all

%define what fungi are present
fungi_vec = zeros(1,36);    %must be normalized to 1
fungi_vec = linspace(0,1,36);

%define domains
n_x = 100;
L = 100;
t = linspace(0,2000,400);
x = linspace(0,L,n_x);
dx = L/n_x;


%initial conditions
C_tot0 = 100;
ic_rho_n = zeros(1,2*n_x);  %should be the same for all fungi
ic_es = C_tot0*ones(1,36*4);

IC = [repmat(ic_rho_n,1,36) ic_es C_tot0];



fungi_enzyme_mat = 0.25*ones(4,36); %each row is a type of enzyme, each column is a specific fungus
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
a = 0.250/1000;     %boundary proliferation parameter
% sigma = 10;
alpha1 =1.7;    %branching rate
mu = 0.3;   %anastomosis coefficient

%decomposition kinetics
% r = 0.437;  %proportion of total enzymes that are the specific enzyme in question
r_e_scal = 0.04;     %proportion of microbial biomass that is enzymes
r_e_vec = r_e_scal*fungi_vec;
G = 4.2e-3;  %decomposition rate constant (converts mm of hyphae to g carbon/day)
% K = S_M*S_T*r*r_e*G;
% K_e = 7*(C0/(1.7867));     %convert half-saturation coefficient from mols to grams of carbon

nu_vec = 0.25*ones(1,36);    %should be based on T and M

K_e_vec = 7*(100/(1.7867))*ones(1,4);    %half-saturation coeficients for each type of enzyme

tic
[tout, u] = ode45(@total_growth_decom,t,IC,[],n_x,dx,nu_vec,gamma1,alpha1,mu,a,x,r_e_vec,fungi_enzyme_mat,S_T,S_M,G,K_e_vec,fungi_vec);
toc

%% Get data
rho_ns = u(:,1:7200);
C_enz = u(:,7201:7344);
C_tot = u(:,7345);

all_rho = zeros(36,length(t(1,:)),100);
all_B = zeros(36,length(t(1,:)));
for i = [1:36]
    rho_fungi = zeros(length(t(1,:)),100);
    for j = [1:100]
        rho_fungi(:,j) = rho_ns(:,(i-1)*200+1+2*(j-1));
    end
    all_rho(i,:,:) = rho_fungi;
    for time = [1:length(t(1,:))]
        all_B(i,time) = trapz(x,all_rho(i,time,:));
    end
        
end

all_C_enz = zeros(36,4,length(t(1,:)));
for i = [1:36]
    all_C_enz(i,:,:) = C_enz(:,(i-1)*4+1:i*4)';
end
%each row of all_C_enz is a different type of fungus and each column is a
%different enzymes


figure
plot(t,C_tot)
title('total carbon')

figure
hold on
for i = [1:36]
    plot(t,all_B(i,:))
end
title('Different fungi all growing at different rates')

figure
hold on
j = 1;
for i = [1:36]
    plot(t,(C_tot0-squeeze(all_C_enz(i,j,:))))
end
title('Nutrient uptake of different species of fungi')    
figure
hold on
for i = [1:36]
    contribution = squeeze(4*C_tot0-(all_C_enz(i,1,:)+all_C_enz(i,2,:)+all_C_enz(i,3,:)+all_C_enz(i,4,:)));
    disp(contribution)
    plot(t,(contribution)/C_tot0)
end


    

