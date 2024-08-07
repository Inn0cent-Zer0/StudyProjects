% Load the image from the specified file path
img = imread('jsg.jfif');

% Create a copy of the image
I = imread('jsg (Custom).jfif');

% Display the original image
imshow(I);

% Convert the original image to grayscale
grayimg = rgb2gray(img);

% Detect edges in the grayscale image using the Canny edge detector
edges = edge(grayimg, 'Canny');

% Display the edges detected in the image
imshow(edges);

% Add a title to the edges detected image
title('Edges Detected');
