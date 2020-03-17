%This function calculates the depth of a sphere submerged in fluid by
%following steps
%1.prompting for radius of sphere, the densities of sphere and fluid
%2.calculate the volume submerged using the inputed values and with
%different values of depth
%3.Take the difference of the volumes from two different calculations done
%in 2. to find the root (difference <= eps)
%variables are listed below 
%depth is the depth the sphere sinks
%radius is the radius of the sphere
%densityS and densityF are the densities of sphere and fluid respectively
%volumeSub is the volume of sphere below fluid calculated using Eqn1
function depth=depthSub
%Prompt for inputs
radius=input('Enter the radius of sphere (mm)\n');
densityS=input('Enter the density of sphere (g/mm^3)\n');
densityF=input('Enter the density of fluid (g/mm^3)\n');
if densityS > densityF
    error('This program is not designed for cases when the sphere keeps sinking; density of sphere <= density of fluid');
end
%Calculations
volumeSub=(densityS/densityF)*((4/3)*pi*(radius^3)); %Eqn1

h=0:0.01:(radius*2);
difference=(pi.*(3.*radius.*(h.^2)-(h.^3)))./3-(volumeSub); %Eqn2 - Eqn1

for i=1:(radius*2/0.01)
    if densityS==densityF
        depth=radius*2;
    elseif difference(i)*difference(i+1)<0
        depth=h(i);
    end
end
fprintf('The sphere depth below the fluid surface is: %.2f (mm)\n',depth);
end