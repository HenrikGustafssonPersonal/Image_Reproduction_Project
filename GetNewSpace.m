function [ColorSpace, avgColors] = GetNewSpace(Dataset, Colors, start, thresh, goal)
    % This function creates a smaller space of images by
    % removing images that are similar to another image.
    %
    % Parameters:
    % Dataset - The dataset of images that needs to be optimized.
    % Colors - An array of each image average color in the dataset.
    % start - Which index in the Dataset to start at.
    % thresh - The starting threshold to determine if a image should be
    % removed.
    % goal - The desired amount of images in the new space of images
    %
    % Returns:
    % ColorSpace - The new optimized dataset.
    % avgColorspace - Array of the average color of each image in the new
    % optimized dataset.
    
    ColorSpace = Dataset;
    avgColors = Colors;
    
    if (length(avgColors) == goal)
        return
    end
    
    if (start > length(avgColors))
        thresh = thresh + 0.1;
        start = 1;
    end
    
    for i = 1:length(avgColors)
        distances(i) = GetColorDistance(avgColors(start,:), avgColors(i,:));
    end
    [minColorDist, index]= mink(distances, 2);
    
    if (minColorDist(2) < thresh)
        ColorSpace(index(2)) = [];
        avgColors(index(2),:) = [];
    end
    
    [ColorSpace, avgColors] = GetNewSpace(ColorSpace, avgColors, start+1, thresh, goal);
end