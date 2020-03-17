clear;
% set t to be 1 second accuracy
t = 0:1:100;
H = 2.13.*(t.^2) - 0.0013.*(t.^4)+0.000034.*(t.^4.751);

% find the time reaches to maximum
[maxHeight,t_maxHeight] = max(H(:));

% compute for landing time
% flip all negative values
H2 = abs(H);
[B,I] = sort(H2);
size = numel(I);
i = 1;
while i<=size
    if I(i) >= t_maxHeight
       landingtime = I(i);
       break;
    end
    i = i+1;
end

message1 = ['Rocket reaches to maximum height at :', num2str(t_maxHeight), ' seconds.'];
disp(message1);
message2 = ['Rocket falls to ground at:', num2str(landingtime), ' seconds.'];
disp(message2);

% plotting
trajectory = H(1:landingtime);
t_new = t(1:landingtime);
plot(t_new, trajectory)
title('Rocket trajectory')
xlabel('Time (s)')
ylabel('Height (m)')

