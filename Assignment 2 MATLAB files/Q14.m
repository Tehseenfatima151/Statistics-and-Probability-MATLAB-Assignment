% Question 14 (Lecture 14): Moments, Sheppard's corrections, skewness and kurtosis
clc; clear; close all;

L = [10 20 30 40 50 60];              % lower class boundaries (bug-fix time, hours)
h = 10;                               % class interval
f = [2 8 26 10 3 1];                  % frequencies
x = L + h/2;                          % class mid-points
n = sum(f);

% ---- Moments about the mean (direct method) ----
xb = sum(f .* x) / n;
m2 = sum(f .* (x - xb).^2) / n;
m3 = sum(f .* (x - xb).^3) / n;
m4 = sum(f .* (x - xb).^4) / n;
fprintf('Mean = %.2f\nm2 = %.4f\nm3 = %.4f\nm4 = %.4f\n', xb, m2, m3, m4);

% ---- Moment ratios ----
b1 = m3^2 / m2^3;   g1 = sign(m3) * sqrt(b1);   b2 = m4 / m2^2;
fprintf('b1 = %.4f (g1 = %.4f),  b2 = %.4f\n', b1, g1, b2);

% ---- Sheppard's corrections ----
m2c = m2 - h^2/12;
m4c = m4 - (h^2/2) * m2 + (7/240) * h^4;
b1c = m3^2 / m2c^3;   b2c = m4c / m2c^2;
fprintf('Corrected: m2 = %.4f, m3 = %.4f, m4 = %.4f\n', m2c, m3, m4c);
fprintf('Corrected: b1 = %.4f, b2 = %.4f\n', b1c, b2c);

% ---- Quartiles and percentiles of grouped data ----
cf = cumsum(f);  cprev = [0 cf(1:end-1)];
idx = @(p) find(cf >= p*n, 1);
gq  = @(p) L(idx(p)) + h ./ f(idx(p)) .* (p*n - cprev(idx(p)));
Q1 = gq(0.25);  Md = gq(0.50);  Q3 = gq(0.75);  P10 = gq(0.10);  P90 = gq(0.90);
bowley = (Q3 + Q1 - 2*Md) / (Q3 - Q1);
K = ((Q3 - Q1) / 2) / (P90 - P10);
fprintf('Q1 = %.2f, Median = %.2f, Q3 = %.2f, P10 = %.2f, P90 = %.2f\n', Q1, Md, Q3, P10, P90);
fprintf('Bowley skewness = %.4f\n', bowley);
fprintf('Percentile coefficient of kurtosis = %.4f (normal = 0.263)\n', K);

bar(x, f, 1);
xlabel('Bug-fix time (hours)'); ylabel('Number of bugs');
title('Histogram of Bug-Fix Times'); grid on;
