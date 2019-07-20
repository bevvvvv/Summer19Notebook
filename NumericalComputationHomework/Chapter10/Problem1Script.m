% Linear boundry value shooting method

% set initial values
tol = 10^-8;
alpha = -0.3;
beta = -0.1;
y = [alpha; -1; alpha; 10000];
nmax = 100;

% t is in the range 0 to pi / 2
tSpan = [0 pi / 2];
[t, yOut] = ode45(@odefun,tSpan,y);

n = 0;
testVal = 100000000000000;

while abs(testVal - beta) > tol && n < nmax
    % lat row num
    lastRow = length(yOut(:,1));
    % calculate lambda
    lambda = (beta - yOut(lastRow,3)) / (yOut(lastRow,1) - yOut(lastRow,3));
    disp(lambda)
    % get y(b)
    testVal = lambda * yOut(lastRow,1) + (1 - lambda) * yOut(lastRow,3);
    if abs(testVal - beta) < tol
        break
    end
    y(2) = lambda * y(2);
    y(4) = (1-lambda) * y(4);
    [t, yOut] = ode45(@odefun,tSpan,y);
    n = n + 1;
end
yOutput = lambda .* yOut(:,1) + (1 - lambda) .* yOut(:,3);
disp(yOut(lastRow,1))
disp(yOut(lastRow,3))
disp(testVal)

tFunc = [tSpan(1):0.0001:tSpan(2)];
yFunc = -1 .* (sin(tFunc) + 3 .* cos(tFunc))./10;

% Plot function
figure
hold on
plot(tFunc, yFunc)
scatter(t, yOutput)
xlabel("X Value")
ylabel("Y Value")
title("Shooting Method Function and Shot")
legend("Exact Solution", "Shooting Method")

% Plot error
yFuncErr = 1 .* (sin(t) + 3 .* cos(t))./10;
yFuncErr = abs(yOutput - yFuncErr);
figure
hold on
plot(t, yFuncErr)
xlabel("X Value")
ylabel("Shot Error")


function out=odefun(t,y)
    % system to solve
    out = zeros(4,1);
    out(1) = y(2);
    out(2) = y(2) + 2 * y(1) + cos(t);
    out(3) = y(4);
    out(4) = y(4) + 2 * y(3) + cos(t);
end
