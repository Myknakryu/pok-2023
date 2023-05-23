clear
close all
clc
global f
f = @(x) x + log(x)  - sin(x).^2;
% f = @(x) sin(x) - x.^2 - log(x);
global start_a;
start_a = 0.1;
global start_b;
start_b = 2;
global a;
a = start_a;
global b;
b = start_b;
global plt;
fig = figure();

btn = uicontrol(fig, "Style","pushbutton",'Position',...
        [0, 0, 120, 20], 'String',"Następna pozycja");
btn.Callback = @calcNext;
btn2 = uicontrol(fig, "Style","pushbutton",'Position',...
        [120, 0, 120, 20], 'String',"Zresetuj");
btn2.Callback = @restart;
global label;
label = uicontrol(fig,"Style",'text', "Position",[240,0,160,12]);
label.String = "Optymalne x: ";
global label2;
label2 = uicontrol(fig,"Style",'text', "Position",[400,0,160,12]);
label.String = "Wartość w x: ";
global label3;
label3 = uicontrol(fig,"Style",'text', "Position",[240,12,160,12]);
label3.String = "Nowa pozycja x: ";
restart();

function drawNew(f,a,b) 
    scatter(a,f(a),'filled','red');
    hold on;
    scatter(b,f(b),'filled', 'red');
    plot([a b], [f(a) f(b)], 'r--')
    new0 = (a * f(b) - b * f(a)) / (f(b) - f(a));
    scatter(new0,f(new0), 'filled', 'green');
    scatter(new0,0, 'filled', 'green');
    plot([new0, new0], [f(new0), 0], 'g-');
    global label3;
    label3.String = strcat("Nowa pozycja x: ", string(new0))
end

function calcNext(src, ~)
    global f
    global a
    global b
    [x_opt, new_a, new_b, x0] = FalsiRegulaStep(f,a,b);
    a = new_a;
    b = new_b;
    drawNew(f,a,b);
    global label;
    label.String = strcat("Optymalne x:", string(x_opt));
    global label2;
    label2.String = strcat("Wartość w x:", string(f(x_opt)));
end

function restart(src,~)
    global plt;
    global start_a;
    global start_b;
    global a;
    global b;
    global f;
    a = start_a;
    b = start_b;
    delete(plt);
    plt = axes;
    x = linspace(a-0.25,b+0.25,1000);
    y = f(x);
    x = plot(x,y, 'LineWidth',1);
    xlim([a-0.25 b+0.25])
    hold on;
    grid on;
    drawNew(f,a,b)
    global label;
    label.String = "Optymalne x: ";
    global label2;
    label2.String = "wartość w x: ";
end