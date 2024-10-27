function [outputImg] = GenerateImage(inputResized,ImgSpace, CS, chunkSize, dataSetImageSize,nChunksX,nChunksY, N)

% Create the output image depending on how many chunks there are:
finalImage = zeros(nChunksY*dataSetImageSize, nChunksX*dataSetImageSize, 3);

% Loop through every chunk and determine the best dataset image to
% represent it:
for i=(0:nChunksX-1)
    xStart = (i*dataSetImageSize)+1;
    xEnd = (i*dataSetImageSize+dataSetImageSize);

    for j = (0:nChunksY-1)
        yStart = (j*dataSetImageSize)+1;
        yEnd = (j*dataSetImageSize+dataSetImageSize);
        
        % Define chunk:
        chunk = inputResized((j*chunkSize+1:j*chunkSize+chunkSize),(i*chunkSize+1:i*chunkSize+chunkSize) ,: );
        
        % Get the average color of the specified chunk:
        chunkColor = GetAvgColor(chunk);
        
        % Get the index of the N best image based on CHUNK COLOR:
        datasetImageIndexN = GetBestImg(chunkColor, CS, N);
        
        % Get the index of best image based on STRUCTURAL SIMILARITY:
        datasetImageIndex = GetBestSSIM(datasetImageIndexN,ImgSpace,dataSetImageSize,chunk);
        
        % Get the image from the downscaled dataset:
        choosenImage = cell2mat(ImgSpace(1,datasetImageIndex));
        
        % Place the best dataset image in the output images current location:
        finalImage(yStart:yEnd, xStart:xEnd, :) = choosenImage(1:dataSetImageSize, 1:dataSetImageSize, :);
    end
    disp("Generation: " + ((i+1)/(nChunksX))*100 + "% Complete...")
end
disp("Generation complete!")
outputImg = finalImage;
end

