function cgr_generalized(N, v, r, filename)
% ---------------------------------------
% Creates a CGR figure according to number of points, shape, and dividing
% rate
% 
% N: number of iterations
% v: number of vertices of shape
% r: dividing rate
% filename: optional argument, filename that you want to save image as
% ---------------------------------------
    
    % calculate location of shape's vertices    
    degrees = linspace(0, 2*pi, 361);
    c = cos(degrees);
    s = sin(degrees);
    shape = zeros(v,2);
    shape_step = 360/v;
    for i = 1:shape_step:360
        shape(round(i/shape_step + 1, 0), 1) = s(round(i));
        shape(round(i/shape_step + 1, 0), 2) = c(round(i));
    end
    
    % create random sequence to choose vertex for each iteration
    seq = randi([1, v], 1, N);
    
    % initialize matrix to store points
    data_points = zeros(N, 2);
    
    % iterate N-1 times to calculate points for CGR
    for i=2:N
        data_points(i, :) = data_points(i-1, :) + (shape(seq(i), :) - data_points(i-1, :))*(r);
    end
    
    % plot shape outline
    plot([shape(:, 1); shape(1, 1)], [shape(:, 2); shape(1, 2)], 'k')
    hold on;
    % plot points
    plot(data_points(:, 1), data_points(:, 2), 'k.', 'MarkerSize', 1);
    hold off;
    % set aspect ratio so that the data units are the same on both the x
    % and y axis
    axis equal;
    % remove axis labels
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    
    % if fourth argument is present, save figure under provided filename
    if nargin == 4
        f=getframe;
        imwrite(f.cdata, filename);
    end
end