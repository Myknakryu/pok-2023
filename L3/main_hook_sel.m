clc;
clear;
close all;
global f;
f = @(x) 4*x(1)^2 - 2.1*x(1)^4 + ((x(1)^6)/3) + (x(1)*x(2)) - 4*x(2)^2 + 4*x(2)^4;
global x0;
x0 = [0 0];
global maxStep;
maxStep = 0.5;

limitX = [-2.35 2.35];
limitY = [-1.45 1.45];
fig= figure();
btn = uicontrol(fig, "Style","pushbutton",'Position',...
        [0, 0, 120, 20], 'String',"Nowe ekstremum");
btn.Callback = @drawNew;
btn2 = uicontrol(fig, "Style","pushbutton",'Position',...
        [120, 0, 120, 20], 'String',"Zresetuj");
btn2.Callback = @restart;
global in_x0;
in_x0 = uicontrol(fig,'Style','edit','Position',[240,0,120,20]);
global in_x01;
in_x01 = uicontrol(fig,'Style','edit','Position',[360,0,120,20]);
global maxSt;
maxSt = uicontrol(fig,'Style','edit','Position',[480,0,120,20]);

global fg;

restart();

function restart(src, ~)
    global fg;
    global f;
    delete(fg);
    fg = axes;
    limitX = [-2.35 2.35];
    limitY = [-1.45 1.45];
    [x,y] = meshgrid(limitX(1):0.01:limitX(2), limitY(1):0.01:limitY(2));
    z = (x.^2).*4 - (x.^4).*2.1 + ((x.^6)./3) + (x.*y) - (y.^2).*4 + (y.^4).*4;
    z(z(:)> 10) = NaN;
    contourf(x, y, z, 22);
    colorbar;
    hold on;
    grid on;
    hold on;
    global in_x01;
    global in_x0;
    global maxSt;
    in_x0.String = 0;
    in_x01.String = 0;
    maxSt.String = 0.5;
end

function drawNew(src, ~)
    global f;
    global x0;
    global maxStep;
    global in_x01;
    global in_x0;
    global maxSt;
    x0 = [str2num(in_x0.String) str2num(in_x01.String)];
    maxStep = str2num(maxSt.String);
    [x_opt, x_hist] = HookJeeves(f,x0,maxStep,1e-7);
    plot(x_hist(:,1), x_hist(:,2),'rs--')
    scatter(x0(1), x0(2),'filled','o','MarkerEdgeColor','y')
    scatter(x_opt(1), x_opt(2),'filled','o','MarkerEdgeColor','g','MarkerFaceColor','g')
end