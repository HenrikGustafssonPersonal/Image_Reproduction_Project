function [inputResized, nChunksX, nChunksY] = GetImageVariables(inputImg,chunkSize)

%Get image size:
inputImageSize = size(inputImg);

% How many times does dataset image fits in input:
xImageAmount = floor(inputImageSize(2)/ chunkSize);
yImageAmount = floor(inputImageSize(1)/ chunkSize);

% Resize input so it fits and exact amout of dataset images:
inputResized = imresize(inputImg, [chunkSize*yImageAmount chunkSize*xImageAmount]);
resizedSize = size(inputResized);

% Calculate how many chunks there are in the input:
nChunksX = (resizedSize(2))/chunkSize;
nChunksY = (resizedSize(1))/chunkSize;

imshow(inputResized)
disp("Input image is now: " + resizedSize(2) + "x" + resizedSize(1) + "px" )
disp("With a chunkSize of: " + chunkSize + "x" + chunkSize + "px")
disp("The recreacted images will be: " + nChunksX + " by " + nChunksY + " images" )

end

