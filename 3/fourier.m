k=1;
series = 0;
x = -pi:0.001:pi;

for n=1:100 %sum of series from n=1 to n=100
    series = series + sin(n.*x).*(2.*k.*(1-cos(n.*pi))./(n.*pi));
end

plot(x, series)
grid
xlabel('2\pi')
ylabel('f(x)')