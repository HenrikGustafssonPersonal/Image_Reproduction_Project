function [meanSciealabValue] = scielabCheck(orig,final, distance)
% This function calculates the S-Cielab value depending on distance from
% screen.
origXYZ = rgb2xyz(orig);
finalXYZ = rgb2xyz(final);

deg = visualAngle(-1, distance/2.5,300,1);
whitepoint = [95.05, 100, 108.9];

sciealabValue = scielab(deg, origXYZ, finalXYZ, whitepoint, 'xyz');

meanSciealabValue = mean(mean(sciealabValue));
end

