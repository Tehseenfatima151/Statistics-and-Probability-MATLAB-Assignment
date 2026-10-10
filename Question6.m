clc;
clear;
close all;

% Q6: Stem-and-Leaf Display and Central Tendency

% Execution times in seconds
execution_time = [12 15 17 18 19 21 21 23 24 24 ...
    25 26 27 28 28 29 31 32 34 35 ...
    36 38 41 43 47];

% Sort data
execution_time = sort(execution_time);

% Mean
mean_time = mean(execution_time);

% Median
median_time = median(execution_time);

% Mode
mode_time = mode(execution_time);

% Display central tendency
disp('Central Tendency:');
fprintf('Mean = %.2f seconds\n', mean_time);
fprintf('Median = %.2f seconds\n', median_time);
fprintf('Mode = %.2f seconds\n', mode_time);

% Stem-and-leaf display
disp(' ');
disp('Stem-and-Leaf Display:');

stems = floor(execution_time / 10);
leaves = mod(execution_time, 10);
unique_stems = unique(stems);

disp('Stem | Leaves');

for i = 1:length(unique_stems)
    current_stem = unique_stems(i);
    current_leaves = leaves(stems == current_stem);

    fprintf('%4d | ', current_stem);
    fprintf('%d ', current_leaves);
    fprintf('\n');
end

disp('Key: 1 | 2 = 12 seconds');

% Frequency distribution
edges = [10 20 30 40 50];
frequency = histcounts(execution_time, edges);
cumulative_frequency = cumsum(frequency);

class_names = {'10-19','20-29','30-39','40-49'};

disp(' ');
disp('Frequency Distribution:');
disp('Class       Frequency    Cumulative Frequency');

for i = 1:length(frequency)
    fprintf('%-10s %9d %22d\n', ...
        class_names{i}, frequency(i), cumulative_frequency(i));
end

% Histogram
figure;
histogram(execution_time, edges);

xlabel('Execution Time (seconds)');
ylabel('Frequency');
title('Histogram of Test Case Execution Times');
grid on;

% Frequency polygon
midpoints = [14.5 24.5 34.5 44.5];

figure;
plot(midpoints, frequency, '-o', 'LineWidth', 2);

xlabel('Class Midpoint (seconds)');
ylabel('Frequency');
title('Frequency Polygon of Execution Times');
grid on;

% Cumulative frequency curve
upper_boundaries = [19.5 29.5 39.5 49.5];

figure;
plot(upper_boundaries, cumulative_frequency, '-o', 'LineWidth', 2);

xlabel('Upper Class Boundary (seconds)');
ylabel('Cumulative Frequency');
title('Cumulative Frequency Curve of Execution Times');
grid on;