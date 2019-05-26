function v=polyvalue(a,x,t)
% input: a= Newton’s divided differences
% x= the points for the data set to interpolate,
% same as in divdiff.
% t= the points where the polynomial should be evaluated
% output: v= value of polynomial at the points in t
dims = size(a);
coeffs = a(1,:);

    function val = calcValue(z)
        val = 0;
        for term = 1:length(coeffs)
            newProd = coeffs(term);
            for termNum = 1:(term-1)
                if term == 1
                    break
                else
                    newProd = newProd * (z - x(termNum));
                end
            end
            val = val + newProd;
        end
        disp(val)
    end

v = zeros(size(t));

for i = 1:length(t)
   v(i) = calcValue(t(i)); 
end
end

