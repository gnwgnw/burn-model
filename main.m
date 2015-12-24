function main
    Gt = -5e4;
    Cpt = 1464;
    Ts0 = 300;

    lambda = 0.23;
    R = 363;
    Cp = 1800;
    Pk = 1e7;
    Ts = 720;
    Tmax = 2360;
    rho_t = 1600;
    Ak = 1e8;
    Ea = 4e6;

    x = linspace(0,1,20);
    t = linspace(0,2,5);

    [C1,C2,B,C,F] = params(lambda,R,Cp,Pk,Ts,Tmax,Ak,Ea,Gt,Cpt,Ts0);
    
    [~,g] = calculate_u(lambda,R,Cp,Pk,Ts,Tmax,rho_t,Ak,Ea,Gt,Cpt,Ts0,1,1e-2,1,2000);
    
    m = 0;
    sol = pdepe(m, @(x,t,u,DuDx)pde(x,t,u,DuDx,C1,C2,B,C,F), @(x)ic(x,g), @bc, x, t);
end

function [c,f,s] = pde(x,t,u,DuDx,C1,C2,B,C,F)
    c = 1;
    f = DuDx;
    s = DuDx*DuDx(1)*C1 + (1-u)/(B+u*C)*C2*exp(F/(B+u*C));
end

function u0 = ic(x,f)
    u0 = f(x);
end

function [pl,ql,pr,qr] = bc(xl,ul,xr,ur,t)
    pl = ul;
    ql = 0;
    pr = ur - 1;
    qr = 0;
end
