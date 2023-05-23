A = [2,1,1,-1; 1,1,1,-1; -1,2,-1,1; -1,2,-1,1];
B = [3;4;10;-4];
initialGuess = [1; 2; 3; 4];
maxIterations = 5000;
tolerance = 1e-3;

x = gaussSeidel(A, B, initialGuess, maxIterations, tolerance);
disp('Solution:');
disp(x);