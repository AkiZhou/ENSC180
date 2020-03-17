function s = short_term(hours)
    if hours == 0
        s = 0;
    elseif hours > 0 && hours <= 0.5
        s = 2.5;
    else
        rem = hours - 0.5;
        pay_rem = ceil(rem/0.25)*1;
        s = 2.5 + pay_rem;
        % if exceed maximum payment, just use max
        if s >= 25
            s = 25;
        end
    end 
end