clc;
clear;
close all;

% Q2: Data Collection and Sampling

% Total number of students
N = 240;

% Students in each section
section_A = 60;
section_B = 50;
section_C = 70;
section_D = 60;

% Required sample size
n = 24;

% Proportional sample sizes
sample_A = (section_A / N) * n;
sample_B = (section_B / N) * n;
sample_C = (section_C / N) * n;
sample_D = (section_D / N) * n;

% Display proportional sample sizes
disp('Proportional Sample Sizes:');
fprintf('Section A = %d students\n', sample_A);
fprintf('Section B = %d students\n', sample_B);
fprintf('Section C = %d students\n', sample_C);
fprintf('Section D = %d students\n', sample_D);

fprintf('Total Sample = %d students\n', ...
    sample_A + sample_B + sample_C + sample_D);

% Systematic sampling interval
k = N / n;

disp('Systematic Sampling Interval:');
disp(k);

% Example random starting point
random_start = 7;

% Generate 24 systematic sample positions
systematic_sample = random_start:k:(random_start + (n-1)*k);

disp('Example Systematic Sample IDs:');
disp(systematic_sample);

% Bar graph of proportional sample sizes
sections = categorical({'A','B','C','D'});
sample_sizes = [sample_A sample_B sample_C sample_D];

figure;
bar(sections, sample_sizes);

xlabel('Section');
ylabel('Number of Students');
title('Proportional Sample Size by Section');
grid on;