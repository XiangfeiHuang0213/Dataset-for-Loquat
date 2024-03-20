% Define paths to original and destination folders
sourceFolder = 'your path';
targetFolder = 'your path';

% Get all .jpg files in the original folder
files = dir(fullfile(sourceFolder, '*.jpg'));

% Generate a random sequence
randomOrder = randperm(length(files));

% Make sure the destination folder exists, or create it if it doesn't
if ~exist(targetFolder, 'dir')
    mkdir(targetFolder);
end

% Iterate through files, copy and rename
for i = 1:length(files)
    % Full path of the original file
    oldFile = fullfile(files(randomOrder(i)).folder, files(randomOrder(i)).name);
    % New file name and path
    newFile = fullfile(targetFolder, sprintf('Image%d.jpg', i+1337));
    % Copy and rename files
    copyfile(oldFile, newFile);
end

fprintf('Done!%dfiles have been renamed and stored in the%s\n', length(files), targetFolder);
