% Specify the destination folder path
folderPath = 'your path';

% 获Get information about all image files in a folder
files = dir(fullfile(folderPath, '*.jpg')); % Assuming the image is in JPG format, if there are other formats, adjust accordingly

% Iterate over files and rename them
for k = 1:length(files)
    oldName = fullfile(folderPath, files(k).name);
    newName = fullfile(folderPath, sprintf('Image%d.jpg', k)); % New filename
    movefile(oldName, newName); % Rename file
end