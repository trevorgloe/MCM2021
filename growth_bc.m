function [pl,ql,pr,qr] = growth_bc(xl,ul,xr,ur,t)
%growth_bc boundary condition for growth model
pl = [0; ul(2) - 0.01*t - 5];
ql = [1; 0];
pr = [ur(1); ur(2)];
qr = [0; 0];

end

