% Question 13 (Lecture 13): Box-and-whisker plot and Pearson's coefficient of skewness
clc; clear; close all;

x = sort([12 14 15 15 15 17 18 18 19 20 22 25 28 31 40]);   % build durations (min)
n  = numel(x);
xb = mean(x);
S  = sqrt(sum((x - xb).^2) / n);
Md = median(x);
Mo = mode(x);

X0 = x(1);  Q1 = x((n+1)/4);  Q3 = x(3*(n+1)/4);  Xm = x(end);
fprintf('Five-number summary: %d  %d  %d  %d  %d\n', X0, Q1, Md, Q3, Xm);
fprintf('Mean = %.2f,  Median = %.2f,  Mode = %d,  S.D. = %.4f\n', xb, Md, Mo, S);

Sk1 = (xb - Mo) / S;                  % Pearson's coefficient (mean - mode)/S
Sk2 = 3 * (xb - Md) / S;              % alternative form 3(mean - median)/S
fprintf('Sk (mean-mode)       = %.4f\n', Sk1);
fprintf('Sk (3(mean-median))  = %.4f\n', Sk2);

% ---- Box-and-whisker plot drawn from the five-number summary ----
figure; hold on;
rectangle('Position', [Q1, 0.7, Q3 - Q1, 0.6]);            % box from Q1 to Q3
plot([Md Md], [0.7 1.3], 'LineWidth', 2);                  % median line
plot([X0 Q1], [1 1]);  plot([Q3 Xm], [1 1]);               % whiskers
plot([X0 X0], [0.85 1.15]);  plot([Xm Xm], [0.85 1.15]);   % whisker end-caps
ylim([0 2]);  set(gca, 'YTick', []);
xlabel('Build duration (min)'); title('Box-and-Whisker Plot of Build Durations'); grid on;
