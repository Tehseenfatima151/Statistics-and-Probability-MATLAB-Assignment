% Question 6 (Lecture 6): Stem-and-leaf display and mode
clc; clear; close all;

loc = [23 35 41 28 35 52 19 35 44 28 31 47 35 26 58 39 28 45 33 36 22 35 40 28];
% lines changed per commit
loc = sort(loc);

stems = floor(loc / 10);              % tens digit
leaves = mod(loc, 10);                % units digit

fprintf('Stem | Leaves\n');
for s = min(stems):max(stems)
    fprintf('%4d | %s\n', s, sprintf('%d ', leaves(stems == s)));
end
fprintf('Key: 2 | 3 means 23 lines changed\n\n');

m  = mode(loc);                       % most frequent value
fm = sum(loc == m);
fprintf('Mode = %d lines (occurs %d times)\n', m, fm);
fprintf('Median = %.1f lines\n', median(loc));
fprintf('Mean   = %.3f lines\n', mean(loc));
