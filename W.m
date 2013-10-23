function [val] = W(psi, psi_o, h, T)
    val = -h * exp(-T*(1-cos(psi-psi_o)));
end