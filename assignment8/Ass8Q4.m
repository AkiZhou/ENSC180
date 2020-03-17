%Assignment 8, Q4
%Name: Mudassir Noor
%Student ID: 301338172
%Lab Group 9

A = [0 1;-5 -2];
B = [0;1];
%No C or D values present
C = [];
D = [];
%(a)
x0 =[5 3]; %Initial position and velocity of x1
%As the initial function calculates the UNFORCED RESPONSE, B = 0
sys = ss(A,[],C,D);

%Solving the equation in the matrix for the given initial conditions, 
%the initial velocity of x1 = the initial position of x2
%The y outputs are all 0 as it is not affected (C = 0, no y equation)
figure(1)
[y,t,x]=initial(sys,x0);
%Gives the plot of x1 with time
plot(t,x(:,1),'linewidth',1.2);
title('Initial Function: X1 with time');
xlabel('Time(s)');
ylabel('X1(t)');
grid on; grid minor;

%(b)
%Zero initial conditions
%Plots x with time for the entire system
figure(2)
sys1 = ss(A,B,C,D);
[y1,t1,x1] = step(sys1);
plot(t1,x1,'linewidth',1.2);
legend('X1','X2','Location','northwest');
title('Step Function');
xlabel('Time(s)');
ylabel('X(t)');
grid on; grid minor;

%Excitation of magnitude 10
figure(3)
B = 10*[0;1];
sys2 = ss(A,B,C,D);
[y2,t2,x2] =step(sys2);
plot(t2,x2,'linewidth',1.2);
title('Step Function with excitation = 10');
xlabel('Time(s)');
ylabel('X(t)');
legend('X1','X2','Location','northwest');
grid on; grid minor;