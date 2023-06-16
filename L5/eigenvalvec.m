A = [3 1 2; 
     1 8 1;
     2 1 1];

x = rand(size(A, 1), 1);
x = x / norm(x);

max_iter = 1000;

lambda = 0;

for k = 1:max_iter
    y = A * x;
    lambda_new = max(y);
    x = y / norm(y);        
    if abs(lambda_new - lambda) < 1e-6
        break
    end
    lambda = lambda_new;
end

disp('Wartość własna:');
disp(lambda);

disp('Wektor własny:');
disp(x);
