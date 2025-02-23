% Create 21 equally spaced nodes
x = linspace(-5,5,21);
y = (x.^2+1).^(-1);

% Find the polynomial
% Get newtons's diff table
a = divdiff(x, y);

% 41 points to graph
xVal = linspace(-5,5,41);
yVal = (xVal.^2+1).^(-1);
newVal = polyvalue(a,x,xVal);
errorVal = abs(yVal-newVal);

figure
hold on
plot(xVal,yVal);
plot(xVal,newVal);
plot(xVal,errorVal);
legend('Actual Values','Interpolated Poly','Error')







