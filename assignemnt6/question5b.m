syms x y


x=y*(1+sin(0.7*x))-1.2*sqrt(abs(x));
y=0.21-x;
x1=subs(x,x,0)
x2=subs(x1,y,0)
fplot(x,y,'*')