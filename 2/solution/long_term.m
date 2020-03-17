function long = long_term(hours)
    if hours == 0
        long = 0;
    elseif hours > 0 && hours <= 3
        long = 10;
    else
        rem = hours - 3;
        pay_rem = ceil(rem/1)*3;
        long = 10 + pay_rem;
        % if exceed maximum payment, just use max
        if long >= 18
            long = 18;
        end
    end 
end