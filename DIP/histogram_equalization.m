% Load the image from the specified file path
I = imread('tire.tif');

% Display the histogram of the image
imhist(I);

% Create a new figure window
figure;

% Apply histogram equalization to enhance the contrast of the image
I_eq = histeq(I);

% Display the equalized image
imshow(I_eq);
title('Histogram Equalized Image');

% Display the histogram of the equalized image
figure;
imhist(I_eq);
title('Histogram of Equalized Image');
