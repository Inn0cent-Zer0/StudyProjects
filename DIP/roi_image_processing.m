% Load the image from the specified file path
baka = imread('C:/Program Files/MATLAB/R2014b/toolbox/images/imdata/eight.tif');

% Display the image in a figure window
imshow(baka);

% Allow user to select a region of interest (ROI) in the image
idiot = roipoly(baka);

% Create a subplot with 1 row and 2 columns
subplot(1,2,1);

% Display the original image in the first subplot
imshow(baka);

% Add a title to the first subplot
title('Original Image');

% Display the modified image in the second subplot, where the ROI is applied
subplot(1,2,2);
imshow(baka .* idiot);  % Element-wise multiplication to apply ROI mask

% Add a title to the second subplot
title('Image after multiplication');
