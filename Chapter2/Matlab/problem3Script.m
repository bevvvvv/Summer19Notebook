% Script for Problem 3

% Setup our known points
x = [0 5 10 15];
y = [3 8 -2 9];
% degree of polynomial
n = 3;

% Calculate the polynomial
poly = polyfit(x, y, n);
disp(poly)

% Now plot the polynomial
% Create the x values
xVals = 0:0.1:15;
yVals = poly(1)*xVals.^3+ poly(2)*xVals.^2+poly(3)*xVals+poly(4);

figure;
scatter(x,y);
hold on
plot(xVals,yVals)
grid on
xlabel('X values')
ylabel('Interpolated y values')
title('Determining polynomial with built in functions')


