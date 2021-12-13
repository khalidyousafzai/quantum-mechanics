clear;
clf;
m=9.10938356*10^(-31);
q=1.60217662*10^(-19);
h=6.62607004*10^(-34);
hbar=h/(2*pi);
ep=8.854187812813*10^(-12);
a=4*pi*ep*hbar^2/(m*q^2);

R20=@(r) 1/sqrt(2)*a^(-3/2)*(1-r/(2*a))*e^(-r/(2*a));
Y00=@(t,p) sqrt(1/(4*pi));

L11=@(r) -2*r/a+4;

psi200=@(r,t,p) (1/a)^3*(1/16)*e^(-r/(2*a))*L11(r)*Y00(t,p);
#contour(x,y,f,[0,0]);

print  -dpdflatexstandalone kcontour.pdf
