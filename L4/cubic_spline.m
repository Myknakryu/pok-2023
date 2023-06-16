function [a, b, c, d] = cubic_spline(x, y)
    n = length(x);
    a = y;
    h = diff(x);
    alpha = zeros(n-1,1);
    alpha(1) = 3*(a(2)-a(1))/h(1) - 3*(a(end)-a(end-1))/h(end);
    for i = 2:n-1
        alpha(i) = (3/h(i))*(a(i+1)-a(i)) - (3/h(i-1))*(a(i)-a(i-1));
    end
    
    l = zeros(n,1);
    u = zeros(n,1);
    z = zeros(n,1);
    
    l(1) = 2*h(1);
    u(1) = 0.5;
    z(1) = alpha(1)/l(1);
    
    for i = 2:n-1
        l(i) = 2*(x(i+1)-x(i-1)) - h(i-1)*u(i-1);
        u(i) = h(i)/l(i);
        z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
    end
    
    l(n) = h(n-1) * (2 - u(n-1));
    z(n) = (alpha(n-1) - h(n-1)*z(n-1))/l(n);
    c = zeros(n,1);
    b = zeros(n,1);
    d = zeros(n,1);
    c(n) = z(n);
    
    for j = n-1:-1:1
        c(j) = z(j) - u(j)*c(j+1);
        b(j) = (a(j+1) - a(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
        d(j) = (c(j+1) - c(j))/(3*h(j));
    end
end