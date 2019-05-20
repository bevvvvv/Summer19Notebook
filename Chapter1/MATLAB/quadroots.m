function [r1, r2] = quadroots(a,b,c)
%QUADROOTS Computes the roots fo a quadratic function
% input: a, b, c; coefficients for the polynomial ax^2+bx+c=0
% output: r1, r2: the two roots for the polynomial
    r1 = ((-1 * b) + sqrt(b^2 - (4 * a * c)))/ (2 * a);
    r2 = ((-1 * b) - sqrt(b^2 - (4 * a * c)))/ (2 * a);
end

