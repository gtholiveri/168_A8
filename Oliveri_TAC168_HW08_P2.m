clear;
clc;
close all;

f = @(x) sin(x).*exp(-0.1*x) - 0.25;

graphFun(f, -10, 10, 1000, "P2");

guessIntervals = [-10 -8; -4 -2; 2 4];

labelZeros(f, guessIntervals);
for ii=1:height(guessIntervals)
    shadeXArea(guessIntervals(ii,1), guessIntervals(ii,2));
end
function graphFun(fun, min, max, n, ttl)
    arguments
        fun
        min
        max
        n = 150
        ttl = ""
    end
    xv = linspace(min, max, n);
    figure;
    hold on;
    xline(0);
    yline(0);
    grid on;
    grid minor;
    plot(xv, fun(xv));
    xlabel("x");
    ylabel("y");
    title(ttl);
end

function labelZeros(fun, guesses)
    for ii = 1:height(guesses)
        rt = fzero(fun, guesses(ii,:)); % traverse down rows
        text(rt, fun(rt), "\leftarrow Zero at x = " + string(rt), "Rotation", 20);
    end
end

function shadeXArea(min, max)
ylims = ylim;
miny = ylims(1);
maxy = ylims(2);
% four corners of rectangle

fill([min max max min], [miny, miny, maxy, maxy], 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
end