function main(filename, writeto)
% -------------------------------------------
% Function that calls the other functions in the correct order to create
% CGR image
% 
% Functions that this function is dependent on:
% - parsedna(filename)
% - cgr(dna)
% - processdata(data)
% 
% filename: filename/directory of the fasta file that contains the DNA
% writeto: location and name of file to save the CGR image as
% -------------------------------------------

    % Get DNA string from Fasta file
    dna = parsedna(filename);
    % Generate the matrix that stores CGR points
    data = cgr(dna);
    % Create image of CGR
    mesh = processdata(data);
    % Write CGR image to specified location
    imwrite(mesh, writeto);
end