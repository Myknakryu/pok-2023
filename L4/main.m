clc;
clear;
close all;
x = [10, 20, 30, 40, 50];
y = [0.98, 0.93, 0.86, 0.76, 0.64];

x_s = 10:0.1:50;

lag_y_s = lagrange(x,y,x_s);

[a,b,c,d] = cubic_spline(x,y);

j = 1
for i = 1: length(x_s)
        while x_s(i) > x(j+1) && j < length(x)
            j = j + 1;
        end
        cubic_y_s(i) = a(j) + b(j)*(x_s(i)-x(j)) + c(j)*(x_s(i)-x(j))^2 + d(j)*(x_s(i)-x(j))^3;
end
figure;
hold on;
grid on;
plot(x,y,'ob', 'MarkerFaceColor','blue', 'DisplayName',"Punkty bazowe")
plot(x_s, lag_y_s, 'DisplayName',"Interpolacja Lagrange");
plot(x_s, cubic_y_s, 'DisplayName',"Interpolacja Cubic Spline");
% plot(x_s, cos(deg2rad(x_s)),'DisplayName',"Bazowe y=cos(x[°])")
legend('ItemHitFcn',@cb_legend);
xlabel("x")
ylabel("y")

function cb_legend(~,evt)
    if strcmp(evt.Peer.Visible,'on')
        evt.Peer.Visible = 'off';
    else 
        evt.Peer.Visible = 'on';
    end
end