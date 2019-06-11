n = [4 8 16 32 64 128];
actual = 0.550676;
absErr = zeros(1,length(n));

for i = 1:length(n)
    % func is e^-x
   val = trapezoid('func',0,0.8,n(i));
   absErr(i) = abs(val - actual);
   disp(val)
end

figure
loglog(n, absErr)
title('Absolute Error in trapezoid rule')
xlabel('Number of segments')
ylabel('Absolute Error')
