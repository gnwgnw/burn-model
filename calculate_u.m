function [u_t, g, dg] = calculate_u(lambda,R,Cp,Pk,Ts,Tmax,rho_t,Ak,Ea,Gt,Cpt,Ts0,right,burn_edge,N)
%   right - right end of the boundary
%   burn_edge - boundary of the g changes
%   right_out - right end of the x for g
%   N - count of the point in the mesh
%
%   right >= right_out >= burn_edge

    if nargin == 0
        right = 0.001;
        burn_edge = 1e-4;
        N = 2000;

        Gt = -5e4;
        Cpt = 1464;
        Ts0 = 300;

        lambda = 0.23;
        R = 363;
        Cp = 1800;
        Pk = 1e7;
        Ts = 1000;
        Tmax = 2360;
        rho_t = 1600;
        Ak = 1e8;
        Ea = 4e6;

        [u_t, g, dg] = calculate_u(lambda,R,Cp,Pk,Ts,Tmax,rho_t,Ak,Ea,Gt,Cpt,Ts0,right,burn_edge,N);
        return;
    end

    burn_mesh_dens = 0.9;

    x_mesh = unique([
        linspace(0, burn_edge, burn_mesh_dens*N) linspace(burn_edge, right, (1-burn_mesh_dens)*N)
    ]);

    [C1,C2,B,C,F] = params(lambda,R,Cp,Pk,Ts,Tmax,Ak,Ea,Gt,Cpt,Ts0);

    solinit = bvpinit(x_mesh, [1 1]);
    sol = bvp4c(@(x,y) ode(x,y,C1,C2,B,C,F), @bc, solinit);

    g = @(x) deval(sol, x, 1);
    dg = @(x) deval(sol, x, 2);
    
    dgdx_0 = dg(0);

    u_t = -lambda*dgdx_0*(Tmax - Ts)/(rho_t*(Gt+Cpt*(Ts-Ts0)));

%     fprintf('Pk = %e\n', Pk);
%     fprintf('dgdx_0 = %7.6f\n', dgdx_0);
%     fprintf('u_t_new = %e\n', u_t);
end

function dydx = ode(x,y,C1,C2,B,C,F)
    y1 = y(1);
    y2 = y(2);

    persistent y2_0;

    if x == 0
        y2_0 = y2;
    end

    dydx = zeros(2,1);
    dydx(1) = y2;
    dydx(2) = -y2*y2_0*C1 - (1-y1)/(B+y1*C)*C2*exp(F/(B+y1*C));
end

function res = bc(ya,yb)
    res = [
      ya(1);
      yb(1) - 1;
    ];
end
