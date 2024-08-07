img = imread('jsg (Custom).jfif');

% Rotate the image by a specified angle (in degrees)
angle = 30;
rotatedImg = imrotate(img, angle);

% Display the rotated image
imshow(rotatedImg);
title('Rotated Image');