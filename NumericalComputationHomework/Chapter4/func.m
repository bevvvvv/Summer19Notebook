function v=func(x)
    %v = exp(-1.*x);
    %v = cos(2.*x).*exp(-1.*x);
    %v = sin(x);
    %v = x.^0.5;
    v = zeros(1,length(x));
    for i = 1:length(x)
        if x(i) == 0
            continue
        else
            v(i) = sin(x(i)) / x(i);
        end
    end
end