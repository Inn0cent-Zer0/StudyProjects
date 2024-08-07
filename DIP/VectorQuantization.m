% Generate random data points
data = rand(100, 2);

% Define the number of clusters (codebook size)
K = 10;

% Initialize the codebook with random values
codebook = rand(K, 2);

% Find the nearest codebook entry for each data point using Euclidean distance
[~, indices] = pdist2(codebook, data, 'euclidean', 'Smallest', 1);

% Encode the data by mapping each point to its nearest codebook entry
encodeData = codebook(indices, :);

% Calculate the compression ratio
compressionRatio = numel(data) / numel(encodeData);

% Decode the data by reconstructing it from the codebook indices
decodedData = codebook(indices, :);

% Calculate the distortion between the original and decoded data
distortion = mean(sqrt(sum((data - decodedData) .^ 2, 2)));

% Print the compression ratio
fprintf('Compression Ratio: %.2f\n', compressionRatio);

% Print the distortion value
fprintf('Distortion: %.4f\n', distortion);
