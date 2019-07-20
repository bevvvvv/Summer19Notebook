% Non-Linear boundry value shooting method

% set initial values
tol = 10^-9;
alpha = 0;
beta = log(2);
z1 = 1;
z2 = 0.5;
y = [alpha; z1; alpha; z2];
nmax = 5;

% t is in the range 0 to pi / 2
tSpan = [1 2];
[t, yOut] = ode45(@odefun,tSpan,y);

n = 0;
testVal = 100000000000000;

while abs(testVal - beta) > tol && n < nmax
    % lat row num
    lastRow = length(yOut(:,1));
    % secant iteration
    testVal = z2 + (beta - yOut(lastRow,3))*((z2 - z1)/(yOut(lastRow,3)-yOut(lastRow,1)));
    if abs(testVal - beta) < tol
        break
    end
    % update z vals;
    z1 = z2;
    z2 = testVal;
    y(2) = z1;
    y(4) = z2;
    [t, yOut] = ode45(@odefun,tSpan,y);
    n = n + 1;
end
yOutput = lambda .* yOut(:,1) + (1 - lambda) .* yOut(:,3);
disp(yOut(lastRow,1))
disp(yOut(lastRow,3))
disp(testVal)

tFunc = [tSpan(1):0.0001:tSpan(2)];
yFunc = log(tFunc);

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
yFuncErr = log(t);
yFuncErr = abs(yOutput - yFuncErr);
figure
hold on
plot(t, yFuncErr)
xlabel("X Value")
ylabel("Shot Error")
title("Error")


function out=odefun(t,y)
    % system to solve
    out = zeros(4,1);
    out(1) = y(2);
    out(2) = -1 * y(2)^2 - y(1) + log(t);
    out(3) = y(4);
    out(4) = -1 * y(4)^2 - y(3) + log(t);
end
