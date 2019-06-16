function v=Simpson(fun,a,b,n)
%SIMPSON numerical integration using simpson's rule
    h=(b-a)/n; xi=a:h:b;
    v= h/3*(feval(fun,xi(1))+2*sum(feval(fun,xi(3:2:end-2)))+4*sum(feval(fun,xi(2:2:end)))+feval(fun,xi(end)));
end

