clear
clc

LengthWire=5; %m
RadiusWire=0.002; %m
Density=2.6989e06; %g/m^3
MeltingPoint=660.37+273.15; %K 
ElectricalResistivity=2.6548e-08; %Ome-m
T0_inK=20+273.15; %K
SpecificHeat=0.215*4.184; %j/gK

t=0:0.01:7200;
for I=34:0.001:36
    Resistance=ElectricalResistivity*LengthWire/(pi*RadiusWire^2);
    Power=I.^2.*Resistance;
    Energy=Power.*t;
    VolumeWire=pi.*RadiusWire.^2.*LengthWire;
    Mass=VolumeWire.*Density;
    dT=Energy./(Mass.*SpecificHeat);
    T=T0_inK+dT;
 if max(T)>=MeltingPoint
     fprintf('The maximum current= %0.3f A\n',I);
     break
 end
end
