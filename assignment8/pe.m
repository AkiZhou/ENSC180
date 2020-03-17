syms m k c t u0
y1=dsolve('m*D2y+k*y=0','y(0)=u0','Dy(0)=0')
y2=dsolve('m*D2y+c*Dy+k*y=0','y(0)=u0','Dy(0)=0')
m=2;k=4;c=0.05;u0=0.1;
 y3=subs(y1);
 c=5;
 y4=subs(y2)