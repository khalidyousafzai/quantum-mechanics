% this produces fig 2.6 (p67) whereby the tail of the wave function flips as one crosses "E=1/2*\hslash*\omega". At exactly this value of energy does the schrodinger %equation have a normalizable solution. This code produces three sets of data which must be placed in the search path of pgfplot table (i.e. inside the folder "./tex/table").

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
