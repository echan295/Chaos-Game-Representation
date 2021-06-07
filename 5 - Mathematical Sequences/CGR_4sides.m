function CGR_4sides(S, vertex_names)
% -------------------------------------------
% Creates CGR with 4-gon (square) based on sequences of 4 integers
% 
% S: Array of integers
% vertex_names: the unique values of the integer sequence in the order that
% user wants displayed on the plot
% -------------------------------------------

    % Check that the array vertex_names is length 4
    if length(vertex_names) ~= 4
        error('Vertex names vector needs to be of length 4')
    end

    % Establish coordinates of the vertices of CGR plot
    x = [-1, -1, 1, 1, -1];
    y = [-1, 1, 1, -1, -1];
    vertex = [x(1:end-1); y(1:end-1)];

    % Initialize matrix to store CGR points
    cgr = zeros(2, length(S)+1);

    % Iterate over integer sequence to get CGR points
    for i = 1:length(S)
        if S(i) == vertex_names(1)
            cgr(:, i+1) = 0.5*(cgr(:, i) + vertex(:, 1));
        elseif S(i) == vertex_names(2)
            cgr(:, i+1) = 0.5*(cgr(:, i) + vertex(:, 2));
        elseif S(i) == vertex_names(3)
            cgr(:, i+1) = 0.5*(cgr(:, i) + vertex(:, 3));
        else
            cgr(:, i+1) = 0.5*(cgr(:, i) + vertex(:, 4));
        end
    end
    
    % Plot CGR points
    figure()
    plot(x, y, 'k')
    hold on
    plot(cgr(1, :), cgr(2, :), 'k.', 'MarkerSize', 1)
    hold off
    axis('square');
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
end