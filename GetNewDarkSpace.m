function [ColorSpace, avgColors] = GetNewDarkSpace(inputImg, Dataset, Colors, goal)
% This function optimized the image space based on the average color in the
% entire image.
inputAvgColor = GetAvgColor(inputImg);

ColorSpace = Dataset;
avgColors = Colors;

for i = 1:length(avgColors)
    distances(i) = GetColorDistance(inputAvgColor, avgColors(i,:));
end

[maxColorDist, index]= maxk(distances, length(avgColors) - goal);

ColorSpace(index(:)) = [];
avgColors(index(:),:) = [];

end