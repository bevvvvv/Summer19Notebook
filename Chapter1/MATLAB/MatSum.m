function sum = MatSum(matrix)
%sumMat Sums the value of all elements in a matrix
    dims = size(matrix);
    rows = dims(1);
    cols = dims(2);
    
    sum = 0;
    for row = 1:rows
        for col = 1:cols
           sum = sum + matrix(row,col);
        end
    end

end

