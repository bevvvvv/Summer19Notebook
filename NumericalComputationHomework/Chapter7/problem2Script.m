
omega = 1.0:0.0001:1.9;
numIterations = zeros(length(omega),1);


% given inputs
A = ...
  [-2.011 1 0 0 0 0 0 0 0;
   1 -2.012 1 0 0 0 0 0 0;
   0 1 -2.013 1 0 0 0 0 0;
   0 0 1 -2.014 1 0 0 0 0;
   0 0 0 1 -2.015 1 0 0 0;
   0 0 0 0 1 -2.016 1 0 0;
   0 0 0 0 0 1 -2.017 1 0;
   0 0 0 0 0 0 1 -2.018 1;
   0 0 0 0 0 0 0 1 -2.019];

x = [0.95; 0.9; 0.85; 0.8; 0.75; 0.7; 0.65; 0.6; 0.55];
xResult = zeros(length(x),length(omega));


b = [-0.994974; 0.0015740700000000001; -0.00089667700000000013; -0.0027113700000000003; ...
     -0.00407407; -0.00511719; -0.00592917; -0.00657065; -0.507084];


for i = 1:length(omega)
    [xResult(:,i), numIterations(i)] = sor(A,b,x,omega(i),3,10^-4,100);
end

disp(numIterations)

figure
plot(omega, numIterations)
xlabel("Omega value of SOR")
ylabel("Iterations until convergence")
title("Omega value impact on convergence in SOR")

% After reviewing the plot 1.52 looks to be about the fastest value

sor(A,b,x,1.52,3,10^-4,100);