% Question 4 (Lecture 4): Frequency distribution of a continuous variable
clc; clear; close all;

t = [1.2 2.8 3.4 1.9 2.2 4.1 2.6 3.0 1.5 2.4 3.7 2.1 2.9 1.8 3.3 ...
    2.5 4.6 2.0 3.1 2.7 1.6 3.5 2.3 2.8 3.9 2.2 1.4 3.2 2.6 5.0];   % page load times (s)

R = max(t) - min(t);                  % range
k = 5;                                % number of classes
h = ceil(R / k);                      % class interval (3.8/5 = 0.76 -> 1)

lower = 1.0 + (0:k-1) * h;            % lower class limits
upper = lower + h - 0.1;              % upper class limits
LB = lower - 0.05;                    % lower class boundaries
UB = upper + 0.05;                    % upper class boundaries
mid = (lower + upper) / 2;            % class mid-points

f = zeros(1, k);
for i = 1:k
    f(i) = sum(t >= LB(i) & t < UB(i));
end
cf = cumsum(f);  rf = f / sum(f);

fprintf('Range = %.1f,  h = %d\n\n', R, h);
fprintf('%-11s %-13s %-6s %-5s %-7s %-5s\n', 'Class', 'Boundaries', 'Mid', 'f', 'Rel.f', 'C.f');
for i = 1:k
    fprintf('%.1f-%.1f   %.2f-%.2f   %-6.2f %-5d %-7.4f %-5d\n', ...
        lower(i), upper(i), LB(i), UB(i), mid(i), f(i), rf(i), cf(i));
end

bar(mid, f, 1);                       % histogram (bars touch each other)
hold on;
plot([mid(1)-h, mid, mid(end)+h], [0, f, 0], '-o', 'LineWidth', 1.5);   % frequency polygon
xlabel('Page load time (s)'); ylabel('Number of pages');
title('Histogram and Frequency Polygon of Page Load Times'); grid on;
