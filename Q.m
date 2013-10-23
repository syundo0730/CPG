function [val] = Q(omega, omega_p, S, L)
    val = 1/(1+exp(-S*(omega-(omega_p-L)))) - 1/(1+exp(-S*(omega-(omega_p+L))));
end