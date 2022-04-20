clear;
clf;

e=1.60217662*10^(-19);
q=1*e;
ep=8.8541878128*10^(-12);
h=6.62607015*10^(-34);
hslash=h/(2*pi);
%m=6.644657230*10^(-27);
m=9.10938356*10^(-31);
ev=q*1;
K1=q^2/(4*pi*ep)*pi*sqrt(2*m)/hslash;
K2=sqrt(q^2/(4*pi*ep))*4*sqrt(m)/hslash;

function y = f (x)
y=4.*x.^4-4.*x.^2;
endfunction

dc=f(sqrt(2)/2);
x=sqrt(21)/7:0.0000000001:sqrt(21)/7+0.001;
plot(x,f(x))

print  -dpdflatexstandalone kchaos.pdf
