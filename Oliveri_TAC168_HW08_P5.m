clear;
clc;
close all;

T = readtable("HMW8TAC168.xlsx");

figure(1);
hold on;
grid on;
grid minor;

plot(T.t, T.Measured, 'o');

% figure(2);
% semilogy(T.t, T.Measured, 'o');
% hold on;
% grid on;
% grid minor;

validIdx = (T.t > 0) & (T.Measured > 0);

linCoeffs = polyfit(T.t(validIdx), log(T.Measured(validIdx)), 1);
b = linCoeffs(1);
ln_a = linCoeffs(2);
a = exp(ln_a);
disp("beta = " + string(b));
disp("ln(alpha) = " + string(ln_a));
disp("alpha = " + string(a));

fit = @(t) a*exp(b*t);
tv1 = linspace(0, 30);
plot(tv1, fit(tv1));
xlabel("x");
ylabel("y");
title("P5");
% ylim([0 550]);