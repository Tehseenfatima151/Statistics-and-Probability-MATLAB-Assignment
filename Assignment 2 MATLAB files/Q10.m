% Question 10 (Lecture 10): Range, quartile deviation and their coefficients
clc; clear; close all;

A = [40 42 45 47 48 50 52 53 55 58 60];         % Server A response times (ms)
B = [20 30 36 42 46 50 54 58 64 70 80];         % Server B response times (ms)

servers = {A, B};  names = {'Server A', 'Server B'};
for j = 1:2
    x  = sort(servers{j});
    n  = numel(x);
    Q1 = x((n+1)/4);                            % (n+1)/4 th value  (3rd)
    Q3 = x(3*(n+1)/4);                          % 3(n+1)/4 th value (9th)
    R  = max(x) - min(x);                       % range
    CD = (max(x) - min(x)) / (max(x) + min(x)); % coefficient of dispersion
    QD = (Q3 - Q1) / 2;                         % quartile deviation
    CQD = (Q3 - Q1) / (Q3 + Q1);                % coefficient of quartile deviation
    fprintf('%s: mean=%.1f  Range=%d  Coeff.Disp=%.3f\n', names{j}, mean(x), R, CD);
    fprintf('          Q1=%d  Q3=%d  QD=%.1f  Coeff.QD=%.3f\n', Q1, Q3, QD, CQD);
end

plot(1:11, sort(A), '-o', 1:11, sort(B), '-s');
legend('Server A', 'Server B', 'Location', 'northwest');
xlabel('Ordered observation'); ylabel('Response time (ms)');
title('Ordered Response Times of the Two Servers'); grid on;
