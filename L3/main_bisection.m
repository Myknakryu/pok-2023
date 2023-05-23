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
label2 = uicontrol(fig,"Style",'text', "Position",[400,0,240,12]);
labe2.String = "Wartość w x: ";
restart();

function drawNew(f,a,b) 
    scatter(a,f(a),'filled','green');
    hold on;
    scatter(b,f(b),'filled', 'blue');
    scatter((a+b)/2, (f(a)+f(b))/2, 'filled','yellow')
    scatter((a+b)/2, f((a+b)/2), 'filled','yellow')
    plot([a b], [f(a) f(b)], 'r--')
    plot([(a+b)/2 (a+b)/2], [(f(a)+f(b))/2 f((a+b)/2)],'y--')

end

function calcNext(src, ~)
    global f
    global a
    global b
    [x_opt, new_a, new_b] = BisectionStep(f,a,b);
    a = new_a;
    b = new_b;
    drawNew(f,a,b);
    global label;
    label.String = strcat("Optymalne x:", string(x_opt));
    global label2;
    label2.String = strcat("Wartość w x:", string(abs(f(x_opt))));
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