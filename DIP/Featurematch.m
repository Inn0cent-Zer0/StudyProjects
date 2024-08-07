% Read the reference and target images from the specified files
referenceImage = imread('jsg.jfif');
targetImage = imread('jsg (Custom).jfif');

% Convert images to grayscale and detect Harris corner features
% Harris corners are used to find points of interest in the images
pointsReference = detectHarrisFeatures(rgb2gray(referenceImage));
pointsTarget = detectHarrisFeatures(rgb2gray(targetImage));

% Extract features from the detected points in both images
% Features are descriptors that represent the local image neighborhood around each detected point
[featuresReference, validPointsReference] = extractFeatures(rgb2gray(referenceImage), pointsReference);
[featuresTarget, validPointsTarget] = extractFeatures(rgb2gray(targetImage), pointsTarget);

% Match the extracted features between the reference and target images
% The matchFeatures function finds correspondences between features from both images
indexPairs = matchFeatures(featuresReference, featuresTarget);

% Get the matched points from the valid detected points
% indexPairs contains the indices of matched points in the reference and target images
matchedPointsReference = validPointsReference(indexPairs(:, 1));
matchedPointsTarget = validPointsTarget(indexPairs(:, 2));

% Display the matched points on both images side-by-side using a montage
figure;
showMatchedFeatures(referenceImage, targetImage, matchedPointsReference, matchedPointsTarget, 'montage');
title('Matched Features');
