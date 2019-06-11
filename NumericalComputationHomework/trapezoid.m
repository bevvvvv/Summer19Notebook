function v=trapezoid(fun,a,b,n)
%TRAPEZOID numerical integration by trapezoid rule
h=(b-a)/n;
xi=a:h:b;
v = h*(0.5*feval(fun,xi(1))+sum(feval(fun,xi(2:1:end-1)))+0.5*feval(fun,(xi(end))));
end

