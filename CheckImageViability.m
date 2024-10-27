function [outputImage] = CheckImageViability(inputImg, req)

inputImageSize = size(inputImg);

% Check if the smalles dimension can fith the required amount of images:
if(min(inputImageSize(2),inputImageSize(1)) < req)
    ScaleNeeded = req / min(inputImageSize(2),inputImageSize(1));
    outputImage = imresize(inputImg, ScaleNeeded);
    disp("The input image: " + inputImageSize(2) + "x" + inputImageSize(1) + "px, was too small so");
    outSize = size(outputImage);
    disp("it was scaled to " + outSize(2) + "x" +outSize(1) + "px to fit the requirement!");
else
    outputImage = inputImg;
    disp("The input image is not too small, proceding!");
end

end

