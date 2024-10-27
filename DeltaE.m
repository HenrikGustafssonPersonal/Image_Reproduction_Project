function [DeltaE,meanE,maxE] = DeltaE(LAB,LAB_ref)
DeltaE = sqrt((LAB(:,:,1)-LAB_ref(:,:,1)).^2 + (LAB(:,:,2)-LAB_ref(:,:,2)).^2 + (LAB(:,:,3)-LAB_ref(:,:,3)).^2);
meanE = mean(mean(DeltaE));
maxE = max(max(DeltaE));
end

