% Number of iterations (plus 1, since the first point is (0, 0))
N = 50000;

% Create a matrix to store all points
XY = zeros(2, N);

% Iterated function system for Barnsley fern
for i = 2:N
    r = rand;
    if (r <= 0.01)
        XY(:, i) = [0, 0; 0, 0.16]*XY(:, i-1);
    elseif (r <= 0.86)
        XY(:, i) = [0.85, 0.04; -0.04, 0.85]*XY(:, i-1) + [0; 1.6];
    elseif (r <= 0.93)
        XY(:, i) = [0.2, -0.26; 0.23, 0.22]*XY(:, i-1) + [0; 1.6];
    else
        XY(:, i) = [-0.15, 0.28; 0.26, 0.24]*XY(:, i-1) + [0; 0.44];
    end
end

% Plot Barnsley fern
plot(XY(1, :), XY(2, :), '.', 'MarkerSize', 1, 'MarkerEdgeColor',  [0.12, 0.44, 0.21]);
axis([-3, 3, -0.5, 10.5]);
axis('square');
set(gca,'xtick',[]);
set(gca,'ytick',[]);