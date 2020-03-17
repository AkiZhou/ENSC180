%plot three curves at three temps of voltage of a diode vs current of a diode
syms Vd

K = 1.38*10^-23; %in j/k
q = 1.6*10^-19; %in C
T=[-75 25 75]; %temperature in Kelvin
Is = 10^-12;%reverse current in A
n = 1;


for i=1:3
    Vt = K*(273+T(i))/q; %thermal voltage in V
    Id = Is*(exp(Vd/(n*Vt))-1);

    subplot(3,1,i)
    fplot(Id,[0,0.8])
    title(['Forward diode current vs Diode voltage at T= ',num2str(T(i)),'Celsius'])
    xlabel('Vd(V)')
    ylabel('Id(A)')
    grid
    grid minor
end