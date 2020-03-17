%declare variables
A = [4 3 1;3 7 -1; 1 -1 9];
alpha = 0:0.001:10;

determinant = -alpha.^3+20*alpha.^2-116*alpha+154;

for i = 1 : 10000
    if determinant(i)*determinant(i+1) <= 0
        disp('One of the roots is ')
        disp(i*0.001)
    end
end

plot(alpha,determinant)
grid MINOR
title('alpha vs determinant[A-alphaI]')
xlabel('alpha')
ylabel('determinant[A-alphaI]')
