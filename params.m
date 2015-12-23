function [C1,C2,B,C,F] = params(lambda,R,Cp,Pk,Ts,Tmax,Ak,Ea,Gt,Cpt,Ts0)
    C1 = Cp*(Ts - Tmax)/(Gt+Cpt*(Ts - Ts0));
    C2 = Ak*Cp*Pk/(lambda*R);
    B = Ts;
    C = Tmax - Ts;
    F = -Ea/R;
end