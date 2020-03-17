clear
clc

syms x
f1= 6*x^3+19*x^2-19*x+4;
f2= (x^2-5*x+6)/(x^2-4);

factor1= factor(f1)
factor2= factor(f2)
simpleA= simplify(f1*f2)
simpleB= simplify(f1/f2)
simpleC= simplify((f1*f2)^2)
df1_1= diff(f1)
df1_2= diff(f1,2)
df2_1= diff(f2)
df2_2= diff(f2,2)
int1= int(f1,2,4)
int2= int(f2,2,4)

