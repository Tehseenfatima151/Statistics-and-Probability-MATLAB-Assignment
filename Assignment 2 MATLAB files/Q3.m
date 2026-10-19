% Question 3 (Lecture 3): Frequency distribution of a discrete variable
clc; clear; close all;

failed = [2 0 1 3 2 1 4 2 2 0 1 3 2 5 1 2 3 0 2 1 4 2 3 1 2 6 1 2 0 3];  % failed CI builds/day

x = unique(failed);                   % distinct values
f = zeros(size(x));
for i = 1:numel(x)
    f(i) = sum(failed == x(i));       % frequency of each value
end
n   = sum(f);
rf  = f / n;                          % relative frequency
pct = rf * 100;                       % percentage frequency
cf  = cumsum(f);                      % cumulative frequency

fprintf('%-8s %-6s %-10s %-8s %-6s\n', 'Failed', 'f', 'Rel.f', 'Percent', 'C.f');
for i = 1:numel(x)
    fprintf('%-8d %-6d %-10.4f %-8.2f %-6d\n', x(i), f(i), rf(i), pct(i), cf(i));
end
fprintf('Total n = %d\n', n);
fprintf('Mode = %d failed builds/day\n', x(f == max(f)));
fprintf('Days with at most 2 failures = %d (%.2f%%)\n', cf(x == 2), 100*cf(x == 2)/n);

stem(x, f, 'filled', 'LineWidth', 2);      % line chart for a discrete variable
xlabel('Failed builds per day'); ylabel('Number of days');
title('Line Chart of Failed CI Builds per Day'); grid on;
