function [nu psi] = nu_for_psi(t,anual_cycle_nu,anual_cycle_psi)
%nu_for_psi - nu value over time as it relates to psi

cycle_n = length(anual_cycle_nu);
step_size = 365/(2*cycle_n);
%anual cycle is broken up to go back and forth in a single year
t_out_of_year = mod(t,365);
%find closest value of discreted t values for breaking up the year into
%2*cycle_n steps
step = floor(t_out_of_year/(step_size));

anual_cycle_nu_full = [anual_cycle_nu flip(anual_cycle_nu)];
anual_cycle_psi_full = [anual_cycle_psi flip(anual_cycle_psi)];
nu = anual_cycle_nu_full(step+1);
psi = anual_cycle_psi_full(step+1);

end

