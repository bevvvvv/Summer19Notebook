
% Construct A and b in the following way

% Case 1
c = [0.2:0.2:1];
A = vander(c);
xsol = ones(size(c'));
b = A*xsol;
disp('Guassian:')
naiv_gauss(A,b)
disp('Pivoting:')
A\b

% Case 2
c = [0.1:0.1:1];
A = vander(c);
xsol = ones(size(c'));
b = A*xsol;
disp('Guassian:')
naiv_gauss(A,b)
disp('Pivoting:')
A\b


% Case 3
c = [0.05:0.05:1];
A = vander(c);
xsol = ones(size(c'));
b = A*xsol;
disp('Guassian:')
naiv_gauss(A,b)
disp('Pivoting:')
A\b





