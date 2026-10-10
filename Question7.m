clc;
clear;
close all;

% Q7: Arithmetic Mean, Weighted Mean and Median

% Course marks
marks = [78 84 91 76];

% Course weights
weights = [0.30 0.25 0.25 0.20];

% Arithmetic mean
arithmetic_mean = mean(marks);

% Weighted mean
weighted_mean = sum(marks .* weights);

% Coding test scores
coding_scores = [62 70 74 74 79 81 85 88 90 95];

% Median
coding_median = median(coding_scores);

% Mode
coding_mode = mode(coding_scores);

% Display results
disp('Q7 Results');
disp('-----------------------------');

fprintf('Arithmetic Mean = %.2f\n', arithmetic_mean);
fprintf('Weighted Mean = %.2f\n', weighted_mean);
fprintf('Coding Test Median = %.2f\n', coding_median);
fprintf('Coding Test Mode = %.2f\n', coding_mode);

% Weighted contribution of each course
disp(' ');
disp('Weighted Contributions:');

programming = marks(1) * weights(1);
statistics = marks(2) * weights(2);
software_engineering = marks(3) * weights(3);
database = marks(4) * weights(4);

fprintf('Programming = %.2f\n', programming);
fprintf('Statistics = %.2f\n', statistics);
fprintf('Software Engineering = %.2f\n', software_engineering);
fprintf('Database Systems = %.2f\n', database);