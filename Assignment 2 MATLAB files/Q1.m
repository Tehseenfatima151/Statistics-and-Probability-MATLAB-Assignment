% Question 1 (Lecture 1): Variables, measurement scales and error of measurement
clc; clear; close all;

% ---- (a) Classification of the variables recorded in a build report ----
vars  = {'Build status (Pass/Fail)', 'Bug severity (Low-Critical)', ...
    'Failed tests per build', 'Build time (seconds)'};
kind  = {'Qualitative', 'Qualitative', 'Quantitative (Discrete)', 'Quantitative (Continuous)'};
scale = {'Nominal', 'Ordinal', 'Ratio', 'Ratio'};

fprintf('%-30s %-27s %-8s\n', 'Variable', 'Type', 'Scale');
for i = 1:numel(vars)
    fprintf('%-30s %-27s %-8s\n', vars{i}, kind{i}, scale{i});
end

% ---- (b) Errors of measurement of the profiler ----
true_val = [200 450 120 800];      % true times (ms)
observed = [205 441 123 812];      % times recorded by the profiler (ms)

abs_err = observed - true_val;     % absolute error (keeps its direction)
rel_err = abs_err ./ true_val;     % relative error
pct_err = rel_err * 100;           % percentage error

fprintf('\n%-6s %-6s %-9s %-9s %-10s %-9s\n', 'Task', 'True', 'Observed', ...
    'Abs.Err', 'Rel.Err', 'Pct.Err');
for i = 1:numel(true_val)
    fprintf('T%-5d %-6d %-9d %-9d %-10.4f %-9.2f\n', i, true_val(i), observed(i), ...
        abs_err(i), rel_err(i), pct_err(i));
end
fprintf('\nMean (signed) error = %.2f ms\n', mean(abs_err));

bar(pct_err);
set(gca, 'XTickLabel', {'T1', 'T2', 'T3', 'T4'});
xlabel('Benchmark task'); ylabel('Percentage error (%)');
title('Percentage Error of Profiler Measurements'); grid on;
