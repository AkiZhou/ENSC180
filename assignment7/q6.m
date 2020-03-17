tspan=[0,20]; %time scale

y0=0;
dy0=0;

[t, y] = ode45(@f,tspan,[y0 dy0]);
plot (t,y(:,1)); 
title('y(t); \omega=1 rad/s')
xlabel('t'); ylabel('y');

figure
[t, y] = ode45(@f2,tspan,[y0 dy0]);
plot (t,y(:,1)); 
title('y(t); \omega=5 rad/s')
xlabel('t'); ylabel('y');

figure
[t, y] = ode45(@f3,tspan,[y0 dy0]);
plot (t,y(:,1)); 
title('y(t); \omega=10 rad/s')
xlabel('t'); ylabel('y');

function dy=f(t, x)

        omega=1;
        dxdt=x(2);
        dx2dt=(1/3)*(10*sin(omega*t)-75*x(1));

        dy=[dxdt; dx2dt];
        
end

function dy=f2(t, x)

        omega=5;
        dxdt=x(2);
        dx2dt=(1/3)*(10*sin(omega*t)-75*x(1));

        dy=[dxdt; dx2dt];
        
end

function dy=f3(t, x)

        omega=10;
        dxdt=x(2);
        dx2dt=(1/3)*(10*sin(omega*t)-75*x(1));

        dy=[dxdt; dx2dt];
        
end