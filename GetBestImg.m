function [outImgIndex] = GetBestImg(CieLabColor,DataSetColors, N)

% Calculate all the Cielab colordistances:
meanDistanceVec = zeros(length(DataSetColors),1);
for i = 1:length(DataSetColors)
    meanDistanceVec(i) = sqrt((CieLabColor(1)-DataSetColors(i,1))^2 +(CieLabColor(2)-DataSetColors(i,2))^2 + (CieLabColor(3)-DataSetColors(i,3))^2);
end
% Get the N best colomatches:
[minVal, indexN] = mink(meanDistanceVec, N);

outImgIndex = indexN;
end

