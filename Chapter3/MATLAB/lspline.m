function ls = lspline(t,y,x)
%LSPLINE Computes the linear spline
% Inputs
%   t: vector, contains the knots
%   y: vector, contains the interpolating values at knots
%   x: vector, contains the points where the lspline function should be
%   evaluated and plotted
% Output
%   ls: vector, contains the values of lspline at points x

% assuming all x inputs are order in ascending order

ls = zeros(1,length(x));
currentPoint = 1;
endPoint = length(t);

for evalInd = 1:length(x)
    while currentPoint <= endPoint
        if x(evalInd) == t(currentPoint)
            ls(evalInd) = y(currentPoint);
            break
        elseif x(evalInd) > t(currentPoint) & x(evalInd) < t(currentPoint+1)
            ls(evalInd) = y(currentPoint) + (y(currentPoint+1)-y(currentPoint))./(t(currentPoint+1)-t(currentPoint)).*(x(evalInd) - t(currentPoint));
            break
        else
            currentPoint = currentPoint + 1;
        end
    end 
end

end

