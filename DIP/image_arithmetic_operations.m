% Load the image from the specified file path
dilbar = imread('C:/Program Files/MATLAB/R2014b/toolbox/images/imdata/cameraman.tif');

% Create a subplot with 1 row and 3 columns, and display the original image in the first subplot
subplot(1, 3, 1);
imshow(dilbar);
title('Original');

% Add 50 to each pixel value of the image
goms = dilbar + 50;

% Display the image after addition in the second subplot
subplot(1, 3, 2);
imshow(goms);
title('after Addition');

% Subtract 175 from each pixel value of the modified image
caps = goms - 175;

% Display the image after subtraction in the third subplot
subplot(1, 3, 3);
imshow(caps);
title('after Subtraction');
