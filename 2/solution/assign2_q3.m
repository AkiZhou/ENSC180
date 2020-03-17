clear;

% prompt user for input
prompt1 = 'Input the drag force, F, in (N): ';
F = input(prompt1);
prompt2 = 'Input air velocity, V: in (km/h) ';
V = input(prompt2);
prompt3 = 'Input air density, p: in (kg/m3) ';
p = input(prompt3);
prompt4 = 'Input surface area, A: (m2) ';
A = input(prompt4);

% calculate coefficient
C = F/(p*V^2*A/2);
message = ['The drag coefficient is: ', num2str(C)];
disp(message);

% define a new vector
newV = 0:1:300;
% calculate and plot
newF = C.*(p.*newV.^2.*A);
plot(newV,newF)
title('Drag force plot')
xlabel('Velocity (km/h)')
ylabel('Drag Force (F)')