I = imread('sun.jpg');
figure;
subplot(1,2,1);
imshow(I);
title('Original Image');

J = imnoise(I, 'salt & pepper', 0.04);

subplot(1,2,2);
imshow(J);
title('Salt and Pepper Noise');
