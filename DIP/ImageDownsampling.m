% Read the input image
g = imread('zone.png');

% Get the size of the image
[r, c] = size(g);

% Initialize an empty array to store the downsampled image
t = [];

% Initialize temporary indices for the new image
temp = 1;
gemp = 1;

% Loop through the image with a step size of 2 to downsample it
for i = 1:2:r
    for j = 1:2:c
        % Assign every second pixel to the new image array
        t(temp, gemp) = g(i, j);
        gemp = gemp + 1;
    end
    % Move to the next row in the new image array
    temp = temp + 1;
    % Reset column index for the new image array
    gemp = 1;
end

% Convert the new image array to uint8 type
img_resized = uint8(t);

% Display the original image
figure;
imshow(g);
title('Original Image');
truesize;

% Display the resized (downsampled) image
figure;
imshow(img_resized);
title('Resized Image');
truesize;
