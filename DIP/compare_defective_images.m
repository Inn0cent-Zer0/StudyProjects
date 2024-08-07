% Load the non-defective PCB image from the specified file path
ug = imread('Non-defective.jpg');  
% Load the defective PCB image from the specified file path
pg =  imread('Defective.jpg'); 

% Get the dimensions of the non-defective image
[q, c, ~] = size(ug);

% Resize the defective image to match the dimensions of the non-defective image
weekend = imresize(pg, [q, c]);

% Create a subplot with 1 row and 3 columns

% Display the non-defective image in the first subplot
subplot(1, 3, 1);
imshow(ug);
title('PCB Image without any defect');

% Display the defective image in the second subplot
subplot(1, 3, 2);
imshow(pg);
title('PCB Image with defect');

% Calculate the difference between the non-defective image and the resized defective image
difference = imsubtract(ug, weekend);

% Display the difference image in the third subplot
subplot(1, 3, 3);
imshow(difference);
title('Error');
