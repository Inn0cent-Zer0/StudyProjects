img = imread('jsg (Custom).jfif');
imshow(img)
% Resize the image to a specific width and height
newWidth = 200;
newHeight = 150;
resizedImg = imresize(img, [newHeight, newWidth]);

% Display the resized image
imshow(resizedImg);
title('Resized Image');