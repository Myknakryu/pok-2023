x = [10 20 30 40 50];
y = [0.98 0.93 0.86 0.76 0.64];

x_s = 21;

res = 0;
for i = 1:length(x)
    a = y(i);
    a_d = 1;
    res_seg = 1;
    for j = 1:length(x)
        if i ~= j
            a_d = a_d * (x(i) - x(j));
            res_seg = res_seg*(x_s-x(j));
        end
    end
    a = a/a_d;
    res_seg = res_seg*a;
    res = res+res_seg;
end