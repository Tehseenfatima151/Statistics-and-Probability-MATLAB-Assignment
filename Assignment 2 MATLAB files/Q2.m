% Question 2 (Lecture 2): Simple random sampling of beta testers
clc; clear; close all;

N = 120;                              % population size (beta testers)
n = 8;                                % sample size

total_samples = nchoosek(N, n);       % number of possible samples (without replacement)
p_include     = n / N;                % probability that a given tester is selected
p_one_sample  = 1 / total_samples;    % probability of any one particular sample

fprintf('Number of possible samples  = %d\n', total_samples);
fprintf('P(a given tester selected)  = %.4f\n', p_include);
fprintf('P(one particular sample)    = %.4e\n', p_one_sample);

% ---- Draw one simple random sample (random-number method) ----
rng(2026);                            % fixed seed so the draw can be repeated
selected = sort(randperm(N, n));
fprintf('Selected tester IDs         = %s\n', mat2str(selected));

% ---- Simulation check of the inclusion probability n/N ----
trials = 20000;  target = 17;  hits = 0;
for k = 1:trials
    s = randperm(N, n);
    hits = hits + any(s == target);
end
fprintf('Simulated P(tester %d)      = %.4f (theory = %.4f)\n', target, hits/trials, p_include);
