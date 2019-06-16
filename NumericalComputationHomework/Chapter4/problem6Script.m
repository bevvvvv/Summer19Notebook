rows = 5;
vals = romberg('func',0,pi,rows);
act = 2;

format short e;
disp(vals)
for i = 1:rows
    for j = 1:rows
        if vals(i,j) == 0
            continue
        else
            vals(i,j) = vals(i,j) - act;
        end
    end
end

disp('First Function Error')
disp(vals)

rows = 5;
vals = romberg('f',0,1,rows);
act = 2/3;
disp(vals)
for i = 1:rows
    for j = 1:rows
        if vals(i,j) == 0
            continue
        else
            vals(i,j) = vals(i,j) - act;
        end
    end
end

disp('Second Function Error')
disp(vals)

