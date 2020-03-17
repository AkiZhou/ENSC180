clear;
p1 = [4 1.5 6 0.75 12 72 0 0 4 2.75];
p2 = [48 0 5.5 1 3 2 1.5 2.5 4 1.5];
p3 = [1 1.5 5 8 1.5 2 1.5 1.75 12 2];
P = [p1 p2 p3];

% define short_term() to calculate short_term payment for 1 day
% define long_term() to calculate long_term payment for 1 day

size = numel(P);
for i = 1:size
    % if more than 1 day, calculate the remaining hours and count for total
    % payment
    if short_term(P(i)) >= 25
        wholedays = floor(P(i)/24);
        remainhours = mod(P(i),24);
        total_pay_short(i) = wholedays*25 + short_term(remainhours);
    else
    % if within 1 day, call function directly
        total_pay_short(i) = short_term(P(i));
    end
end

for i = 1:size
    % if more than 1 day, calculate the remaining hours and count for total
    % payment
    if long_term(P(i)) >= 18
        wholedays = floor(P(i)/24);
        remainhours = mod(P(i),24);
        total_pay_long(i) = wholedays*18 + long_term(remainhours);
    else
    % if within 1 day, call function directly
        total_pay_long(i) = long_term(P(i));
    end
end

for i = 1:size
    choice(i) = min(total_pay_short(i),total_pay_long(i));
    if choice(i)==total_pay_short(i)
        useshort(i) = 1;
        uselong(i) = 0;
    else 
        useshort(i) = 0;
        uselong(i) = 1;
    end
end

payment_summary = vec2mat(choice,10)
p1_total = sum(payment_summary(1,:));
p2_total = sum(payment_summary(2,:));
p3_total = sum(payment_summary(3,:));
total_payment_ten_days = [p1_total p2_total p3_total]'