function x = FalsiRegula(f, a, b, tolerance, max_iterations)
    iteration = 0;
    
    if f(a) * f(b) >= 0
        error('Initial values do not bracket the root.')
    end
    
    while iteration < max_iterations
        x = (a * f(b) - b * f(a)) / (f(b) - f(a));
        fx = feval(f, x);
        
        if abs(fx) < tolerance
            return;
        end

        if f(a) * fx < 0
            b = x;
            f(b) = fx;
        else
            a = x;
            f(a) = fx;
        end
        
        iteration = iteration + 1;
    end
end