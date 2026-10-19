% Question 11 (Lecture 11): Mean deviation, variance, S.D. and coefficient of variation
clc; clear; close all;

A = [44 46 49 50 50 51 54 56];        % Server A build times (min)
B = [16 17 19 20 20 21 23 24];        % Server B build times (min)

data = {A, B};  names = {'Server A', 'Server B'};
cv = zeros(1, 2);
for j = 1:2
    x  = data{j};
    n  = numel(x);
    xb = sum(x) / n;                              % mean
    MD = sum(abs(x - xb)) / n;                    % mean deviation about the mean
    V  = sum((x - xb).^2) / n;                    % variance (divisor n, as in the lectures)
    S  = sqrt(V);                                 % standard deviation
    cv(j) = S / xb * 100;                         % coefficient of variation (%)
    fprintf('%s: mean=%.2f  M.D.=%.2f  Var=%.2f  S.D.=%.4f  C.V.=%.2f%%\n', ...
        names{j}, xb, MD, V, S, cv(j));
end
if cv(1) < cv(2)
    fprintf('Server A is relatively more consistent (smaller C.V.).\n');
else
    fprintf('Server B is relatively more consistent (smaller C.V.).\n');
end

bar(cv);
set(gca, 'XTickLabel', names);
ylabel('Coefficient of variation (%)'); title('Relative Variability of Build Times'); grid on;
