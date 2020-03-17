M=magic(6);

SumRows=sum(M,2)
SumCols=sum(M)
SumDiagonals=[trace(M),trace(fliplr(M))] %[M(1,1)toM(6,6) M(1,6)toM(6,1)]

