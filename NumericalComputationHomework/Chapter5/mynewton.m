function r = mynewton(f,df,x0,tol,nmax)
%MYNEWTON matlab implementation of newton fixed point iteration
% f - function f(x)
% df - function f'(x)
% x0 - initial guess
% tol - error tolerance
% nmax - maximum number of iterations
x = x0;
n = 0;
dx = feval(f,x)/feval(df,x);
while ((dx>tol) & (feval(f,x)>tol)) | (n<nmax)
    fVal = feval(f,x);
    disp(sprintf('I have n=%d and x=%g, but f=%f.\n',n,x,fVal))
    n = n+1;
    x = x-dx;
    dx = feval(f,x)/feval(df,x);
end
r = x-dx;
