% this octave code produces fig 2.8, p75 which shows the evolution of an (initial) rectangular wave function. the data "evolutionFromRectangular.dat" must be placed in "./tex/tables" folder (as specied by \pgfplotsset{table/search path={./tex/tables},}).


clear;
clf;

for i=1:100
a=1;
f=@(k) 1/(pi*sqrt(2*a))*sin(k*a)./k.*cos(k.*(0.12*i-6)-k.^2*a^2/2);
g=@(k) 1/(pi*sqrt(2*a))*sin(k*a)./k.*sin(k.*(0.12*i-6)-k.^2*a^2/2);
psiSquared(i)=(quadgk(f,-30,30))^2+(quadgk(g,-30,30))^2;
endfor

i=1:100;
plot(i,psiSquared(i));


khorcat=rot90([psiSquared;0.12*i-6],-1);

kkk=fopen("evolutionFromRectangular.dat","w");
fdisp(kkk,khorcat)
fclose(kkk);

