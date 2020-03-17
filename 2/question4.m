t = 0:0.01:70; %Choose a random range of t to see the tendency of polynomial
H = 2.13.*t.^2 - 0.0013.*t.^4 + 0.000034.*t.^4.751;
MaxHeight=max(H);
fprintf('Max Height = %f\n',MaxHeight)
for i=2:7000
    %Height is at max when the heights right before and after are lower
    if  H(i+1)<H(i) && H(i-1)<H(i)
        fprintf('Time to reach max height= %f\n',t(i))
        TimeMaxHeight=t(i);
    %Producet of H(i)*H(i+1)=negative when graph crosses x-axis 
    elseif H(i)*H(i+1) < 0
        fprintf('Time landing= %f\n',t(i))
        TimeLanding=t(i);
    end
end

clear t
clear H

t=0:0.01:TimeLanding; 
H = 2.13.*t.^2 - 0.0013.*t.^4 + 0.000034.*t.^4.751;
plot(t,H)
grid
xlabel('Time(seconds)')
ylabel('Height(meters)')