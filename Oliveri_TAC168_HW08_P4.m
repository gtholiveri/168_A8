clear;
clc;
close all;

xv = 0:10;
y = @(x) sin(0.2*x) + 0.1*rand();

figure;
hold on;
grid on;
grid minor;
plot(xv, y(xv), 'o');
xv1 = linspace(0, 10);
plot(xv1, polyval(polyfit(xv, y(xv), 3), xv1));