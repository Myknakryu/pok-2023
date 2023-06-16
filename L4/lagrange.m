function y = lagrange(x, y, x_s)
    n = length(x);
    L = ones(n, length(x_s));
    for i = 1:n
        for j = 1:n
            if i ~= j
                L(i,:) = L(i,:).*(x_s-x(j))/(x(i)-x(j));
            end
        end
    end
    y = sum(y'.*L);
end