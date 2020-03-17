Fd=input('Enter the drag force\n');
p=input('Enter the air density\n');
V=input('Enter the velocity\n');
A=input('Enter the surface area\n');

Cd=Fd/(p*V^2*A/2); %Calculate Cd from inputed data
fprintf('Drag coefficient=%d',Cd);
V=0:1:300;
Fd=Cd.*p.*(V.^2).*A./2;
plot(V,Fd)
grid
xlabel('Velocity')
ylabel('Drag Force')