% Using all CGR images, calculate the dissimilarity matrix

% Get all CGR image filenames
cgr = dir('CGR/**/*.png');
% Find number of CGR images
n = length(cgr);
% Initialize structural dissimilarity index measure
dsim = zeros(n);

% Initialize cell to store names of animals and corresponding class of the
% animal
animals = cell(n, 1);
class = cell(n, 1);

% Find the structural dissimilarity index measure for each animal (only finding upper triangular part of matrix)
for i = 1:n
    ind_animal = strfind(cgr(i).name, '.');
    ind_class = strfind(cgr(i).folder, '\');
    ref = imread([cgr(i).folder, '\', cgr(i).name]);
    animals{i} = cgr(i).name(1:ind_animal-1);
    class{i} = cgr(i).folder(ind_class(end)+1:end);
    for j = 1:n
        if j > i
            A = imread([cgr(j).folder, '\', cgr(j).name]);
            dsim(i, j) = 1 - ssim(A, ref);
        end
    end
end

% Since matrix is symmetrical, we can take the upper triangular part of the
% matrix that we calculated and add its transpose
dsim = dsim + dsim';

% Save the results because this calculation takes a long time
save('dsim.mat', 'dsim', 'animals', 'class');