fvdp = @(t,y) [y(2); (t^2-0.98)*y(1)];
lin=linspace(0,3.75,50);
[t,y] = ode45 (fvdp, lin, [1,0]);
plot(t,y(:,1));

ty=[t,y(:,1)];
save tailFlipUP.tex ty

fvdp = @(t,y) [y(2); (t^2-1.02)*y(1)];
lin=linspace(0,3.75,50);
[t,y] = ode45 (fvdp, lin, [1,0]);
plot(t,y(:,1));

ty=[t,y(:,1)];
save tailFlipDn.tex ty

fvdp = @(t,y) [y(2); (t^2-1)*y(1)];
lin=linspace(0,3.75,50);
[t,y] = ode45 (fvdp, lin, [1,0]);
plot(t,y(:,1));

ty=[t,y(:,1)];
save tailFlipNone.tex ty
