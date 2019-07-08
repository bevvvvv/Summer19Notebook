x = [0:0.2:1];
y = [1.996 1.244 0.81 0.541 0.375 0.259];
S = log(y);

% Calculate necessary values
temp = log(1+x);
a = sum(temp);
temp = x.*log(1+x);
b = sum(temp);
temp = x.*x;
c = sum(temp);
temp = log(1+x).^2;
d = sum(temp);
e = sum(S);
f = sum(x);
temp = S.*x;
g = sum(temp);
temp = S.*log(1+x);
h = sum(temp);

% Setup matrix
A = [1 f -1*a; f c -1*b; a b -1*d];
b = [e; g; h];

result = A\b;

a0 = exp(result(1));
a1 = result(2);
a2 = result(3);

points = [0:0.001:1];
pointsY = a0.*((exp(a1.*points)) ./ ((1 + points).^a2));
vals = [0:0.2:1];
valsY = a0.*((exp(a1.*vals)) ./ ((1 + vals).^a2));

figure
hold on
scatter(x,y)
plot(points,pointsY)
plot(vals,valsY)
xlabel("X values")
ylabel("Y values")
title("MLS data approximation")


sumOfS = sum((y-valsY).^2);
disp(sumOfS)


