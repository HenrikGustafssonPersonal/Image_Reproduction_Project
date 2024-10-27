function [distance] = GetColorDistance(C1, C2)
% Calculates the euclidain distance between 2 CIELAB colors:
distance = sqrt((C1(1)-C2(1))^2+(C1(2)-C2(2))^2+(C1(3)-C2(3))^2);
end