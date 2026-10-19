% Question 7 (Lecture 7): Arithmetic mean, weighted mean and median
clc; clear; close all;

% ---- (a) Sprint velocities (story points) ----
v = [34 28 41 37 30 45 39 33 36 32];
v_sorted = sort(v);
n = numel(v);
am  = sum(v) / n;                     % arithmetic mean
med = median(v);                      % average of the 5th and 6th ordered values
fprintf('Sorted velocities = %s\n', num2str(v_sorted));
fprintf('Arithmetic mean   = %.2f story points\n', am);
fprintf('Median            = %.2f story points\n', med);

% ---- (b) Overall test coverage (weights = module size in KLOC) ----
modules  = {'Auth', 'Payments', 'Search', 'UI'};
coverage = [85 92 70 78];             % test coverage (%)
kloc     = [12  8 20 10];             % weights
simple_mean   = mean(coverage);
weighted_mean = sum(kloc .* coverage) / sum(kloc);
fprintf('\nSimple mean coverage   = %.2f %%\n', simple_mean);
fprintf('Weighted mean coverage = %.2f %%\n', weighted_mean);

bar(coverage); hold on;
plot([0.5 4.5], [weighted_mean weighted_mean], 'r--', 'LineWidth', 1.5);
set(gca, 'XTickLabel', modules);
ylabel('Test coverage (%)'); title('Module Coverage vs Size-Weighted Mean'); grid on;
