% display image
everest = imread('../Media/mountEverest.png');
image(everest)
grid on

% click knot points
[t, y] = ginput(20);
y = y.*-1;

disp([t, y])

z = cspline(t, y);

min = t(1);
max = t(20);
x = min:0.001:max;

yPlot = cspline_eval(t, y, z, x);

figure
plot(x, yPlot)
xlabel('Range of clicked points')
ylabel('Interpolated Points')
title('Interpolated ridge')

