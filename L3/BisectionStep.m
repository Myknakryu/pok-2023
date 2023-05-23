function [x_opt, a, b] = BisectionStep(f, a, b)
    fa = feval(f, a);
    fb = feval(f, b);

    x = (a + b) / 2;
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