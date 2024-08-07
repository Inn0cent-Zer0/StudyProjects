% Save the current directory path
wd = pwd;

% Change directory to the specified path containing image demo files
cd('C:\Program Files\MATLAB\R2011b\toolbox\images\imdemos');

% Get the list of files and folders in the current directory
D = dir;

% Return to the original directory
cd(wd);

% Define the file extensions to search for
C = {'.tif'; '.jp'; '.png'; '.bmp'};

% Initialize a logical index array to identify files with the specified extensions
idx = false(size(D));

% Loop through each file extension to update the index array
for ii = 1:length(C)
    % Update the index array to mark files that match the current extension
    idx = idx | (arrayfun(@(x) any(strfind(x.name, C{ii})), D));
end

% Filter the directory list to include only files with the specified extensions
D = D(idx);

% Get the number of files matching the criteria
L = length(D);

% Print the names of the files in pairs, with each name formatted to a width of 25 characters
for ii = 1:2:numel(D)
    fprintf('%25s %25s\n', D(ii:min(ii+1, L)).name);
end

% Print a new line for better readability
fprintf('\n');
