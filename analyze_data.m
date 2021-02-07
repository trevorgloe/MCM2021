%analyze the relative contribution of individual fungi to the whole
%decomposition


avg_contr = zeros(1,35);
for i = [1:35]
    %numerically integrate each fungi's contribution curve over time 
    tot = trapz(t,contributions(i,:));
    avg = tot/(max(t)-min(t));
    avg_contr(i) = avg;
    
end

figure
scatter(nu_vec,avg_contr);
title('Average contrabution of particular fungus vs \nu')

figure
scatter(nu_vec,(contributions(:,10)))
hold on
scatter(nu_vec,(contributions(:,200)))
scatter(nu_vec,(contributions(:,390)))
title('Relationship between \nu and fungus contribution at different times')
% legend('t=75','t=600','t=1500')


