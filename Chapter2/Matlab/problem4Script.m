% Create the function to approximate the derivative

% Create the h values and find the actual value
h = linspace(0.0000000000001,0.1);
vals = (1 ./ (2 .* h)).*(-3 .* tan(1) + 4 .* tan(1 + h) - tan(1 + 2.*h));
act = (sec(1))^2;


errors = abs(act - vals);

figure
loglog(h, errors)
grid on
xlabel('H values (0.1-0.0001)')
ylabel('e Error values (smaller is better)')






