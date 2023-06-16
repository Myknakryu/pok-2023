clc;
clear;
close all;
x = [10, 20, 30, 40, 50];
y = [0.98, 0.93, 0.86, 0.76, 0.64];

[a, b, c, d] = cubic_spline(x, y);

x_s = 21;
y_s = 0;

j = 1;
while x_s > x(j+1) && j < length(x)-1
    j = j + 1;
end

y_s = a(j) + b(j)*(x_s-x(j)) + c(j)*(x_s-x(j))^2 + d(j)*(x_s-x(j))^3
%%
x_s = 10:0.1:50;
j = 1
for i = 1: length(x_s)
        while x_s(i) > x(j+1) && j < length(x)
            j = j + 1;
        end
        a_y_s(i) = a(j);
        b_y_s(i) = b(j)*(x_s(i)-x(j));
        c_y_s(i) = c(j)*(x_s(i)-x(j))^2;
        d_y_s(i) = d(j)*(x_s(i)-x(j))^3;
        cubic_y_s(i) = a(j) + b(j)*(x_s(i)-x(j)) + c(j)*(x_s(i)-x(j))^2 + d(j)*(x_s(i)-x(j))^3;
end

figure;
hold on;
grid on;
plot(x,y,'ob', 'MarkerFaceColor','blue', 'DisplayName',"Punkty bazowe")
plot(x_s, cubic_y_s, 'DisplayName',"Interpolacja Cubic Spline");
plot(x_s, a_y_s, 'DisplayName',"Część stała Cubic Spline");
plot(x_s, b_y_s, 'DisplayName',"Część liniowa Cubic Spline");
plot(x_s, c_y_s, 'DisplayName',"Część kwadratowa Cubic Spline");
plot(x_s, d_y_s, 'DisplayName',"Część sześcienna Cubic Spline");
legend('ItemHitFcn',@cb_legend);


figure;
hold on;
grid on;
plot(x,y,'ob', 'MarkerFaceColor','blue', 'DisplayName',"Punkty bazowe")
for i = 1:length(x)
    
    plot(x_s, a(i) + b(i).*(x_s-x(i)) + ...
              c(i).*(x_s-x(i)).^2 + d(i).*(x_s-x(i)).^3, ...
              'DisplayName',strcat("Funkcja ", string(i), " od Cubic Spline"), ...
              'LineWidth',2);

end

plot(x_s, cubic_y_s, 'b--', 'DisplayName',"Interpolacja Cubic Spline", ...
    'LineWidth',1.5);

ylim([0.6 1])
legend('ItemHitFcn',@cb_legend);

function cb_legend(~,evt)
    if strcmp(evt.Peer.Visible,'on')
        evt.Peer.Visible = 'off';
    else 
        evt.Peer.Visible = 'on';
    end
end