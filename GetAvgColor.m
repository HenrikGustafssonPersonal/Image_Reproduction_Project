function [AvgCIELABcolor] = GetAvgColor(image)
imageLab = rgb2lab(image);
lAvg = mean(mean(imageLab(:,:,1)));
aAvg = mean(mean(imageLab(:,:,2)));
bAvg = mean(mean(imageLab(:,:,3)));
AvgCIELABcolor = [lAvg aAvg bAvg];
end

