function F = Fibonacci_mod10(n)
% -------------------------------------------
% Calculates the Fibonacci sequence modulo 10
% 
% n: length of sequence
% -------------------------------------------

    % Initialize array
    F = zeros(1, n+1);
    % Starting Fibonacci sequence
    F(2) = 1;
    for i = 3:n+1
        % Take modulo 10 right away
        F(i) = mod(F(i-1) + F(i-2), 10);
    end
end