% Question 9 (Lecture 9): Geometric mean, harmonic mean and their relation to the AM
clc; clear; close all;

% ---- (a) Average monthly growth of active users (GM) ----
users  = [10000 12000 15000 13500 14850];       % Jan ... May
factor = users(2:end) ./ users(1:end-1);        % month-to-month growth factors
gm_g   = prod(factor)^(1/numel(factor));        % geometric mean
gm_log = exp(mean(log(factor)));                % same result through logarithms
fprintf('Growth factors      = %s\n', sprintf('%.2f ', factor));
fprintf('Geometric mean      = %.4f  (average growth = %.2f%% per month)\n', ...
    gm_g, (gm_g-1)*100);
fprintf('GM via logarithms   = %.4f\n', gm_log);
fprintf('Check: 10000*GM^4   = %.0f\n\n', 10000*gm_g^4);

% ---- (b) Average processing speed over equal batches (HM) ----
speed = [40 60 120];                            % files per minute
am = mean(speed);
gm = prod(speed)^(1/numel(speed));
hm = numel(speed) / sum(1 ./ speed);
fprintf('AM = %.4f,  GM = %.4f,  HM = %.4f\n', am, gm, hm);
fprintf('AM >= GM >= HM ? %d\n', am >= gm && gm >= hm);

bar([am gm hm]);
set(gca, 'XTickLabel', {'AM', 'GM', 'HM'});
ylabel('Files per minute'); title('AM >= GM >= HM for the Three Batch Speeds'); grid on;
