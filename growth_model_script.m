%model of growth of fungus

%growth model is given by the equations
%dp/dt = nv - d
%dn/dt = -d(nv)/dx + sigma

L = 100;
x = linspace(0,L,100);
t = linspace(0,5,100);

m = 0;

sol = pdepe(m,@growth_model,@growth_ic,@growth_bc,x,t);

u1 = sol(:,:,1);
u2 = sol(:,:,2);

B = zeros(1,length(u1(:,1)));
for time = [1:length(u1(:,1))]
        B(time) = trapz(x,u1(time,:));
end

figure
% plot(t,B)
surf(x,t,u1)


