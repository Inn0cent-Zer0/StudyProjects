% Accessing Pixel Values of an RGB Image

% Read the RGB image from the specified file path
% 'imread' reads the image and stores it in the variable 'colorImage'
colorImage = imread('C:/Program Files/MATLAB/R2014b/toolbox/images/imdata/onion.png');

% Access the red component value of the pixel at row 50, column 70
% 'colorImage(50, 70, 1)' accesses the red channel value at pixel location (50, 70)
redValue = colorImage(50, 70, 1);

% Access the green component value of the pixel at row 50, column 70
% 'colorImage(50, 70, 2)' accesses the green channel value at pixel location (50, 70)
greenValue = colorImage(50, 70, 2);

% Access the blue component value of the pixel at row 50, column 70
% 'colorImage(50, 70, 3)' accesses the blue channel value at pixel location (50, 70)
blueValue = colorImage(50, 70, 3);

% Display the red value
% 'num2str' converts the numeric red value to a string for display
% 'disp' displays the red value with a descriptive label
disp(['Red value: ', num2str(redValue)])

% Display the green value
% 'num2str' converts the numeric green value to a string for display
% 'disp' displays the green value with a descriptive label
disp(['Green value: ', num2str(greenValue)])

% Display the blue value
% 'num2str' converts the numeric blue value to a string for display
% 'disp' displays the blue value with a descriptive label
disp(['Blue value: ', num2str(blueValue)])

% Alternatively, display the RGB values together using 'sprintf'
% 'sprintf' formats the red, green, and blue values into a single string
% The format specifier '%d' indicates that the values are integers
disp(sprintf('Value of the red, green, and blue pixel is %d, %d, %d', redValue, greenValue, blueValue))
