%% Matlab code, BIBLE

clc
clear
close all

blkSZ = 8;       % Block size
order = blkSZ-1; % Moment order

%% Read blurred image
img_dst = imread('img114.bmp');
% figure,imshow(img_dst)
img_orgdst = img_dst;
if size(img_dst,3) == 3
    img_dst = rgb2gray(img_dst); 
end
img_dst = makeeven_func(img_dst);  % Eeven size for computing moments
img_dst = double(img_dst);         

%% compute gradient
[SZx, SZy] = size(img_dst);
Tx = [1/2 0 -1/2];
Gx = conv2(img_dst, Tx, 'same');
Gy = conv2(img_dst, Tx', 'same');
Gx(:,1) = img_dst(:,2) - img_dst(:,1);
Gx(:,SZy) = img_dst(:,SZy) - img_dst(:,(SZy-1));
Gy(1,:) = img_dst(2,:) - img_dst(1,:);
Gy(SZx,:) = img_dst(SZx,:) - img_dst((SZx-1),:);
img_gradient = (abs(Gx)+ abs(Gy))/2;

%% compute sharpness score
score = bible_func(img_dst,img_gradient,order,blkSZ,img_orgdst);
