x=-1:0.001:1;
LegendreP=(693.*x.^6-945.*x.^4+315.*x.^2-15)./48;
ChebyshevP=32.*x.^6-48.*x.^4+18.*x.^2-1;
fprintf('Roots\tLegendre\tChebyshev\n');
plot(x,LegendreP,'b',x,ChebyshevP,'r')
grid
legend('Legendre Polynomial','Chebyshev Polynomial')

for i=1:2000
    if LegendreP(i)*LegendreP(i+1)<0 %Product is negative if function crosses x-axis
        fprintf('\t%.3f\n',x(i));
    elseif ChebyshevP(i)*ChebyshevP(i+1)<0
        fprintf('\t\t\t%f.3\n',x(i));
    end
end