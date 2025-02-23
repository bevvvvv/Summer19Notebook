% Setup variables
mu = 0.012277471;
v = 1 - mu;
y = [0.994; 0; 0; -2.0015851063790825];
tSpan = [0 17.065211656];% one period is t = 17.065211656

% Part b ------------------------------------------------------------------
[t, yOut] = ode45(@odefun,tSpan,y);
figure
hold on
plot(t,yOut(:,1))
plot(t,yOut(:,2))
xlabel('Time (T)')
ylabel('Y displacement')

% coords
oneX(length(yOut(:,1)),1) = -1*mu;
oneY(length(yOut(:,2)),1) = 0;
twoX(length(yOut(:,1)),1) = 1-mu;
twoY(length(yOut(:,2)),1) = 0;
oneX = oneX + yOut(:,1);
oneY = oneY + yOut(:,2);
twoX = twoX + yOut(:,1);
twoY = twoY + yOut(:,2);
hold off
figure
hold on
plot(oneX,oneY)
plot(twoX,twoY)
xlabel('Y1')
ylabel('Y2')
title('Objects in motion')

% Forward Euler method-----------------------------------------------------
% Setup intial conditions
% t starts at zero
t = 0;
h = 0.0007110504856666666;
xPrev = y; % initial start
xPrevAhead = y;

for i = 1:24000
   dE = ((xPrev(1) + mu)^2 + xPrev(2)^2)^0.5;
   dM = ((xPrev(1) - v)^2 + xPrev(2)^2)^0.5;
   xPrevPrime = [xPrev(3); xPrev(4); xPrev(1) + 2 * xPrev(4) - v * ((xPrev(1) + mu) /dE^3) - mu * ((xPrev(1) - v) / dM^3);...
       xPrev(2) - 2 * xPrev(3) - v * (xPrev(2) /dE^3) - mu * (xPrev(2) / dM^3)];
   xPrev =  xPrev + h .* xPrevPrime;
   if i == 1
       xPrevAhead = xPrev;
   end
   % increment t
   t = t + h;
end
disp('Y1')
disp(xPrev(1))
disp('Y2')
disp(xPrev(2))
disp('Time')
disp(t)

t = 0;
xPrev = y;
xPrev2 = xPrevAhead;

% Runga Kutta Fourth Boii
for i = 1:6000
   K1 = 0.1 .* [xPrev(3); xPrev(4); xPrev(1) + 2 * xPrev(4) - v * ((xPrev(1) + mu) /dE^3) - mu * ((xPrev(1) - v) / dM^3);...
       xPrev(2) - 2 * xPrev(3) - v * (xPrev(2) /dE^3) - mu * (xPrev(2) / dM^3)];
   K2 = 0.1 .* [xPrev(3) + 0.5 * K1(3); xPrev(4) + 0.5 * K1(4); (xPrev(1) + 0.5 * K1(1)) + 2 * (xPrev(4) + 0.5 * K1(4)) - v * (((xPrev(1) + 0.5 * K1(1)) + mu) /dE^3) - mu * (((xPrev(1) + 0.5 * K1(1)) - v) / dM^3);...
       (xPrev(2) + 0.5 * K1(2)) - 2 * (xPrev(3) + 0.5 * K1(3)) - v * (((xPrev(2) + 0.5 * K1(2))) /dE^3) - mu * (((xPrev(2) + 0.5 * K1(2))) / dM^3)];
   K3 = 0.1 .* [xPrev(3) + 0.5 * K2(3); xPrev(4) + 0.5 * K2(4); (xPrev(1) + 0.5 * K2(1)) + 2 * (xPrev(4) + 0.5 * K2(4)) - v * (((xPrev(1) + 0.5 * K2(1)) + mu) /dE^3) - mu * (((xPrev(1) + 0.5 * K2(1)) - v) / dM^3);...
       (xPrev(2) + 0.5 * K2(2)) - 2 * (xPrev(3) + 0.5 * K2(3)) - v * (((xPrev(2) + 0.5 * K2(2))) /dE^3) - mu * (((xPrev(2) + 0.5 * K2(2))) / dM^3)];
   K4 = 0.1 .* [xPrev(3) + K3(3); xPrev(4) + K3(4); (xPrev(1) + K3(1)) + 2 * (xPrev(4) + K3(4)) - v * (((xPrev(1) + K3(1)) + mu) /dE^3) - mu * (((xPrev(1) + K3(1)) - v) / dM^3);...
       (xPrev(2) + K3(2)) - 2 * (xPrev(3) + K3(3)) - v * (((xPrev(2) + K3(2))) /dE^3) - mu * (((xPrev(2) + K3(2))) / dM^3)];
   
   xPrev = xPrev + 1 / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
   % increment t
   t = t + h;
end

disp('Y1')
disp(xPrev(1))
disp('Y2')
disp(xPrev(2))
disp('Time')
disp(t)

% equations (y is vector)
function out = odefun(t, y)
    mu = 0.012277471;
    v = 1 - mu;
    dE = ((y(1) + mu)^2 + y(2)^2)^0.5;
    dM = ((y(1) - v)^2 + y(2)^2)^0.5;
    out = zeros(4,1);
    out(1) = y(3); % y(1)'
    out(2) = y(4); % y(2)'
    out(3) = y(1) + 2 * y(4) - v * ((y(1) + mu) /dE^3) - mu * ((y(1) - v) / dM^3); % y(1)''
    out(4) = y(2) - 2 * y(3) - v * (y(2) /dE^3) - mu * (y(2) / dM^3); % y(2)''
end


