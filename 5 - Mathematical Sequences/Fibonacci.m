function F = Fibonacci(n)
% -------------------------------------------
% Calculates the Fibonacci sequence (Note, cannot correctly calculate large sequences due to floating point)
% 
% n: length of sequence
% -------------------------------------------

    % Initialize array
    F = zeros(1, n+1);
    % Starting Fibonacci sequence
    F(2) = 1;
    for i = 3:n+1
        % Formula for Fibonacci sequence
        F(i) = F(i-1) + F(i-2);
    end
end