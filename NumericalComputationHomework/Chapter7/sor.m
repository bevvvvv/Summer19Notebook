function [x,nit]=sor(A,b,x0,w,d,tol,nmax)
% SOR : solve linear system with SOR iteration
% Usage: [x,nit]=sor(A,b,x0,omega,d,tol,nmax)
% Inputs:
% 	A : an n x n matrix
%   b : the rhs vector, with length n
%   x0 : the start vector for the iteration% tol: error tolerance
%   w: relaxation parameter, (1 < w < 2),
%   d : band width of A.
% Outputs::
%   x : the solution vector
%   nit: number of iterations



 
% check for convergence of system with matrix norm of M


y = inv(D + w*L)*b;


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

