%This function plot height and velocity as a function of time from t=0 to
%t=63.01(the landing time)
%height is given by 2.13*time^2 - 0.0013*time^4 + 0.000034*time^4.751
%speed is given by the absolute value of the 1st order derivative of height with respect to time
function R_motionplot
time=0:0.01:63.01;

height=2.13.*time.^2 - 0.0013.*time.^4 + 0.000034.*time.^4.751;
velocity=4.26.*time - 0.0052.*time.^3 + 0.000161534.*time.^3.751;

s(1) = subplot(2,1,1);
height=2.13.*time.^2 - 0.0013.*time.^4 + 0.000034.*time.^4.751;
plot(time,height,'b')
grid
title('Height as a function of Time')
xlabel('Time (s)')
ylabel(s(1),'Height (m)')

s(2) = subplot(2,1,2);
velocity=4.26.*time - 0.0052.*time.^3 + 0.000161534.*time.^3.751;
plot(time,velocity,'r')
grid
title('Velocity as a function of Time')
xlabel('Time (s)')
ylabel(s(2),'Velocity (m/s)')
end