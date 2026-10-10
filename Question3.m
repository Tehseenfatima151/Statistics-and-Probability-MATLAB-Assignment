clc;
clear;
close all;

% Q3: Frequency Distribution of a Discrete Variable

% Number of defects in each module
defects = [2 4 3 5 2 6 4 3 5 7 4 2 3 6 5 4 3 8 ...
    2 5 6 4 3 5 7 4 2 6 5 3];

% Unique defect values
values = unique(defects);

% Frequency of each value
frequency = zeros(size(values));

for i = 1:length(values)
    frequency(i) = sum(defects == values(i));
end

% Relative frequency
relative_frequency = frequency / length(defects);

% Cumulative frequency
cumulative_frequency = cumsum(frequency);

% Display frequency table
disp('Frequency Distribution:');
disp('Defects    Frequency    Relative Frequency    Cumulative Frequency');

for i = 1:length(values)
    fprintf('%6d %12d %20.4f %22d\n', ...
        values(i), frequency(i), relative_frequency(i), cumulative_frequency(i));
end

% Find mode
max_frequency = max(frequency);
mode_values = values(frequency == max_frequency);

fprintf('\nMode(s): ');
fprintf('%d ', mode_values);
fprintf('\nMaximum Frequency = %d\n', max_frequency);

% Bar graph
figure;
bar(values, frequency);

xlabel('Number of Defects');
ylabel('Frequency');
title('Frequency Distribution of Defects per Module');
grid on;