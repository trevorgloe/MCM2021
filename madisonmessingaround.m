clear;

figure(0);

A = 1;
R = 1;
K = 2;

r = [1:10];
dmdt = (A/R)*r^k;
plot(r,dmdt)
