x = -2*pi:0.01:2*pi;
y = x - tan(x);
plot(x,y)
grid
xlabel('x')
ylabel('x-tan(x)')
for i=1:1256
    if y(i)<1 && y(i+1) <1 %Prevent asymptotes to be counted as roots
        %Product of y(i)*y(i+1)=negative when graph crosses x-axis
        if y(i)*y(i+1) < 0 
            disp(x(i))
        end
    end
end
