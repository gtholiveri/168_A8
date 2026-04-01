clear;
clc;
close all;
%% 1)
f1 = @(x) x.^3 - 4*x + 1;
graphFun(f1, -2.5, 3.5);
ylim([-4 10]);
g1 = [-2 1 2];
labelZeros(f1, g1);

%% 2)
f2 = @(x) exp(x) - 3*x;
graphFun(f2, 0.25, 2.25);
g2 = [0.5 1.5];
labelZeros(f2, g2);

%% 3)
f3 = @(x) sin(x) - 0.5;
graphFun(f3, 0, 2*pi);
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
g3 = [pi/4, pi];
labelZeros(f3, g3);

%% 4)
f4 = @(x) log(x) + x.^2 - 3;
graphFun(f4, 0, 3);
g4 = 1.5;
labelZeros(f4, g4);

%% 5)
f5 = @(x) x .^ -1 + x.^2 - 3;
graphFun(f5, -2.5, 3, 500);
xlim([-2.5 3]);
ylim([-20 20]);
g5 = [-1.5 0.5 1.5];
labelZeros(f5, g5);
%% 6)
f6 = @(x) x .* exp(-x) - 0.2;
graphFun(f6, -0.5, 4, 500);
ylim([-0.5 0.5]);
g6 = [0.25 2.5];
labelZeros(f6, g6);
%% Functions
function graphFun(fun, min, max, n)
    arguments
        fun
        min
        max
        n = 150
    end
    xv = linspace(min, max, n);
    figure;
    hold on;
    xline(0);
    yline(0);
    grid on;
    grid minor;
    plot(xv, fun(xv));
end
function labelZeros(fun, guesses)
    for ii = 1:length(guesses)
        rt = fzero(fun, guesses(ii));
        text(rt, fun(rt), "\leftarrow Zero at x = " + string(rt), "Rotation", 20);
    end
end