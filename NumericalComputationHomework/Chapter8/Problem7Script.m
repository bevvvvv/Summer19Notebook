% Data Set in two
xOne = [-1:0.01:0];
xTwo = [0:0.01:1];
yOne(1:length(xOne)) = -1;
yTwo(1:length(xTwo)) = 1;

% Model results
modelOne = 4 .* cos(pi .* xOne) ./ pi;
modelTwo = 4 .* cos(pi .* xTwo) ./ pi;


figure
hold on
grid on
plot(xOne, yOne)
plot(xTwo, yTwo)
plot(xOne, modelOne)
plot(xTwo, modelTwo)