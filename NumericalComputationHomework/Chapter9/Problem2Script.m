% Setup intial conditions
% t starts at zero
t = 0;
h = 0.1;
xPrev = [1; 2; 3;];
xPrevPrime = [xPrev(2); xPrev(3); myFunc(xPrev, t)];

for i = 1:10
   xPrev =  xPrev + h .* xPrevPrime;
   xPrevPrime = [xPrev(2); xPrev(3); myFunc(xPrev, t)];
   % increment t
   t = t + h;
end

disp(xPrev)
disp(t)





% differential equations
function out=myFunc(x, t) 
    out = -2 * x(3) + x(1) * t;
end


