% Initialize 'maida' as a 20x20 matrix of zeros
maida = zeros(20, 20);

% Fill 'maida' with values where each element is the product of its row and column indices
for i = 1:20
    for j = 1:20
        maida(i, j) = i * j; % Assign values to 'maida'
    end
end

% Create a combined image by arranging 'maida' and its transformations
maida_combined = [maida, fliplr(maida); flipud(maida), flipud(fliplr(maida))];

% Display the combined image with color scaling
imagesc(maida_combined);
axis square; % Set axis to square aspect ratio
colorbar; % Add a colorbar to show the scale of values

% Generate random data 'xer' of size 100x100
xer = rand(100, 100);

% Display 'xer' using a grayscale colormap
figure; % Open a new figure window
imagesc(xer); % Display the data with scaled colors
axis square; % Set axis to square aspect ratio
colormap gray; % Use a grayscale colormap
colorbar; % Add a colorbar to show the scale of values
