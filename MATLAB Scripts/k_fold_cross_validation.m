% Setting Basic Parameters
k = 10; % k-fold cross validation
imgDir = 'your path'; % Image folder path
labelDir = 'your path'; %  Labels folder Path
outputDir = 'your path'; % Output folder path

% Read file name
imgFiles = dir(fullfile(imgDir, '*.jpg'));
labelFiles = dir(fullfile(labelDir, '*.txt'));

% Generate k-fold cross-validation index
indices = crossvalind('Kfold', numel(imgFiles), k);

% Creating and populating folder structures
for i = 1:k
    foldDir = fullfile(outputDir, sprintf('fold-%d', i));
    mkdir(foldDir); % Create folders
    
    % Create images and labels folders and their subfolders
    mkdir(fullfile(foldDir, 'images', 'train'));
    mkdir(fullfile(foldDir, 'images', 'val'));
    mkdir(fullfile(foldDir, 'labels', 'train'));
    mkdir(fullfile(foldDir, 'labels', 'val'));
    
    % Creating train.txt and val.txt
    trainFile = fopen(fullfile(foldDir, 'train.txt'), 'w');
    valFile = fopen(fullfile(foldDir, 'val.txt'), 'w');
    
    for j = 1:length(imgFiles)
        if indices(j) == i
            % validation set
            copyfile(fullfile(imgDir, imgFiles(j).name), fullfile(foldDir, 'images', 'val'));
            copyfile(fullfile(labelDir, labelFiles(j).name), fullfile(foldDir, 'labels', 'val'));
            fprintf(valFile, './images/val/%s\n', imgFiles(j).name);
        else
            % training set
            copyfile(fullfile(imgDir, imgFiles(j).name), fullfile(foldDir, 'images', 'train'));
            copyfile(fullfile(labelDir, labelFiles(j).name), fullfile(foldDir, 'labels', 'train'));
            fprintf(trainFile, './images/train/%s\n', imgFiles(j).name);
        end
    end
    
    fclose(trainFile);
    fclose(valFile);
end