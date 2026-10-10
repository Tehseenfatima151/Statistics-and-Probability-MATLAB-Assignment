clc;
clear;
close all;

% Q4: Frequency Distribution of a Continuous Variable

% API response times in milliseconds
response_time = [112 125 118 143 156 134 135 128 142 149 ...
    154 137 126 131 144 159 150 122 129 145 ...
    151 138 119 127 133 148 162 155 141 136 ...
    124 130 147 153 158 121 139 132 146 160];

% Class intervals
edges = [110 120 130 140 150 160 170];

% Calculate frequency
frequency = histcounts(response_time, edges);

% Relative frequency
relative_frequency = frequency / length(response_time);

% Cumulative frequency
cumulative_frequency = cumsum(frequency);

% Display frequency table
disp('Frequency Distribution:');
disp('Class Interval    Frequency    Relative Frequency    Cumulative Frequency');

class_names = {'110-119','120-129','130-139','140-149','150-159','160-169'};

for i = 1:length(frequency)
    fprintf('%-15s %9d %20.3f %22d\n', ...
        class_names{i}, frequency(i), relative_frequency(i), cumulative_frequency(i));
end

% Median class
fprintf('\nMedian Class: 130-139 ms\n');

% Histogram
figure;
histogram(response_time, edges);

xlabel('Response Time (ms)');
ylabel('Frequency');
title('Histogram of API Response Times');
grid on;

% Cumulative frequency curve (Ogive)
upper_boundaries = [119.5 129.5 139.5 149.5 159.5 169.5];

figure;
plot(upper_boundaries, cumulative_frequency, '-o', 'LineWidth', 2);

xlabel('Upper Class Boundary (ms)');
ylabel('Cumulative Frequency');
title('Cumulative Frequency Curve (Ogive)');
grid on;