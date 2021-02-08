%running the model repeatedly under varying environmental conditions
clear all
%vary nu continuously through all the range of expected values 
%(0.088 - 3.87) for desert
%(0.246 - 9.81) for tropical rainforest

all_nu = zeros(5,36);
contributions_envir = zeros(5,35,400);
% all_

table = readtable('env_tests_config_master.csv');
cell_table = table2cell(table);
nu_vals_cell = cell_table(6:40,8:12);
nu_vals = cell2mat(nu_vals_cell);

S_M_cell = cell_table(3,8:12);
S_T_cell = cell_table(4,8:12);
S_M_vals = cell2mat(S_M_cell);
S_T_vals = cell2mat(S_T_cell);

M_cell = cell_table(2,8:12);
T_cell = cell_table(3,8:12);
M_vals = cell2mat(M_cell);
T_vals = cell2mat(T_cell);

rankings_cell = cell_table(6:40,14);
rankings = cell2mat(rankings_cell);

% Simulation in an arid environment
% S_M = S_M_vals(1);
% S_T = S_T_vals(1);
% nu_vec = nu_vals(:,1);
% multi_fungi_growth_kinetics
% B_envir = zeros(5,35,400);
% C_tot_envir = zeros(5,1,400);

% for n = [1:5]
%     S_M = S_M_vals(n);
%     S_T = S_T_vals(n);
%     nu_vec = nu_vals(:,n);
%     multi_fungi_growth_kinetics
%     
%     contributions_envir(n,:,:) = contributions;
%     B_envir(n,:,:) = all_B;
%     C_tot_envir(n,:,:) = C_tot;
%     
% end

%create concentration distribution sample points
%restict the distributions for concetration to be guassians
% s_mat = zeros(35,60);
% for i = [1:35]
%     x = [1:35];
%     s_mat(:,i) = exp(-0.2*(x-i).^2);
%     s_mat(:,i) = s_mat(:,i)/(sum(s_mat(:,i)));
% end
% 
% for i = [1:35]
%     x = [1:35];
%     s_mat(:,i+34) = exp(-0.01*(x-i).^2);
%     s_mat(:,i+34) = s_mat(:,i+34)/(sum(s_mat(:,i+34)));
% end

%get the dot product of s (concentration distribution vector) with
%competative ranking

% a_vals = zeros(1,60);
% for i = [1:60]
%     a_vals(i) = dot(s_mat(:,i),rankings);
% end
% 
% % Simulation in an arid environment
% S_M = S_M_vals(1);
% S_T = S_T_vals(1);
% % nu_vec = nu_vals(:,1);
% nu_vec = zeros(35,1);
% C_tot_dist = zeros(60,400);
% B_dist = zeros(60,35,400);
% contribution_disp = zeros(60,35,400);
% for run = [25:60]
%     fungi_vec = s_mat(:,run);
%     multi_fungi_growth_kinetics
%     
%     C_tot_dist(run,:) = C_tot;
%     B_dist(run,:,:) = all_B;
%     contribution_disp(run,:,:) = contributions;
%     disp(run)
% end

    
S_M = S_M_vals(1);
S_T = S_T_vals(1);
nu_vec = nu_vals(:,1);
% nu_vec = zeros(35,1);
multi_fungi_growth_kinetics

% nu1_over_time = zeros(1,400);
% nu2_over_time = zeros(1,400);
% psi1_over_time = zeros(1,400);
% for i = [1:400]
%     [nu1 psi1] = nu_for_psi(t(i),anual_cycle_nu1,anual_cycle_psi1);
%     [nu2 psi2] = nu_for_psi(t(i),anual_cycle_nu2,anual_cycle_psi2);
%     nu1_over_time(i) = nu1;
%     nu2_over_time(i) = nu2;
%     psi1_over_time(i) = psi1;
% end
% figure
% subplot(2,1,1)
% plot(t,nu1_over_time)
% hold on
% plot(t,nu2_over_time);
% hold off
% subplot(2,1,2);
% plot(t,psi1_over_time);
% 
% figure
% plot(t,C_tot);
% 
% 
% 
%     
