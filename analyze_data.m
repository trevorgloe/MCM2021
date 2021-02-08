%analyze the relative contribution of individual fungi to the whole
%decomposition

% table = readtable('env_tests_config_master.csv');
% cell_table = table2cell(table);
% rankings_cell = cell_table(6:40,14);
% rankings = cell2mat(rankings_cell);


avg_contr = zeros(1,35);
for i = [1:35]
    %numerically integrate each fungi's contribution curve over time 
    tot = trapz(t,contributions(i,:));
    avg = tot/(max(t)-min(t));
    avg_contr(i) = avg;
    
end
% 
% figure
% scatter(nu_vec,avg_contr,40,rankings,'filled');
% title('Average cuntrabution of particular fungus vs \nu')
% 
% figure
% scatter(nu_vec,(contributions(:,10)))
% hold on
% scatter(nu_vec,(contributions(:,200)))
% scatter(nu_vec,(contributions(:,390)))
% title('Relationship between \nu and fungus contribution at different times')
% % legend('t=75','t=600','t=1500')
% 

%get average carbon decrease over the interval
% C_tot_avg = zeros(1,36);
% relevant_a_vals = zeros(1,36);
% for i = [25:60]
%     total_val = trapz(t,(100-C_tot_dist(i,:)));
%     C_tot_avg(i-24) = total_val/(max(t)-min(t));
%     relevant_a_vals(i-24) = a_vals(i);
% end
% 
% figure
% plot(relevant_a_vals,C_tot_avg)
