clear
clc

syms t
h= -0.12*t^4+12*t^3-380*t^2+4100*t+220;
v= diff(h);
a= diff(h,2);

%plotting
fplot(h,'r',[0 60])
hold on
fplot(v,'g',[0 60])
fplot(a,'b',[0 60])
grid on
grid minor
xlabel('time')
legend('height','velocity','acceleration')
hold off

%calculation for time and height
possible_maxh_time= double(solve(v));
for i=1:(size(possible_maxh_time)-1)
    if subs(h,t,possible_maxh_time(i+1)) > subs(h,t,possible_maxh_time(i))
      MaxHeightTime= possible_maxh_time(i+1);
      MaxHeight= double(subs(h,t,MaxHeightTime));
    end
end

MaxHeight
MaxHeightTime

landing_time= double(solve(h))
