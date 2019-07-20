% Finite Difference Method

% Set inital values
N = [10, 20];
start = 0;
endP = pi / 2;
alpha = -0.3;
beta = -0.1;
H = (endP - start)./N;
firstErr = zeros(N(1),1);
secErr = zeros(N(2),1);
x1 = zeros(N(1),1);
x2 = zeros(N(2),1);

figure
hold on

% Calculate each
for j = 1:2
   n = N(j);
   h = H(j);
   x = zeros(n,1);
   a = zeros(n,1);
   b = zeros(n,1);
   c = zeros(n,1);
   d = zeros(n,1);
   
   A = zeros(n,n);
   
   for i = 1:n
       x(i) = start + i * h;
       a(i) = 1 + h / 2;
       c(i) = 1 - h / 2;
       d(i) = -1 * 2 * (1 + h^2);
       A(i,i) = d(i);
       if i == 1
           b(i) = h^2 * cos(x(i)) - a(i) * alpha;
           A(i, i+1) = c(i);
       elseif i == n
           b(i) = h^2 * cos(x(i)) - c(i) * beta;
           A(i, i-1) = a(i);
       else
           b(i) = h^2 * cos(x(i));
           A(i, i+1) = c(i);
           A(i, i-1) = a(i);
       end
   end
   yVals = A\b;
   yAct = -1 .* (sin(x) + 3 .* cos(x))./10;
   
   if j == 1
       firstErr = abs(yVals - yAct);
       x1 = x;
   else
       secErr = abs(yVals - yAct);
       x2 = x;
   end
   
   plot(x,yVals)
end

xF = [0:0.0001:pi/2];
y = -1 .* (sin(xF) + 3 .* cos(xF))./10;
plot(xF,y)
legend("N = 10","N = 20","Function")
xlabel("X")
ylabel("Y")
title("Graph of Function with Finite Difference Approx")

figure
hold on
plot(x1, firstErr)
plot(x2, secErr)
xlabel("X Value")
ylabel("Error")
legend("N = 10","N = 20")
title("Error of finite differences")

