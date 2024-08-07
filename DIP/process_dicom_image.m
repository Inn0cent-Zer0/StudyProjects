% Read the DICOM image from the specified file path
WhatAmIDoing = dicomread('knee1.dcm');

% Display the DICOM image using a scaled colormap
imagesc(WhatAmIDoing);

% Find and display the maximum pixel value in the DICOM image
maxPixelValue = max(WhatAmIDoing(:));
disp(['Maximum pixel value: ', num2str(maxPixelValue)]);

% Find and display the minimum pixel value in the DICOM image
minPixelValue = min(WhatAmIDoing(:));
disp(['Minimum pixel value: ', num2str(minPixelValue)]);

% Compute and display the mean pixel value of the DICOM image
meanPixelValue = mean(WhatAmIDoing(:));
disp(['Mean pixel value: ', num2str(meanPixelValue)]);

% Normalize the pixel values of the DICOM image to the range [0, 1]
WTF = mat2gray(WhatAmIDoing);

% Find and display the maximum pixel value in the normalized image
maxNormalizedPixelValue = max(WTF(:));
disp(['Maximum pixel value in normalized image: ', num2str(maxNormalizedPixelValue)]);

% Find and display the minimum pixel value in the normalized image
minNormalizedPixelValue = min(WTF(:));
disp(['Minimum pixel value in normalized image: ', num2str(minNormalizedPixelValue)]);

% Compute and display the mean pixel value of the normalized image
meanNormalizedPixelValue = mean(WTF(:));
disp(['Mean pixel value in normalized image: ', num2str(meanNormalizedPixelValue)]);

% Display the normalized image using a scaled colormap
imagesc(WTF);
