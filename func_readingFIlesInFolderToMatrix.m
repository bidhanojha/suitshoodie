% function [imageMatrix, y] = func_readingFIlesInFolderToMatrix(LabeldDataFolderPath, Label)


for count = 0:9
    %// Your code
    myFolder = 'C:\Users\bidha\Desktop\ML\SignLanguageChallange\Dataset-master\Dataset'; 
    filePattern = fullfile(myFolder,num2str(count), '*.JPG');
    jpegFiles = dir(filePattern);

    %// New - 3D matrix to store images
    imageMatrix = zeros(numel(jpegFiles), 10000);
    y = zeros(numel(jpegFiles), 1);

    %// Your code
    for k = 1:length(jpegFiles)
        baseFileName = jpegFiles(k).name;
        fullFileName = fullfile(myFolder, num2str(count), baseFileName);
        %fprintf(1, 'Now reading %s\n', fullFileName);
        imageArray100x100 = imread(fullFileName);
        imageArray100x100Gray = rgb2gray(imageArray100x100);
        imageArray100x100New = imresize(imageArray100x100Gray, [100 100]);

        %// New
        imageMatrix(k,:) = imageArray100x100New(:).';
        y(k,1) = count; 
        
    end

    save(sprintf("image%d.mat",count), 'imageMatrix', 'y'); 
end