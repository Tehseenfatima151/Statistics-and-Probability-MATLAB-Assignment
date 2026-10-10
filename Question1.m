clc;
clear;
close all;

% Q1: Measurement Error

% Observed development times (months)
observed = [5.1 5.0 5.3 4.9 5.2];

% True development time
true_time = 5.0;

% Measurement errors
error = observed - true_time;

% Absolute errors
absolute_error = abs(error);

% Mean Absolute Error (MAE)
MAE = mean(absolute_error);

% Display results
disp('Observed Times:');
disp(observed);

disp('Measurement Errors:');
disp(error);

disp('Absolute Errors:');
disp(absolute_error);

disp('Mean Absolute Error:');
disp(MAE);

% Graph
figure;
bar(observed);
hold on;
yline(true_time, '--');
hold off;

xlabel('Observation');
ylabel('Development Time (months)');
title('Observed Development Times');
legend('Observed Time', 'True Time');
grid on;