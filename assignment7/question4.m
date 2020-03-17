clear

x=[805 825 845 865 885 905 925 945 965 985];
y=[0.710 0.763 0.907 1.336 2.169 1.598 0.916 0.672 0.615 0.606];

%cubic spline interpolation
xx=min(x):0.01:max(x);
yy=spline(x,y,xx);

%9th order polynomial fit
xxx=min(x):0.0001:max(x);
PolyFit_9th=polyval(polyfit(x,y,9),xxx);

plot(x,y,'k*',xx,yy,xxx,PolyFit_9th);
grid on
grid minor
title('Cubic spline interpolation & 9th order polynomial fit')
xlabel('x')
ylabel('y')
legend('Data set','Cubic spline curve','9th order polynomial fit')