function dna = parsedna(filename)
% ------------------------------------------
% Parse fasta file and returns a string, the DNA sequence 
% 
% filename: filename/directory of the fasta file that contains the DNA
% sequence
% ------------------------------------------
    fileID = fopen(filename, 'r');
    % Get first line of fasta file and discard
    temp = fgetl(fileID);
    % Initialize output string
    dna = '';
    % Concatenate DNA sequence into one string
    while ~isempty(temp)
        temp = fgetl(fileID);
        dna = strcat(dna, temp);
    end
    fclose(fileID);
end