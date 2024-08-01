% Read the input grayscale image
originalImage = imread('john.jfif'); 

% Ensure it's a grayscale image
if size(originalImage, 3) == 3
    originalImage = rgb2gray(originalImage);
end

% Extract the bitplane (LSB in this case)
bitplane = bitget(originalImage, 1); % 1 represents the LSB, change as needed

% Display the original and the extracted bitplane
subplot(1, 2, 1), imshow(originalImage), title('Original Image');
subplot(1, 2, 2), imshow(logical(bitplane)), title('Extracted Bitplane');

% Save the extracted bitplane if needed
imwrite(logical(bitplane), 'extracted_bitplane.png');
