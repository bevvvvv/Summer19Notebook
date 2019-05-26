function a=divdiff(x,y)
% input: x,y: the data set to be interpolated
% output: a: table for Newton’s divided differences.
    
    [p, m] = size(x); % m points, polynomial order <= m-1
    if p ~= 1 || p ~=size(y, 1) || m ~= size(y, 2)
        error('divdiff: input vectors must have the same dimension'); 
    end
    a = zeros(m, m);
    a(:, 1) = y';
    for j = 2 : m
        for i = 1 : (m - j + 1)
            a(i,j) = (a(i + 1, j - 1) - a(i, j - 1)) / (x(i + j - 1) - x(i));
        end
    end
end

