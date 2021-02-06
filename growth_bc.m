function [pl,ql,pr,qr] = growth_bc(xl,ul,xr,ur,t)
%growth_bc boundary condition for growth model
pl = [0; ul(2)];
ql = [1; 0];
pr = [ur(1) - 1; 0];
qr = [0; 1];

end

