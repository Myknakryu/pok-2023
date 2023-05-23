function [newX,expX, newStep] = HookJeevesStep(f, x0, step_size)
    delta = step_size;
    x = x0;
    fx = f(x);
    expX = []
    % Perform exploratory move
    x_star = x;
    fx_star = fx;
    for i = 1:numel(x)
        x_i_plus_delta = x;
        x_i_minus_delta = x;
        x_i_plus_delta(i) = x(i) + delta;
        expX = [expX ; x_i_plus_delta];
        x_i_minus_delta(i) = x(i) - delta;
        expX = [expX ; x_i_minus_delta];
        f_i_plus = feval(f, x_i_plus_delta);
        f_i_minus = feval(f, x_i_minus_delta);
        if f_i_plus < fx_star
            x_star = x_i_plus_delta;
            fx_star = f_i_plus;
        elseif f_i_minus < fx_star
            x_star = x_i_minus_delta;
            fx_star = f_i_minus;
        end
    end
    
    % Check if pattern move is successful
    if fx_star < fx
        % Perform pattern move
        x_pattern = 2 * x_star - x;
        fx_pattern = feval(f, x_pattern);
        if fx_pattern < fx_star
            x = x_pattern;
            fx = fx_pattern;
        else
            x = x_star;
            fx = fx_star;
        end
    else
        % Reduce pattern move step size
        delta = delta / 2;
    end
    
    newStep = delta;
    newX = x;
end