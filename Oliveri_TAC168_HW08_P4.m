clear;
clc;
close all;

xv = 0:10;
% because rand() no arguments outputs a scalar
% and because this function operates on entire matrices at once
% we have to make diff random noise for each matrix position
% otherwise we generate a single piece of noise and apply it
% uniformly to everything
y = @(x) sin(0.2*x) + 0.1*rand(size(x));
yv = y(xv);
figure;
hold on;
grid on;
grid minor;
plot(xv, yv, 'o');

xv1 = linspace(0, 10);
plot(xv1, polyval(polyfit(xv, yv, 3), xv1));
xlabel("x");
ylabel("y");
title("P4");