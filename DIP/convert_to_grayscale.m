% Load the image from the specified file path
originalImage = imread('jsg.jfif');

% Convert the image from RGB to grayscale
grayImg = rgb2gray(originalImage);

% Create a new figure window
figure;

% Create a subplot with 1 row and 2 columns, and display the original image in the first subplot
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

% Display the grayscale image in the second subplot
subplot(1, 2, 2);
imshow(grayImg);
title('GrayScale Image');
