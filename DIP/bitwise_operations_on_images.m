% Clear the command window, workspace, and close all figure windows
clc;
clear all;
close all;

% Load and display the first image
innocentzero = imread('plus.jpg');
imshow(innocentzero);
title('Plus Structure');

% Create a new figure window
figure;

% Load the second image and resize it to match the dimensions of the first image
innocentone = imread('penta.jpg');
[a, b, c] = size(innocentzero);
innocentone = imresize(innocentone, [a, b]);
imshow(innocentone);
title('Octagon Structure');

% Create a new figure window for the AND operation
figure;

% Perform bitwise AND operation between the two images and display the result
innocenttwo = bitand(innocentzero, innocentone);
imshow(innocenttwo);
title('Output of And operation');

% Create a new figure window for the OR operation
figure;

% Perform bitwise OR operation between the two images and display the result
innocenttwo = bitor(innocentzero, innocentone);
imshow(innocenttwo);
title('Output of Or operation');

% Create a new figure window for the NOT operation
figure;

% Perform bitwise NOT operation on the first image and display the result
innocenttwo = bitcmp(innocentzero);
imshow(innocenttwo);
title('Output of Not operation');

% Create a new figure window for the XOR operation
figure;

% Perform bitwise XOR operation between the two images and display the result
innocenttwo = bitxor(innocentzero, innocentone);
imshow(innocenttwo);
title('Output of XOR operation');
