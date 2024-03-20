% Specify the path to the folder where the original image is located and the destination path.
sourceFolderPath = 'your path';
targetFolderPath = 'your path';

% Get information about all image files in a folder
files = dir(fullfile(sourceFolderPath, '*.jpg')); % Suitable for JPG format

% Open the parallel pool (if not already open)
if isempty(gcp('nocreate'))
    parpool;
end

% Parallel processing of all documents
parfor k = 1:length(files)
    k
    % Read the original image
    originalImage = imread(fullfile(sourceFolderPath, files(k).name));
    
    % Resizing pictures
    resizedImage = imresize(originalImage, [488, 870]); % New dimensions of 870x488
    
    % Constructing new filenames and paths
    newFileName = fullfile(targetFolderPath, files(k).name);
    
    % Save the adjusted image
    imwrite(resizedImage, newFileName);
end