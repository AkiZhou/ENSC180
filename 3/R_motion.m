R%This function calculates the height and speed of a rocket at a given time
%height is given by 2.13*time^2 - 0.0013*time^4 + 0.000034*time^4.751
%speed is given by the absolute value of the 1st order derivative of height with respect to time
function R_motion(time)
if time > 63.01
    error('The rocket lands approximately at t=63.01s. Time must be less than 63.01s');
end
height=2.13*time^2 - 0.0013*time^4 + 0.000034*time^4.751;
speed=abs(4.26*time - 0.0052*time^3 + 0.000161534*time^3.751);

fprintf('Height=%f (m)\nSpeed=%f (m/s)\n', height, speed);
end