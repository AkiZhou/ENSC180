%perform Gauss elimination for a general system of form [A]{x} = {b}
A=input ('Enter Matrix [A]\n');
b=input ('Enter a column of [b]\n'); 

[row1,cols1]=size(A);
row2=size(b);

if row1~=row2
    error('Invalid operation: Matrices have different heights\n');
elseif rank(A)<row1
    error('No unique solution: system is under defined\n');
elseif rank(A)>row1
    error('Infinite solutions: system is over defined\n');
else
    n=row1;
end

%create upper triangular matrix 
s=0;
for j=1:n-1 
    if A(j,j)==0
        k=j;
        for k=k+1:n
            if A(k,j)==0
                continue 
            end
            break
        end
        B=A(j,:); C=b(j); 
        A(j,:)=A(k,:); b(j)=b(k);
        A(k,:)=B; b(k)=C;
    end
    for i=1+s:n-1
        L=A(i+1,j)/A(j,j);
        A(i+1,:)=A(i+1,:)-L*A(j,:);
        b(i+1)=b(i+1)-L*b(j);
    end
    s=s+1;
end 

%Solution of equations
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n 
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(1/A(i,i))*(b(i)-sum);
end

fprintf('solution of linear equations\n');
disp(x');




