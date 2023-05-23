A = [2,1,1,-1; 
     1,1,-1,1;
     1,1,1,1 ;
     -1,2,-1,1];
B = [3;4;10;4];
omega = 1.2;
initialGuess = [0.0; 0.0; 0.0; 0.0];
maxIterations = 60;
tolerance = 1e-3;

x = sorMethod(A, B, omega, initialGuess, maxIterations, tolerance);
disp('Solution:');
disp(x);
