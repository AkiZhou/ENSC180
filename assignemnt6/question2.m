clear

syms R L C t
v=dsolve('D2v+(R/L)*Dv+v/(L*C)=0','v(0)=10','Dv(0)=2');
%substitute input values of R,L,C
v1=subs(v,R,2/3);
v2=subs(v1,L,1);
v3=subs(v2,C,1/2)

fplot(v3,[0,0.12]) %0<=t<=120ms