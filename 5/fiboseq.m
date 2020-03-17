function fiboseq
%prompt
NUM1=input('enter the first number in the sequence\n');
NUM2=input('enter the second number in the sequence\n');
index=input('enter the total number of elements in the sequence\n');

if NUM2==0
    error('The second number cannot be 0');
elseif index<=3
    error('Please allow more than 3 numbers to be in the sequence');
end

f=zeros(1,index); %initialize sequence array
%assign the first two numbers
f(1)=NUM1; 
f(2)=NUM2;

%calculate the sequence from the 3rd number
for i=3:index
    f(i)=f(i-1)+f(i-2);
end

x=1:index; %element number array
polarplot(x,f(x))

fprintf('Function paused\nPress any key to continue to ratios\n');
pause

g=zeros(1,index-1); %initialize ratio array

%calculate the ratio
for i=1:index-1
    g(i)=f(i+1)/f(i);
end

y=1:index-1; %element number array
plot(y,g)
grid on
grid minor
ylabel('ratio')