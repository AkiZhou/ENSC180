 A=[0 1;-5 -2];
 B=[0;1];
 C=[1 0];
 D=0;
 
 sys = ss(A,B,C,D);
 
 %a
 x0 = [5;3]; %initial position=5, initial velocity=3
 
 figure
 initial(sys,x0);
 xlim([0 10])
 title("Position of mass; x(0)=5, x'(0)=3")
 xlabel('Time')
 ylabel('Position')
 grid
 
 %b
 opt = stepDataOptions('StepAmplitude',10);
 
 figure 
 hold on
 step(sys)
 step(sys,opt)
 xlim([0 10])
 title('Position of mass; zero initial conditions & external excitation f(t)=10')
 legend('zero initial conditons','zero initial conditons & f(t)=10')
 xlabel('Time')
 ylabel('Position')
 grid
 hold off

 