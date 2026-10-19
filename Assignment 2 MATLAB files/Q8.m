% Question 8 (Lecture 8): Median, quartiles and percentiles of grouped data (open-ended classes)
clc; clear; close all;

% Classes: Under 100 | 100-150 | 150-200 | 200-250 | 250-300 | 300 and above
L = [NaN 100 150 200 250 300];        % lower boundaries (first class is open-ended)
f = [6 18 32 24 12 8];                % number of requests
h = 50;                               % class width of the closed classes
n = sum(f);
cf = cumsum(f);
cprev = [0 cf(1:end-1)];              % cumulative frequency before each class

idx = @(p) find(cf >= p*n, 1);                              % class containing the p-th quantile
gq  = @(p) L(idx(p)) + h ./ f(idx(p)) .* (p*n - cprev(idx(p)));   % l + (h/f)(pn - c)

p = [0.10 0.25 0.50 0.75 0.90];
names = {'P10', 'Q1', 'Median', 'Q3', 'P90'};
for j = 1:numel(p)
    fprintf('%-7s = %8.2f ms\n', names{j}, gq(p(j)));
end
fprintf('Requests slower than 300 ms = %.0f%%\n', 100 * f(end) / n);

% ---- Graphic location of the quantiles (ogive) ----
ub = [100 150 200 250 300];           % upper boundaries of the closed-end classes
plot(ub, cf(1:5), '-o', 'LineWidth', 1.5); hold on;
q = [gq(0.25) gq(0.50) gq(0.75)];
plot(q, [0.25 0.50 0.75] * n, 'rs', 'MarkerFaceColor', 'r');
xlabel('Latency (ms)'); ylabel('Cumulative frequency');
title('Ogive with Q1, Median and Q3'); grid on;
