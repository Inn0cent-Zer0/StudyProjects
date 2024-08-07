% This code demonstrates low-pass filtering which removes high frequency components
% and blurs the image. The blurring is achieved through low-pass filtering using an 
% average filter. The code first applies a fixed-size average filter, then iterates 
% through various sizes of the average filter to show the effect of increasing filter size.

% Load and display the original image
x = imread('Golden.jfif');
imshow(x);
title('Original Image');

% Create an average filter of size 10x10
ag = fspecial('average', [10, 10]);

% Apply the average filter to the image
g = imfilter(x, ag);

% Display the filtered image
imshow(g);
title('Image with 10x10 Average Filter');

% Clear command window, workspace, and close all figure windows
clc;
clear all;
close all;

% Reload the original image
x = imread('Golden.jfif');

% Iterate through different filter sizes from 1x1 to 30x30
for i = 1:30
    % Create an average filter of size ixi
    ag = fspecial('average', [i, i]);

    % Apply the average filter to the image
    g = imfilter(x, ag);

    % Display the filtered image
    imshow(g);

    % Update the figure window with the new image
    drawnow;
end
