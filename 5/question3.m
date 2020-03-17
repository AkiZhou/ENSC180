syms t positive %allow only positive numbers for time
h=-4.9.*t.^2+125*t+500;
v=-9.8*t+125; %1st derivative of h
a=-9.8; %2nd derivative of h

land=double(solve(h,t)); %land: landing time
fprintf('Landing time: %0.2fs\n',land);

fplot(h,'r',[0,land])
hold on
fplot(v,'g',[0,land])
fplot(a,'b',[0,land])
hold off
legend('Height','Velocity','Acceleration')
xlabel('Time')
grid on
grid minor


