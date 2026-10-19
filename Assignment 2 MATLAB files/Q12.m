% Question 12 (Lecture 12): Chebyshev's inequality, empirical rule, five-number summary
clc; clear; close all;

x = sort([182 190 195 198 200 203 205 208 210 213 218 222 230 245 262]);  % latency (ms)
n  = numel(x);
xb = mean(x);
S  = sqrt(sum((x - xb).^2) / n);                % standard deviation (divisor n)
fprintf('Mean = %.2f ms,  S.D. = %.2f ms\n\n', xb, S);

% ---- Chebyshev and empirical rule ----
k   = [1 2 3];
emp = [68 95 99.7];                              % empirical rule (bell-shaped data)
fprintf('%-3s %-20s %-11s %-11s %-8s\n', 'k', 'Interval (ms)', ...
    'Chebyshev', 'Empirical', 'Actual');
for j = 1:3
    lo = xb - k(j)*S;  hi = xb + k(j)*S;
    actual = 100 * sum(x >= lo & x <= hi) / n;   % share of the sample inside the interval
    cheb   = 100 * (1 - 1/k(j)^2);               % Chebyshev lower bound
    fprintf('%-3d %7.2f - %-9.2f >= %5.1f%%    ~%5.1f%%    %5.1f%%\n', ...
        k(j), lo, hi, cheb, emp(j), actual);
end

% ---- Five-number summary ----
X0 = x(1);  Q1 = x((n+1)/4);  Md = median(x);  Q3 = x(3*(n+1)/4);  Xm = x(end);
fprintf('\nFive-number summary: X0=%d  Q1=%d  Median=%d  Q3=%d  Xm=%d\n', X0, Q1, Md, Q3, Xm);
fprintf('Q1-X0 = %d,  Xm-Q3 = %d\n', Q1 - X0, Xm - Q3);
fprintf('Median = %.1f,  Mid-quartile range = %.1f,  Midrange = %.1f\n', ...
    Md, (Q1+Q3)/2, (X0+Xm)/2);
