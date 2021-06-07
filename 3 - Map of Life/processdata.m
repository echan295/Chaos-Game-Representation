function mesh = processdata(data)
% ----------------------------------------
% Create image from matrix of coordinates made by cgr()
% 
% data: n+1 by 2 matrix with all point coordinates stored
% ----------------------------------------

    % dimension of the image
    n = 504;
    % Create matrix; each element is a pixel on the image. (0 = black, 1 =
    % white)
    mesh = ones(n);
    % Calculate width and height of each pixel on image
    pointWidth = 1/(n-1);
    pointHeight = 1/(n-1);
    % Iterate over all points from data and set corresponding pixel to 0
    for i = 1:length(data)
        xVal = ceil(data(i, 1)/pointWidth);
        yVal = ceil(data(i, 2)/pointHeight);
        mesh(yVal+1, xVal+1) = 0;
    end
    % Flip image vertically (because we plot the image upside down, as the calculations are simpler)
    mesh = flipud(mesh);
end