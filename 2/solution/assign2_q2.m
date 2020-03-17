% input student's grade
clear;
x = [73 92 65 41 37 80 67 54 90 82 85 69 76 74 82 87 69 78 85];
size = numel(x);
y = cell(1,size);

for i = 1:size
    if x(i)>= 90;
        y{i} = 'A+';
    elseif 80<=x(i) && x(i)<=89;
        y{i} = 'A';
    elseif 75<=x(i) && x(i)<=79;
        y{i} = 'B+';
    elseif 68<=x(i) && x(i)<=74;
        y{i} = 'B';
    elseif 60<=x(i) && x(i)<=67;
        y{i} = 'C+';    
    elseif 50<=x(i) && x(i)<=59;
        y{i} = 'C';        
    elseif 40<=x(i) && x(i)<=49;
        y{i} = 'D';
    else
        y{i} = 'F';  
    end
end        

score = x
grade = y
