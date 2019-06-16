n = [1 3 9];

for i = 1:length(n)
    space = 1 / n(i);
    x = 0:space:1;
    y = zeros(1,length(x));
    y(1) = 1;
    y(2:end) = func(x(2:end));
    val = trapz(space,y);
    disp(val)
end

rows = 9;
vals = romberg('func',0,1,rows);

disp(vals)