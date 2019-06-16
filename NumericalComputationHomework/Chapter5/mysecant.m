function r = mysecant(f,x0,x1,tol,nmax)
%MYSECANT secant method
xPrev = x0;
x = x1;
n = 0;
dx = ((x - xPrev) / (feval(f,x) - feval(f,xPrev))) * feval(f,x);
while ((dx>tol) & (feval(f,x)>tol)) | (n<nmax)
    fVal = feval(f,x);
    disp(sprintf('I have n=%d and x=%g, but f=%f.\n',n,x,fVal))
    n = n + 1;
    temp = x;
    x = x - dx;
    xPrev = temp;
    dx = ((x - xPrev) / (feval(f,x) - feval(f,xPrev))) * feval(f,x);
end
r = x-dx;
