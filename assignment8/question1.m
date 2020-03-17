syms t

Ac=1; %carrier amplitude
fc=1; %carrier frequency
S=Ac*cos(2*pi*fc*t);%carrier signal shape 

Am=1; %message amplitude
fm=0.02; %message frequency
%fm<<fc
M=Am*cos(2*pi*fm*t);%message signal shape 

%AM modulation
S_AM=Ac*(1+M)*cos(2*pi*fc*t);
%FM modulation
kf=1; %frequency sensitivity
S_FM=Ac*cos(2*pi*fc*t + 2*pi*kf*Am*int(M,0,t));

TitleArray=["message signal","carrier signal","AM wave","FM wave"];
FunctionArray=[M,S,S_AM,S_FM];

for i=1:4
    subplot(4,1,i)
    fplot(FunctionArray(i))
    title(TitleArray(i))
    grid
    xlim([-50,50])
    ylim([-2,2])
end
