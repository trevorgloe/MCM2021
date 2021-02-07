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


% Simulation in an arid environment
% S_M = S_M_vals(1);
% S_T = S_T_vals(1);
% nu_vec = nu_vals(:,1);
% multi_fungi_growth_kinetics

for i = [1:5]
    S_M = S_M_vals(i);
    S_T = S_T_vals(i);
    nu_vec = nu_vals(:,i);
    multi_fungi_growth_kinetics
    
    contributions_envir(i,:,:) = contributions;
    
end
    




    
