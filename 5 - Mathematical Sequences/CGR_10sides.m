function CGR_10sides(S)
% -------------------------------------------
% Creates CGR with 10-gon based on sequences of integers (0 to 9)
% 
% S: array of integers (integers must be between 0 and 9, inclusive)
% -------------------------------------------

    % Calculate coordinates of vertices
    n = 10;
    x = cos(2*pi*((0:n)/n));
    y = sin(2*pi*((0:n)/n));
    vertex = [x(1:end-1); y(1:end-1)];
    % Calculate the dividing ratio for 10-gon
    r = dividingrate(n);

    % Initialize matrix to store point coordinates
    cgr = zeros(2, length(S)+1);

    % Iterate over integer sequence to get CGR points
    for i = 1:length(S)
        cgr(:, i+1) = cgr(:, i) + (vertex(:, round(S(i))+1) - cgr(:, i))*r;
    end

    % Plot figure
    figure()
    plot(x, y, 'k')
    hold on
    plot(cgr(1, :), cgr(2, :), 'k.', 'MarkerSize', 1)
    hold off
    axis('equal');
    axis([-1.12, 1.12, -1.12, 1.12]);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);

    % Label vertices
    AA = '0123456789';
    for i = 1:n
      if vertex(1, i) < -0.2
        if vertex(2, i) < -0.2
          text(vertex(1, i)-0.05, vertex(2, i)-0.05, AA(i))
        elseif vertex(2, i) > 0.2
          text(vertex(1, i)-0.05, vertex(2, i)+0.05, AA(i))
        else
          text(vertex(1, i)-0.065, vertex(2, i), AA(i))
        end
      elseif vertex(1, i) > 0.2
        if vertex(2, i) < -0.2
          text(vertex(1, i)+0.0075, vertex(2, i)-0.04, AA(i))
        elseif vertex(2, i) > 0.2
          text(vertex(1, i)+0.0075, vertex(2, i)+0.04, AA(i))
        else
          text(vertex(1, i)+0.025, vertex(2, i), AA(i))
        end
      else
        if vertex(2, i) < -0.2
          text(vertex(1, i)-0.025, vertex(2, i)-0.05, AA(i))
        else
          text(vertex(1, i)-0.03, vertex(2, i)+0.05, AA(i))
        end
      end
    end
end