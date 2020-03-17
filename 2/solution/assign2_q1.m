% Plot cos(x) and tan(x)
x = -2:0.1:2;
y1 = cos(x);
plot(x,y1);
title('cos(x) within -2pi to 2pi')

y2 = tan(x);
figure
plot(x,y2,'--');
title('tan(x) within -2pi to 2pi')

% solve the equations
syms x;
eqn1 = cos(x)==x;  eqn2 = tan(x)==x;
soln1 = solve(eqn1, x);  soln2 = solve(eqn2, x);
% set the precision digits
digits(2);
soln1 = vpa(soln1)
soln2 = vpa(soln2)

