function [x,nit] = jacobi(A,b,x0,tol,nmax)
%JACOBI Summary of this function goes here
%   Detailed explanation goes here
D = diag(diag(A)); % first diag gets diag of A, second turns into diagonal matrix
L = tril(A)- D; % lower triangle, but remove the main diagonal
U = triu(A)- D; % upper triangle, but remove the main diagonal
 
% check for convergence of system with matrix norm of M
M = -1 * inv(D)*(L + U);
y = inv(D)*b;
e= max(abs(eig(M))); % L2 norm
if abs(e) >= 1
    disp ('Cannot converge with given parameters')
end

% set initial guess
x = zeros(length(b),nmax);
x(:,1) = x0;

nit = 1;
err1= norm(x(:,1)-b); %set intial error ||xk - xk-1|| <= tol, Axk - b <= tol
err2= norm(A*x(:,1)-b);
while err1 > tol & err2 > tol & nit <= nmax% go until nmax, within error tol for residual or xDiff norm
    x( : ,nit + 1 ) = y + M*x(:,nit);
    err1 = norm(x(:,nit+1)-x(:,nit));
    err2 = norm(A*x(:,nit+1)-b);
    nit = nit + 1;
end
 
fprintf ('The final ans obtaibed after %d iterations is  \n', nit)
x = x(:,nit-1);
disp(x);
end

