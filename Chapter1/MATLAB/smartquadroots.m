function [r1, r2] = smartquadroots(a,b,c)
%SMARTQUADROOTS calculates the roots of a polynomial, avoiding loss of
%significance
%  input: a,b,c: coefficients of quadratic polynomial
% output: r1,r2: roots of the given quadratic polynomial
    [r1, r2] = quadroots(a,b,c);
    
    % Only r2 can see loss of significance because it is the one dealing
    % with subtraction
    if r1 * r2 ~= c/a
        r2 = c/(a * r1);
    end
end

