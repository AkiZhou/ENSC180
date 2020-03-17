syms x y
y=(2*x^4-x^2+x-1)/(x^2-2);
D1=simplify(diff(y)); %1st derivative of y
D2=simplify(diff(y,2)); %2nd derivative of y
D3=simplify(diff(y,3)); %3rd derivative of y
D4=simplify(diff(y,4)); %4th derivative of y

fplot(y,'r')
xlim([-3,3])
ylim([-200,200])
grid on
grid minor
hold on
fplot(D1,'g')
fplot(D2,'b')
title("y,y',y'' ; y=(2*x^4-x^2+x-1)/(x^2-2)")
xlabel('x')
ylabel('y')

%find local maxima & minima
%initialize x-coordinates array
Maxima=[];
Minima=[];
InflectionP=[];
%initialize y-coordinates array
Maximaf=[];
Minimaf=[];
InflectionPf=[];
%find critical points for y y' y''
%values are converted from sym to double 
%complex answers are ignored
criticalP_y=double(solve(D1));
index_y=find(imag(criticalP_y)==0);
criticalP_y=criticalP_y(index_y);

criticalP_D1=double(solve(D2));
index_D1=find(imag(criticalP_D1)==0);
criticalP_D1=criticalP_D1(index_D1);

criticalP_D2=double(solve(D3));
index_D2=find(imag(criticalP_D2)==0);
criticalP_D2=criticalP_D2(index_D2);
%concavities at critical points
concavity_y=double(subs(D2,x,criticalP_y));
concavity_D1=double(subs(D3,x,criticalP_D1));
concavity_D2=double(subs(D4,x,criticalP_D2));

for i=1:3 %for loop to repeat the same process for y y' y''
   switch i
        case 1
            criticalP=criticalP_y;
            concavity=concavity_y;
            index=index_y;
            f=y;
        case 2
            criticalP=criticalP_D1;
            concavity=concavity_D1;
            index=index_D1;
            f=D1;
        case 3
            criticalP=criticalP_D2;
            concavity=concavity_D2;
            index=index_D2;
            f=D2;
   end
    
   %determine each critical point is either max or min or inflection point
    for j=1:length(index)
        if concavity(j)<0 %max
            Maxima=[Maxima ; criticalP(j)];
            Maximaf=[Maximaf ; double(subs(f,criticalP(j)))];
        elseif concavity(j)>0 %min
            Minima=[Minima ; criticalP(j)];
            Minimaf=[Minimaf ; double(subs(f,criticalP(j)))];
        else %inflection point
            InflectionP=[InflectionP ; criticalP(j)];
            InflectionPf=[InflectionPf ; double(subs(f,criticalP(j)))];
        end
    end
end

fprintf('Maxima at\n\tx\ty\n'); disp([Maxima     Maximaf]);
plot(Maxima, Maximaf,'ro')
fprintf('Minima at\n\tx\ty\n'); disp([Minima     Minimaf]);
plot(Minima, Minimaf,'bo')

%find inflection points
InflectionP_y=double(solve(D2));
index_y=find(imag(InflectionP_y)==0);
InflectionP_y=InflectionP_y(index_y);

InflectionP_D1=double(solve(D3));
index_D1=find(imag(InflectionP_D1)==0);
InflectionP_D1=InflectionP_D1(index_D1);

InflectionP_D2=double(solve(D4));
index_D2=find(imag(InflectionP_D2)==0);
InflectionP_D2=InflectionP_D2(index_D2);

InflectionP=[InflectionP ; InflectionP_y ; InflectionP_D1 ; InflectionP_D2];
InflectionPf=[InflectionPf ; double(subs(y,InflectionP_y)) ; double(subs(D1,InflectionP_D1)) ; double(subs(D2,InflectionP_D2))];

fprintf('Inflection points at\n\tx\ty\n'); disp([InflectionP     InflectionPf]);
plot(InflectionP, InflectionPf,'go')

%find vertical asymptotes
for k=1:3
    switch k
        case 1
            [num,den]=numden(y);
        case 2
            [num,den]=numden(D1);
        case 3
            [num,den]=numden(D2);
    end
    
    asymptotes=double(solve(den));
    
end
plot(asymptotes,0,'kx')
fprintf('Vertical asymptotes at x=\n'); disp(asymptotes);

legend('y',"y'","y''",'Maxima','Minima','Inflection points','asymptotes')
hold off
