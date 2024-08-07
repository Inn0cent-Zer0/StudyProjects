% Read the input image
originalImage = imread('jsg.jfif');

% Apply Canny edge detection
edgeImage = edge(rgb2gray(originalImage), 'Canny');

% Display the original and edge-detected images
figure; % Create a new figure window

% Display the original image in the first subplot
subplot(1, 2, 1); % Divide the figure into a 1x2 grid, and select the first section
imshow(originalImage); % Show the original image
title('Original Image'); % Set the title of the first subplot

% Display the edge-detected image in the second subplot
subplot(1, 2, 2); % Select the second section of the 1x2 grid
imshow(edgeImage); % Show the edge-detected image
title('Edge-Detected Image'); % Set the title of the second subplot
