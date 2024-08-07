% Read the original grayscale image from the specified file
origi = imread('cameraman.tif');

% Create a subplot for displaying multiple images in a single figure
% Display the original image in the first subplot
subplot(1, 2, 1);
imshow(origi);
title('Original Image');

% Flip the original image horizontally (left to right)
flip = fliplr(origi);

% Display the flipped image in the second subplot
subplot(1, 2, 2);
imshow(flip);
title('Flipped Image');
