clear
clc

V=3:4:133;
M=[0 2 0; 8 0 3; 0 0 5];

a=M+3*(M~=0 & M<5)
b=V+2*(mod(V,7)==0)

copy=V';
copy=num2str(copy)-'0'; %break down numbers into its component digits
[row,col]=find(copy==7); %identify the index of number which contains 7
c=sort(V(row))

Num1=input('Enter the 1st number of v1\n');
Num2=input('Enter the 2nd number of v1\n');
%increment=difference between 1st and 2nd number
%increment may be negative
increment=Num2-Num1;
%calculate the last number of an array of length 30
NumEnd=Num1+increment*29;
%Create an array
v1=Num1:increment:NumEnd;
%Create two copies of v1
copy1=v1;
copy2=v1;
%modify copies to satisfy the following
%-length of the two copy arrays are the same
%-copy2 starts with the 2nd element of copy1 and follows the same sequence
copy1(30)=[];
copy2(1)=[];
%the sum of copy1 and copy2 is an array of v1's consecutive numbers
v2=copy1+copy2

