x = 1.2:0.00001:2.2;
t = [1.2 1.5 1.6 2.0 2.2];
y = [0.4275 1.139 0.8736 -0.9751 -0.1536];

yVals = lspline(t,y,x);

figure
plot(x,yVals)
grid on
xlabel('Chosen Points')
ylabel('Linear Spline Points')







