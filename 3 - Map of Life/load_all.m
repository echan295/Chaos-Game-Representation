% Create CGR images for all FASTA files (located in the FASTA files folder)

% Collect names of all files within the FASTA files directory
dna_files = dir('FASTA files\**\*.fasta');
% Iterate over each filename and create CGR image. Save CGR images in the
% CGR folder
for i = 1:length(dna_files)
    ind_name = strfind(dna_files(i).name, '.');
    ind_folder = strfind(dna_files(i).folder, '\');
    folder = dna_files(i).folder(ind_folder(end)+1:end);
    main([folder, '\', dna_files(i).name], ['CGR\', folder,'\', dna_files(i).name(1:ind_name-1), '.png']);
end