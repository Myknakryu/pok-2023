clear;
clc;
A = [2,1,1,-1; 
     1,1,-1,1;
     1,1,1,1 ;
     -1,2,-1,1];
B = [3;4;10;4];
initialGuess = [0;0;0;0];
maxIterations = 5;
tolerance = 1e-3;
n = length(B);
x = initialGuess;

for k = 1:maxIterations
    x_prev = x;
    
    for i = 1:n
        x(i) = (B(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x_prev(i+1:n)) / A(i,i);
    end
    
    if norm(x - x_prev) < tolerance
        break;
    end
end

disp(x);
    