x=[73,92,65,41,37,80,67,54,90,82,85,69,76,74,82,87,69,78,85];
fprintf('Mark\tGrade\n');
for i=1:19
    if x(i) >= 90
       fprintf('%d\tA+\n',x(i));
    elseif x(i)>=80
       fprintf('%d\tA\n',x(i));
    elseif x(i)>=75
       fprintf('%d\tB+\n',x(i));
    elseif x(i)>=68
       fprintf('%d\tB\n',x(i));
    elseif x(i)>=60
       fprintf('%d\tC+\n',x(i));
    elseif x(i)>=50
       fprintf('%d\tC\n',x(i));
    elseif x(i)>=40
       fprintf('%d\tD\n',x(i));
    else
       fprintf('%d\tF\n',x(i));      
    end
end

