A=[4 3 1;3 7 -1; 1 -1 9];
B=[10 8 7; 3 -3 0; 14 1 7];
C=[1 -1; 4 7; 9 5];

a=A+B
b=A*C
c=A'
d=A*A'
e=C*C'
f=inv(A)*inv(B)
g=[rank(A),rank(C)];
fprintf('g=\n\nrank of A = %d\nrank of C = %d\n\n',g(1),g(2));
h=det(A)
i=A\C