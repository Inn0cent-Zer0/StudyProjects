% Load the images
moz = imread('C:/Program Files/MATLAB/R2014b/toolbox/images/imdata/toysnoflash.png');
art = imread('C:/Program Files/MATLAB/R2014b/toolbox/images/imdata/toysflash.png');

% Ensure both images are grayscale (if not, convert them to grayscale)
if size(moz, 3) > 1
    moz = rgb2gray(moz);
end

if size(art, 3) > 1
    art = rgb2gray(art);
end

% Display the size of 'moz' image
[giggle_height, giggle_width] = size(moz);

% Resize 'art' image to the same size as 'moz'
Shrinky = imresize(art, [giggle_height, giggle_width]);

% Convert images to double for subtraction
moz = double(moz);
Shrinky = double(Shrinky);

% Calculate the difference between 'moz' and 'Shrinky'
output = moz - Shrinky;

% Display the images
figure;

subplot(1, 3, 1);
imshow(uint8(moz));  % Convert back to uint8 for display
title('Image 1 - No Flash');

subplot(1, 3, 2);
imshow(uint8(Shrinky));  % Convert back to uint8 for display
title('Image 2 - Flash');

subplot(1, 3, 3);
imshow(uint8(output));  % Convert back to uint8 for display
title('Difference');
