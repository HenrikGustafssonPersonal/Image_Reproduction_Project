function [index] = GetBestSSIM(indexN,dataSetImages,datasetImageSize, chunk)
% This funtion calculates the SSIm value for a number of images and return
% the best one compared to the input chunk.
resizedChunk = imresize(chunk, [datasetImageSize datasetImageSize]);

SSIMValues = zeros(length(indexN),1);
greyChunk = rgb2gray(resizedChunk);
for i=1:length(indexN)
    dataSetImg = cell2mat(dataSetImages(1,indexN(i)));
    grayDataImg = rgb2gray(dataSetImg);
    SSIMValues(i) = ssim(grayDataImg,greyChunk);
end

[maxVal, maxIndex] = max(SSIMValues);
index = indexN(maxIndex);
end

