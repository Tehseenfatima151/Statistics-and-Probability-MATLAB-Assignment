% Question 5 (Lecture 5): Cumulative frequency distribution and ogive
clc; clear; close all;

UB  = 10:10:70;                       % upper class boundaries (hours)
f   = [8 15 22 18 10 5 2];            % tickets per class
mid = UB - 5;                         % class mid-points
cf  = cumsum(f);                      % "less than" cumulative frequency
n   = sum(f);

fprintf('%-12s %-6s %-12s\n', 'Less than', 'f', 'Cum. freq');
for i = 1:numel(UB)
    fprintf('%-12d %-6d %-12d\n', UB(i), f(i), cf(i));
end

% ---- Reading values from the ogive (linear interpolation) ----
within25  = interp1([0 UB], [0 cf], 25);
within45  = interp1([0 UB], [0 cf], 45);
fprintf('\nTickets resolved within 25 h = %.0f\n', within25);
fprintf('Tickets taking more than 45 h = %.0f\n', n - within45);

% ---- Shape of the distribution ----
avg = sum(f .* mid) / n;              % mean from mid-points
cprev = [0 cf(1:end-1)];              % cumulative frequency before each class
i   = find(cf >= n/2, 1);             % median class
med = (UB(i)-10) + 10 / f(i) * (n/2 - cprev(i));
fprintf('Mean = %.2f h,  Median = %.2f h\n', avg, med);

plot([0 UB], [0 cf], '-o', 'LineWidth', 1.5); hold on;
plot([25 25 0], [0 within25 within25], '--');
xlabel('Resolution time (hours, upper class boundary)'); ylabel('Cumulative number of tickets');
title('"Less Than" Ogive of Ticket Resolution Time'); grid on;
