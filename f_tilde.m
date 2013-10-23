function [val] = f_tilde(omega, omega_p, psi, psi_o, h, T, S, L)
    sum = 0;
    for i = 1:3
        sum = sum + T * sin(psi - psi_o(i)) * Q(omega, omega_p(i), S, L) * W(psi, psi_o(i), h, T);
    end
    val = -sum;
end