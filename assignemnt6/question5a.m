clear 
clc

syms x y
T=80*y^2*exp(-x^2-0.3*y^2);

fsurf(T,[-2.2,2.2,-6,6])
figure
fcontour(T,[-2.2,2.2,-6,6])
