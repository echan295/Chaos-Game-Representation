function P = creatingPiArray(n)
% -------------------------------------------
% Get digits of pi and creating an array to store sequence of digits
% 
% n: number of digits of pi after the decimal
% -------------------------------------------

    % Set variable precision to get number of digits of pi
    digits(n);
    % Get pi (built into Matlab)
    a = vpa(pi);
    % Convert results into a string
    c = char(a);
    % Initialization to store digits of pi in array
    P = zeros(1, length(c)-2);
    % Store each digit in array
    for i = 3:length(c)
        P(i-2) = str2num(c(i));
    end
end
