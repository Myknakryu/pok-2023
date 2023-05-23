function [x_opt, a, b, x] = FalsiRegulaStep(f, a, b)
    fa = feval(f, a);
    fb = feval(f, b);
    iteration = 0;
    
    if fa * fb >= 0
        error('Initial values do not bracket the root.')
    end
    
    x = (a * fb - b * fa) / (fb - fa);
    fx = feval(f, x);
    
    
    if fa * fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
        
    x_opt = x;
end