%% CGR of different polygon shapes with a dividing rate of 0.5

% Set number of points in CGR to 25000
N = 25000;
% Set dividing rate to 0.5
r = 0.5;

% Create subplot of CGR for n-gons from n = 4 (square) to 9 (nonagon)
for n = 4:9
    subplot(3, 2, n-3)
    cgr_generalized(N, n, r)
end

%% Illustration of how dividing rate affects square CGR

% Set number of points in CGR to 50000
N = 50000;
% Set number of vertices in polygon to 4
n = 4;
% Create array with dividing rates
r = [0.1, 0.25, 0.4, 0.6, 0.75, 0.9];

for i = 1:length(r)
    subplot(3, 2, i)
    cgr_generalized(N, n, r(i))
end

%% Comparison of ratio formula for different n-gons

% First dividing rate formula (Fiser et al.)
r1 = @(n)(1 + sin(pi/n))^(-1);

% Second dividing rate formula (Almeida and Vinga)
k = @(n) round((n + 2)/4);
r2 = @(n) (2*cos(pi*(1/2 - k(n)/n)) - 2*cos(pi*(1/2 - 1/(2*n)))*cos((2*k(n) - 1)*(pi/(2*n)))*(1 + (tan((2*k(n) - 1)*(pi/(2*n))))/(tan(pi-(n + 2*k(n) - 2)*(pi/(2*n))))))/(2*cos(pi*(1/2 - k(n)/n)));

% Comparison for triangle
N = 25000;
n = 3;
subplot(1, 2, 1)
cgr_generalized(N, n, r1(n))
title(strcat('r = ', num2str(r1(n))))
subplot(1, 2, 2)
cgr_generalized(N, n, r2(n))
title(strcat('r = ', num2str(r2(n))))