clear
clc

syms Vs t
v=dsolve('D2v+5*Dv+6*v=Vs','v(0)=10','Dv(0)=-2')