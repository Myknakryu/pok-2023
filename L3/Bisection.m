function x = Bisection(f, a, b, tolerance, max_iterations)
    fa = f(a);
    fb = f(b);
    iteration = 0;
    if fa * fb >= 0
        error('Initial values do not bracket the root.')
    end
    while iteration < max_iterations
        x = (a + b) / 2;
        fx = f(x);

        if abs(fx) < tolerance
            return;
        end

        if fa * fx < 0
            b = x;
        else
            a = x;
            fa = fx;
        end
        
        iteration = iteration + 1;
    end
end