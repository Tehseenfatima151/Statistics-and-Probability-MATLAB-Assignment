% Question 15 (Lecture 15): Simple linear regression, standard error of estimate, correlation
clc; clear; close all;

X = [2 3 5 6 8 9 11 12];              % module size (KLOC)
Y = [5 6 10 11 16 15 21 24];          % defects found
n = numel(X);

Sx = sum(X);  Sy = sum(Y);  Sxy = sum(X.*Y);  Sx2 = sum(X.^2);  Sy2 = sum(Y.^2);
b = (Sxy - Sx*Sy/n) / (Sx2 - Sx^2/n);           % slope
a = Sy/n - b * Sx/n;                            % intercept
fprintf('Sums: SX=%d SY=%d SXY=%d SX2=%d SY2=%d\n', Sx, Sy, Sxy, Sx2, Sy2);
fprintf('Regression line: Y = %.4f + %.4f X\n', a, b);

Yhat = a + b * X;
Syx  = sqrt(sum((Y - Yhat).^2) / (n - 2));      % standard error of estimate
Syx2 = sqrt((Sy2 - a*Sy - b*Sxy) / (n - 2));    % alternative formula
sy   = sqrt(Sy2/n - (Sy/n)^2);                  % S.D. of Y
fprintf('S_y.x = %.4f (alternative formula: %.4f),  s_y = %.4f\n', Syx, Syx2, sy);

r = (Sxy - Sx*Sy/n) / sqrt((Sx2 - Sx^2/n) * (Sy2 - Sy^2/n));
fprintf('Correlation r = %.4f,  r^2 = %.4f\n', r, r^2);
fprintf('Predicted defects for a 10-KLOC module = %.2f\n', a + b*10);

% ---- Cross-check with built-in functions ----
p  = polyfit(X, Y, 1);
cc = corrcoef(X, Y);
fprintf('polyfit: slope = %.4f, intercept = %.4f; corrcoef r = %.4f\n', p(1), p(2), cc(1,2));

plot(X, Y, 'o', 'MarkerFaceColor', 'b'); hold on;
plot(X, Yhat, 'r-', 'LineWidth', 1.5);
xlabel('Module size (KLOC)'); ylabel('Defects found');
title('Defects vs Module Size with Least-Squares Line'); grid on;
