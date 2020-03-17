A=[4 3 1;3 7 -1;1 -1 9];
M=[1 0 0;0 2 0;0 0 3];
 
syms w2
determinant=det(A-w2*M);
coefficient=double(fliplr(coeffs(determinant)));
eigVal=sqrt(roots(coefficient));
eigVal=[eigVal;-(eigVal)]; %accounting the negative values
disp('eigenvalues'); disp(eigVal');

eigVec=zeros(3);
a=A(1,1);e=A(2,2);b=A(1,2);c=A(1,3);f=A(2,3);
for i=1:3 %use only the positive eigenvalues since +- makes no difference after getting squared
    w_2=eigVal(i)^2;
    C=[a-w_2,b;b,e-2*w_2];
    B=[-c;-f];
    eigVec(:,i)=[C\B;1];
end
disp('eigenvectors'); disp(eigVec);