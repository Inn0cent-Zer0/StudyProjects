referenceImage = imread('jsg.jfif');
targetImage = imread('jsg (Custom).jfif');

% Detect and match features using Harris corners
pointsReference = detectHarrisFeatures(rgb2gray(referenceImage));
pointsTarget = detectHarrisFeatures(rgb2gray(targetImage));

% Extract features
[featuresReference, validPointsReference] = extractFeatures(rgb2gray(referenceImage), pointsReference);
[featuresTarget, validPointsTarget] = extractFeatures(rgb2gray(targetImage), pointsTarget);

% Match features
indexPairs = matchFeatures(featuresReference, featuresTarget);

% Display matched features
matchedPointsReference = validPointsReference(indexPairs(:, 1));
matchedPointsTarget = validPointsTarget(indexPairs(:, 2));

figure;
showMatchedFeatures(referenceImage, targetImage, matchedPointsReference, matchedPointsTarget, 'montage');
title('Matched Features');
