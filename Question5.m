clc;
clear;
close all;

% Q5: Frequency Curves and Data Presentation

% Scores of students
scores = [42 55 61 67 70 76 78 83 86 89 ...
    94 96 54 60 65 72 74 81 85 92];

% Sort the data
sorted_scores = sort(scores);

% Mean
mean_score = mean(scores);

% Median
median_score = median(scores);

% Frequency table
edges = [40 50 60 70 80 90 100];
frequency = histcounts(scores, edges);

% Cumulative frequency
cumulative_frequency = cumsum(frequency);

% Class midpoints
midpoints = [44.5 54.5 64.5 74.5 84.5 94.5];

% Display results
disp('Sorted Scores:');
disp(sorted_scores);

fprintf('\nMean = %.2f\n', mean_score);
fprintf('Median = %.2f\n', median_score);

disp(' ');
disp('Frequency Distribution:');
disp('Class       Frequency    Cumulative Frequency');

class_names = {'40-49','50-59','60-69','70-79','80-89','90-99'};

for i = 1:length(frequency)
    fprintf('%-10s %9d %22d\n', ...
        class_names{i}, frequency(i), cumulative_frequency(i));
end

% Check mode
[counts, unique_scores] = hist(scores, unique(scores));
max_count = max(counts);

if max_count == 1
    disp('Mode: No mode (Amodal)');
else
    mode_values = unique_scores(counts == max_count);
    fprintf('Mode: ');
    fprintf('%g ', mode_values);
    fprintf('\n');
end

% Frequency polygon
figure;
plot(midpoints, frequency, '-o', 'LineWidth', 2);

xlabel('Class Midpoint');
ylabel('Frequency');
title('Frequency Polygon of Student Scores');
grid on;

% Less-than cumulative frequency curve
upper_boundaries = [49.5 59.5 69.5 79.5 89.5 99.5];

figure;
plot(upper_boundaries, cumulative_frequency, '-o', 'LineWidth', 2);

xlabel('Upper Class Boundary');
ylabel('Cumulative Frequency');
title('Less-Than Cumulative Frequency Curve');
grid on;