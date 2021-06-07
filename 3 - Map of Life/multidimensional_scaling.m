% Perform multi-dimensional scaling to visualize the level of dissimilarity
% of individual case of a dataset

% Load structural dissimilarity index measure matrix
load('dsim.mat');

% Calculate the classical multidimensional scaling and eigenvalues of the structural
% dissimilarity index measure matrix (we also saved this result since calculations take a long time)
[Y,eigvals] = cmdscale(dsim);
save('MDM.mat', 'Y', 'eigvals');

% Load results from performing classical multidimensional scaling (if running for a second time, comment the above code and uncomment the code below)
% load('MDM.mat');

% Get number of animal classes
num_class = length(unique(cellfun(@num2str,class,'uni',0)));
% Create hsv colourmap for animal classes
cmap = hsv(num_class);

% Counter initialization for number of animals in each class
n = 1;
% Start figure
figure();
hold on
% Counter initialization to determine what color each point should be (according to animal class)
count = 1;
% Animal class names
leg = {'Amphibians', 'Birds', 'Bony Fish',...
    'Cartilage Fish', 'Coelacanths', 'Crocodylia', ...
    'Hagfish', 'Lampreys', 'Lizards', 'Lungfish', 'Mammals', 'Turtles'};
% Go through each class and plot scatter plot (each class is a different colour)
while n < length(animals)
    ind = strfind(class, class{n});
    ind = find(not(cellfun('isempty', ind)));
    len = length(ind);
    plot(Y(n:n+len-1, 1), Y(n:n+len-1, 2), '.', 'MarkerSize', 10, ...
        'MarkerFaceColor', cmap(count, :), 'MarkerEdgeColor', cmap(count, :));
    n = n + len;
    count = count + 1;
end
hold off
legend(leg, 'FontSize', 14);