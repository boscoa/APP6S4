function [ratio MSE] = PSNR(I,K)

% m = largeur d'une image
% n = longueur d'une image
% I = image actuelle;
% K = image bruité;

MSE = 0;
m = length(I);
n = length(I(1,:));
for i = 1:m
    for j = 1:n
       MSE = MSE + (I(i,j)-K(i,j)).^2; 
    end
end
MSE = MSE/(m.*n);
MAXi = max(I(:));
ratio = 20.*log(MAXi) - 10.*log(MSE);