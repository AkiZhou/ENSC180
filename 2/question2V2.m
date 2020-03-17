x=[73,92,65,41,37,80,67,54,90,82,85,69,76,74,82,87,69,78,85];
grade=strings([1,19]); %Initialize grade as an empty string array
disp('    Mark    Grade')
for i=1:19
    %Assign a letter grade for the corresponding grade
    if x(i) >= 90
       grade(i)= 'A+';
    elseif x(i)>=80
       grade(i)= 'A';
    elseif x(i)>=75
       grade(i)= 'B+';
    elseif x(i)>=68
       grade(i)= 'B';
    elseif x(i)>=60
       grade(i)= 'C+';
    elseif x(i)>=50
       grade(i)= 'C';
    elseif x(i)>=40
       grade(i)= 'D';
    else
       grade(i)= 'F';      
    end
end
disp([x' grade'])