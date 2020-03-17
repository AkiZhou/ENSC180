clear

Kn = 100; %A/V^2
WL = 5; %unitless
Vt = 1; %volt
lambda = 0.01;

Vds = 0:0.01:5;
Vg = 0;

for i = 1:10
    ID = zeros;
    if i > 1
        Vg = Vg + 0.5;
    end
    for j = 1:501
        
        if Vg < Vt
            ID(j) = 0;
        else
            
            if Vds(j) <= Vg - Vt
                ID(j) = 0.5*Kn*(WL)*(2*(Vg-Vt)*Vds(j)-(Vds(j)^2));
            
            elseif Vds(j) > Vg - Vt
                ID(j) = 0.5*Kn*(WL)*((Vg-Vt)^2)*(1+lambda*Vds(j));
            end     
        end
    end
    
    plot(Vds, ID)
    xlim([0,4.5])
    title('Current vs Volatge Drain')
    ylabel('Current(A)')
    xlabel('Voltage-Drain Source(V)')
    grid
    grid minor
    hold on
end
legend('Vgs=0','Vgs=0.5V','Vgs=1.0V','Vgs=1.5V','Vgs=2.0V','Vgs=2.5V','Vgs=3.0V','Vgs=3.5V','Vgs=4.0V','Vgs=4.5V')
grid
hold off
