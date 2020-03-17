clear
clc

LengthWire=5; %m
Current=8.4; %A
RadiusWire=0.002; %m
Density=2.6989e06; %g/m^3
MeltingPoint=660.37+273.15; %K 
ElectricalResistivity=2.6548e-08; %Ome-m
T0_inK=20+273.15; %K
SpecificHeat=0.215*4.184; %j/gK

t=0:0.01:7200;
Resistance=ElectricalResistivity*LengthWire/(pi*RadiusWire^2);
Power=Current^2*Resistance;
Energy=Power.*t;
VolumeWire=pi.*RadiusWire.^2.*LengthWire;
Mass=VolumeWire.*Density;
dT=Energy./(Mass.*SpecificHeat);
T=T0_inK+dT;

plot(t,T)
title('Change in temperature over time')
xlabel('Time (Second)')
ylabel('Temperature (Kelvin)')
grid on
grid minor

counter=0;
for i=1:length(t)
    if T(i)>=MeltingPoint
        fprintf('The temperature does reach the melting point at\nt= %.2f\n',t(i));
        break
    end
    counter=counter+1;
end

if counter==length(t)
    fprintf('The temperature does not reach the melting point\n');
end
