x=[0 0.005 0.0075 0.0125 0.025 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]';
yu=[0 0.0102 0.0134 0.017 0.025 0.0376 0.0563 0.0812 0.0962 0.1035 0.1033 0.095 0.0802 0.0597 0.034 0]';
yl=[0 -0.0052 -0.0064 -0.0063 -0.0064 -0.006 -0.0045 -0.0016 0.001 0.0036 0.007 0.0121 0.017 0.0199 0.0178 0]';

%a)
xx=min(x):0.001:max(x);
yyu=spline(x,yu,xx);
yyl=spline(x,yl,xx);
plot(xx,yyu,'r',xx,yyl,'b')
ylim([-0.3,0.3])
grid on
grid minor
title('air foil - cubic splines interpolation')
legend('upper surface','lower surface')

%b)
figure
for i=1:4
    switch i
        case 1
            degree=4;
        case 2
            degree=8;
        case 3
            degree=12;
        case 4
            degree=14;
    end
    
    xxx=min(x):0.0000001:max(x);
    UpperPolyFit=polyval(polyfit(x,yu,degree),xxx);
    LowerPolyFit=polyval(polyfit(x,yl,degree),xxx);
    subplot(4,1,i)
    plot(xxx,UpperPolyFit,'r',xxx,LowerPolyFit,'b')
    ylim([-0.1,0.15])
    grid on
    grid minor
    title(['air foil - polynomial interpolation degree ' num2str(degree)])
end
