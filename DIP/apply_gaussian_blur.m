% Load the image from the specified file path 
img = imread('Img.jpeg'); 

% Apply Gaussian blur (smoothing) to the image
sigma = 2; % Standard deviation of the Gaussian kernel
blurredImg = imgaussfilt(img, sigma); % Apply Gaussian filter to the image

% Display the blurred image
imshow(blurredImg);

% Add a title to the displayed image
title('Blurred Image');
