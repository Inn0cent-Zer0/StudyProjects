% Load the image from the specified file path
originalImage = imread('jsg.jfif');

% Save the image in JPEG format with specified compression quality
imwrite(originalImage, 'compressed_image.jpg', 'Quality', 10); 
