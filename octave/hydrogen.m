clear;
clf;
m=9.10938356*10^(-31);
q=1.60217662*10^(-19);
h=6.62607004*10^(-34);
hbar=h/(2*pi);
ep=8.854187812813*10^(-12);
a=4*pi*ep*hbar^2/(m*q^2);
R10=@(r) 2*a^(-3/2)*e^(-r/a);
R21=@(r) 1/sqrt(2)*a^(-3/2)*(1-r/(2*a))*e^(-r/(2*a));
R21=@(r) 1/sqrt(24)*a^(-3/2)*r/a*e^(-r/(2*a));
R30=@(r) 2/sqrt(27)*a^(-3/2)*(1-2*r/(3*a)+2/27*(r/a)^2)*e^(-r/(3*a));
Y00=@(t) sqrt(1/(4*pi));
Y10=@(t,p) sqrt(3/(4*pi))*cos(t);
Y11=@(t,p)sqrt(3/(8*pi))*sin(t)*e^(i*p);
Y20=@(t,p) sqrt(5/(16*pi))*(3*cos(t)^2-1);

#contour(x,y,f,[0,0]);

print  -dpdflatexstandalone kcontour.pdf
