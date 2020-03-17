T1=[4.0,1.5,6.0,0.75,12.0,72.0,0.0,0.0,4.0,2.75];
T2=[48.0,0.0,5.5,1.00,3.00,2.00,1.5,2.5,4.0,1.5];
T3=[1.0,1.5,5.0,8.0,1.5,2.0,1.5,1.75,12.0,2.0];
T=[60*T1;60*T2;60*T3]; %Convert hours to minutes
Cost=zeros(1,3); %Initialize cost

for person=1:3
    fprintf('Person%d\n',person)
    for day=1:10
        fprintf('Day%d, ',day)
        Minutes=(mod(T(person,day),1440)); %Minutes left after subtracting the time counted as a day(Days)
        Days=(T(person,day)-Minutes)/1440; %# of days in the hours
        if Minutes>300 %If minutes >300 long term daily max is the cheapest
            Cost(person)=Cost(person)+(Days*18)+18;
            fprintf('cost=%d, LT max\n',Cost(person));
        elseif Minutes==0 %If minutes is 0 there is no charge except daily charges
            Cost(person)=Cost(person)+(Days*18);
            fprintf('cost=%d, No minute wise charge\n',Cost(person));
        elseif Minutes<=135 %If minutes is <=135 short term is cheaper than long term
            if Minutes<=30 %If minutes is <=30 no additional charge
                Cost(person)=Cost(person)+(Days*18)+2.5;
                fprintf('cost=%d, ST min\n',Cost(person));
            elseif mod((Minutes-30),15)==0
                Charges=(Minutes-30)/15;
                Cost(person)=Cost(person)+(Days*18)+2.5+(Charges*1);
                fprintf('cost=%d, ST\n',Cost(person));
            else
                Charges=(Minutes-30-mod((Minutes-30),15))/15+1;
                Cost(person)=Cost(person)+(Days*18)+2.5+(Charges*1);
                fprintf('cost=%d, ST\n',Cost(person));
            end
        else %If 135<minutes<=300 long term is cheaper than short term
            if Minutes<=180 %If 135<minutes<=180 no additional charge
                Cost(person)=Cost(person)+(Days*18)+10;
                fprintf('cost=%d, LT min\n',Cost(person));
            elseif mod((Minutes-180),60)==0
                Charges=(Minutes-180)/60;
                Cost(person)=Cost(person)+(Days*18)+10+(Charges*3);
                fprintf('cost=%d, LT \n',Cost(person));
            else
                Chrges=(Minutes-180-mod((Minutes-180),60))/60+1;
                Cost(person)=Cost(person)+(Days*18)+10+(Charges*3);
                fprintf('cost=%d, LT \n',Cost(person));
            end
        end
        if mod(day,7)==0 && Cost(person)>80 %If the sum over 7 days>80 apply weekly max
            Cost(person)=80;
            fprintf('weekly max applied\n');
        end
    end
end

fprintf('\nThe minimum costs are\nPerson 1= %d\nPerson 2= %d\nPerson 3= %d\n',Cost(1),Cost(2),Cost(3))