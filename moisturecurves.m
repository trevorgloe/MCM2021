clear;
close all;

TMC = readtable('Fungi_moisture_curves.csv'); %table of moisture curves
TTC = readtable('Fungi_temperature_curves.csv'); %table of temperature curve

TTC_cell = table2cell(TTC);

arid_temp_name = {};
arid_temp_nu = {};

for i = 2:242308
    if TTC_cell{i,2} == 25
        arid_temp_nu{end+1} = TTC_cell{i,3};
    end
end
arid_temp = horzcat
celldisp(arid_temp)

%% Plot if you want

% tmc = TMC{1:502,2};
% T0 = TMC{1:502, 3};
% T1 = TMC{503:1004, 3};
% % T2 = T{1004:1504, 3};
% % T3 = T{1505:2005, 3};
% % T4 = T{2006:2506, 3};
% 
%  figure(1);
%  plot(tmc,T0);
%  hold on;
%  grid on;
%  plot(tmc,T1);
% % plot(t,T2);
% % plot(t,T3);
% % plot(t,T4);
% % 
% % t2 = [-1,-1.5,-2.5,-3.5,-4.5,0,-0.5];
% % T0_1 = T{21044:21050, 3});
% % T0_2 = T{21051:21057, 3});
% % T0_3 = T{21058:21064, 3});
% % T0_4 = T{21065:21071, 3});
% % T0_5 = T{21072:21078, 3});
% % 
% % figure(2);
% % hold on;
% % plot(t2,T0_1,'o');
% % plot(t2,T0_2,'o');
% % plot(t2,T0_3,'o');
% % plot(t2,T0_4,'o');
% % plot(t2,T0_5,'o');
% % 
% % % figure(3);
% % % hold on;
% % % plot(t,T1);
% % % plot(t2,T0_1,'o');
