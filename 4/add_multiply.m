%This function add and multiply two matrices
function add_multiply(M1,M2)

[row1,cols1]=size(M1);
[row2,cols2]=size(M2);

%Addition
if row1==row2 && cols1==cols2
    sum=zeros(row1,cols1); %Initialize sum
    for i=1:row1
        for j=1:cols1
            sum(i,j)=M1(i,j)+M2(i,j);
        end
    end
    disp('Sum'); disp(sum);
else
    fprintf('ERROR: Illegal operation; Addition invalid\nMatrices must be of the same size\n');
end
fprintf('\n');

%Multiplication
if cols1~=row2 || row1==0 || row2==0
    fprintf('ERROR: Illegal operation; Multiplication invalid\nThe number of columns in first matrix should be equal to the number of rows in the second\n');
else
    product=zeros(row1,cols2); %Initialize product
    for i=1:row1
        for j=1:cols2
            dotp=0;
            for k=1:cols1
                dotp=dotp+M1(i,k)*M2(k,j);
            end
            product(i,j)=dotp;
        end
    end
disp('Product'); disp(product);
end