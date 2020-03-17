x = -2*pi:0.01:2*pi;
y = x - cos(x);
plot(x,y)
grid
xlabel('x')
ylabel('x-cos(x)')
for i=1:1256
    %Product of y(i)*y(i+1)=negative when graph crosses x-axis
    if y(i)*y(i+1) < 0
        disp(x(i))
    end
end