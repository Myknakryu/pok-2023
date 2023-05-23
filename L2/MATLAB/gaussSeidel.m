function x = gaussSeidel(A, B, initialGuess, maxIterations, tolerance)
    % Input:
    %   A: Coefficient matrix of the linear equation system
    %   B: Right-hand side vector of the linear equation system
    %   initialGuess: Initial guess for the solution vector
    %   maxIterations: Maximum number of iterations
    %   tolerance: Error tolerance for convergence
    
    n = length(B);
    x = initialGuess;
    
    for k = 1:maxIterations
        x_prev = x;
        
        for i = 1:n
            x(i) = (B(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x_prev(i+1:n)) / A(i,i);
        end
        
        if norm(A*x - B, inf) < tolerance
            disp('Converged successfully.');
            break;
        end
    end
    
    if k == maxIterations
        disp('Maximum number of iterations reached.');
    end
end