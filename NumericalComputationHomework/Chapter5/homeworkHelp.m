function v=homeworkHelp(x)
    v=x - (0.5 + 0.25 * x^2 - x * sin(x) - 0.5 * cos(2 * x)) / (sin(2 * x) - sin(x) -x*cos(x)+ 0.5*x);
end
