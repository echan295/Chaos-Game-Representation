function S = readseq(filename)
% ------------------------------------------
% Create a vector of integers mapping amino acide to an integer (from 1 to 20)
% 
% filename: fasta file with amino acid sequence
% ------------------------------------------
  % Read in file
  txt = fileread(filename);
  % remove all new line characters
  txt = strrep(txt, newline, '');
  % Initialize vector of zeros that is the same length as the polypeptide
  % (amino acid chain)
  S = zeros(1, length(txt));
  AA = 'ARNDCQEGHILKMFPSTWYVBZ';
  % Go through each amino acid and 
  for i = 1:length(AA)
    F = strfind(txt, AA(i));
    % If amino acid is a B, then randomly assign value either a 3 (N) or a
    % 4 (D)
    if i == 21
      for j = 1:length(F)
        if rand() < 0.5
          S(F(j)) = 3;
        else
          S(F(j)) = 4;
        end
      end
    % If amino acid is a Z, then randomly assign value either a 6 (Q) or a
    % 7 (E)
    elseif i == 22
      for j = 1:length(F)
        if rand() < 0.5
          S(F(j)) = 6;
        else
          S(F(j)) = 7;
        end
      end
    % Otherwise, assign amino acid according to order listed in variable AA
    else
      for j = 1:length(F)
        S(F(j)) = i;
      end
    end
  end
  % If any elements in vector S is 0, then output error message
  if ~isempty(find(~S, 1))
    error('Not all amino acids were assigned a value')
  end
end