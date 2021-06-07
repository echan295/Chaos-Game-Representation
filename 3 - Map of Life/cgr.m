function data = cgr(dna)
% ---------------------------------------
% Calculate CGR points and store in a matrix
% 
% dna: string with DNA sequence
% ---------------------------------------

    % Get length of DNA sequence
    n = length(dna);
    % Initialize matrix to store CGR point (coordinates)
    data = zeros(n+1, 2);
    for i = 1:n
        if dna(i) == 'A'
            data(i+1, :) = (data(i, :) + [0, 0])/2;
        elseif dna(i) == 'C'
            data(i+1, :) = (data(i, :) + [0, 1])/2;
        elseif dna(i) == 'G'
            data(i+1, :) = (data(i, :) + [1, 1])/2;
        else
            data(i+1, :) = (data(i, :) + [1, 0])/2;
        end
    end
end