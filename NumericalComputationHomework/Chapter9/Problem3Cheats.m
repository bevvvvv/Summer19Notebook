% Setup intial conditions
% t starts at zero
t = 0;
h = 0.1;
xPrev = [1; 1;];
xPrev2 = [1.1052; 1.005];

% Runga Kutta Fourth Boii
for i = 1:10
   K1 = 0.1 .* [xPrev(2); t * xPrev(2);];
   K2 = 0.1 .* [xPrev(2) + 0.5 * K1(1); (t + 0.5 * h) * (xPrev(2) + 0.5 * K1(2));];
   K3 = 0.1 .* [xPrev(2) + 0.5 * K2(1); (t + 0.5 * h) * (xPrev(2) + 0.5 * K2(2));];
   K4 = 0.1 .* [xPrev(2) + K3(1); (t + h) * (xPrev(2) + K3(2));];
   
   xPrev = xPrev + 1 / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
   % increment t
   t = t + h;
   
   disp('Value of t:')
   disp(t)
   disp('x1 and x2')
   disp(xPrev)
end

% ABM




