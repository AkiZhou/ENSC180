A=input('Enter a 3x3 matrix\n');
[rows,cols]=size(A);
if rows~=3 || cols~=3
    error('The size of matrix is not 3x3');
end

a=-1;
b=A(1,1)+A(2,2)+A(3,3);
c=A(1,3)*A(3,1)+A(2,3)*A(3,2)+A(1,2)*A(2,1)-A(1,1)*A(3,3)-A(1,1)*A(2,2)-A(2,2)*A(3,3);
d=A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)+A(1,3)*A(2,1)*A(3,2)-A(1,3)*A(2,2)*A(3,1)-A(1,1)*A(2,3)*A(3,2)-A(1,2)*A(2,1)*A(3,3);
P=[a b c d];
eigVal=roots(P);

disp('eigenvalues'); disp(eigVal');

eigVec=zeros(3);
a=A(1,1);e=A(2,2);b=A(1,2);c=A(1,3);f=A(2,3);
for j=1:3
   l=eigVal(j);
   C=[a-l,b;b,e-l];
   B=[-c;-f];
   eigVec(:,j)=[C\B;1];
end

disp('eigenvectors'); disp(eigVec);
