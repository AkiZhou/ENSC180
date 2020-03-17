A=magic(4);
B=[A 2*A;A^2 A+2];

SumRows=sum(B,2)
SumCols=sum(B)
SumDiagonals=[trace(B),trace(fliplr(B))]
