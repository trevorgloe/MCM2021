T = readtable('Fungi_moisture_curves.csv');

t = -1.*[0:0.01:5];
T0 = T{2:502, 3};
T1 = T{503:1003, 3};
T2 = T{1004:1504, 3};
T3 = T{1505:2005, 3};
T4 = T{2006:2506, 3};

figure(1);
plot(t,T0);
hold on;
grid on;
plot(t,T1);
plot(t,T2);
plot(t,T3);
plot(t,T4);

t2 = [-1,-1.5,-2.5,-3.5,-4.5,0,-0.5];
T0_1 = T{21044:21050, 3};
T0_2 = T{21051:21057, 3};
T0_3 = T{21058:21064, 3};
T0_4 = T{21065:21071, 3};
T0_5 = T{21072:21078, 3};

figure(2);
hold on;
plot(t2,T0_1,'o');
plot(t2,T0_2,'o');
plot(t2,T0_3,'o');
plot(t2,T0_4,'o');
plot(t2,T0_5,'o');

figure(3);
hold on;
plot(t,T1);
plot(t2,T0_1,'o');
