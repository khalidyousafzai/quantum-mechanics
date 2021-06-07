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



