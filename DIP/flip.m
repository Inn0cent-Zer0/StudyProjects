origi = imread('D:/Vaishnavi/008_Matlab/cameraman.tif');
subplot(1,2,1);
imshow(origi);
title('Original Image');
flip = fliplr(origi);
subplot(1,2,2);
imshow(flip);
title('Flipped Image');
