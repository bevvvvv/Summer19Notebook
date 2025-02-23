% Data Set
x = [0:0.1:1];
y = [0.7829 0.8052 0.5753 0.5201 0.3783 0.2923 0.1695 0.0842 0.0415 0.09 0];

% Polyfit 1, 2, 4, 8 order
first = polyfit(x,y,1);
second = polyfit(x,y,2);
fourth = polyfit(x,y,4);
eighth = polyfit(x,y,8);

% calculate model y values
yOne = polyval(first,x);
yTwo = polyval(second,x);
yFour = polyval(fourth,x);
yEight = polyval(eighth,x);

% plot on figure
figure
hold on
grid on
scatter(x,y)
plot(x,yOne);
plot(x,yTwo);
plot(x,yFour);
plot(x,yEight);
xlabel("X values");
ylabel("Y values");
title("MLS fitting at various orders");
legend('Data','First Order','Second Order','Fourth Order','Eight Order');




