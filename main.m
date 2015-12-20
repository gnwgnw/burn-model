function main
    right = 0.01;
    burn_edge = 1e-3;
    burn_mesh_dens = 0.9;
    
    right_plot = 1e-3;
    
    N = 2000;
    
    x_mesh = unique([
        linspace(0, burn_edge, burn_mesh_dens*N) linspace(burn_edge, right, (1-burn_mesh_dens)*N)
    ]);
    
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

    [A,B,C,D,E,F] = params(lambda,R,Cp,Pk,Ts,Tmax,rho_t,Ak,Ea,Gt,Cpt,Ts0);
    
    solinit = bvpinit(x_mesh, [1 1]);
    sol = bvp5c(@(x,y) ode(x,y,A,B,C,D,E,F), @bc, solinit);
    
    x = linspace(0, right_plot, N);
    g = deval(sol, x);
   
    figure(1);
    plot(x, g(1,:));
    
    figure(2);
    dg = g(2,:);
    plot(x, dg);
    
    dgdx_0 = dg(1);
%     dgdx_0 = max(dg);
    
    u_t_new = -lambda*dgdx_0*(Tmax - Ts)/(rho_t*(Gt+Cpt*(Ts-Ts0)));
%     u_t_D = sol.parameters * Pk / (rho_t * R);
    
    fprintf('dgdx_0 = %7.6f\n', dgdx_0);
    fprintf('u_t_new = %e\n', u_t_new);
%     fprintf('D = %e\n', sol.parameters);
%     fprintf('u_t_D = %e\n', u_t_D);

end

function dydx = ode(x,y,A,B,C,D,E,F)
    y1 = y(1);
    y2 = y(2);

    dydx = zeros(2,1);
    dydx(1) = y2;
    dydx(2) = -y2*y2(1)*D/A -(1-y1)/(B+y1*C)*E/A*exp(F/(B+y1*C));
end

function res = bc(ya,yb)
    res = [
      ya(1);
      yb(1) - 1;
    ];
end

function [A,B,C,D,E,F] = params(lambda,R,Cp,Pk,Ts,Tmax,rho_t,Ak,Ea,Gt,Cpt,Ts0)
    A = lambda*R/(Cp*Pk);
    B = Ts;
    C = Tmax - Ts;
    D = rho_t * (-lambda*(Tmax - Ts)/(rho_t*(Gt+Cpt*(Ts - Ts0)))) * R / Pk;
    E = Ak;
    F = -Ea/R;
end
