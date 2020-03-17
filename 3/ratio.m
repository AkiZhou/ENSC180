%This function calculates the rate of h/r VS Ps/P0
%The function can use an arbitrary radius in this case 4
%The maximum of the depth is the diameter of the sphere
%variables are listed below
%radius is the radius of the sphere
%h is the depth submerged
%ration_PsP0 is Ps/P0
%ration_hr is h/r
function ratio
radius=4; %An arbitrary radius
h=0:0.01:(radius*2);
ratio_PsP0=(3.*radius.*(h.^2)-(h.^3))./(4.*(radius.^3)); %Ps/P0 in terms of r and h
ratio_hr=h./radius; 

plot(ratio_PsP0,ratio_hr)
grid
xlabel('Ps/P0')
ylabel('h/r')
end