% Now we use chebyshev nodes
xOne = zeros(1,21);
xTwo = zeros(1,21);
for i = 0:20
    xOne(i+1) = 5*cos(i * pi / 20);
    xTwo(i+1) = 5*cos((2*i + 1)* pi / 42);
end
yOne = (xOne.^2+1).^(-1);
yTwo = (xTwo.^2+1).^(-1);

% Find the polynomial
% Get newtons's diff table
aOne = divdiff(xOne, yOne);
aTwo = divdiff(xTwo, yTwo);

newOne = polyvalue(aOne,xOne,xOne);
errorOne = abs(yOne-newOne);

newTwo = polyvalue(aTwo,xTwo,xTwo);
errorTwo = abs(yTwo-newTwo);

figure
disp(errorOne)
disp(errorTwo)
hold on
plot(xOne,yOne);
plot(xOne,newOne);
plot(xOne,errorOne);
legend('Actual Values','Interpolated Poly','Error')

hold off
figure
hold on
plot(xTwo,yTwo);
plot(xTwo,newTwo);
plot(xTwo,errorTwo);
legend('Actual Values','Interpolated Poly','Error')






