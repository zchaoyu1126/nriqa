%% Matlab code, RISE

clc
clear
close all

%% Read  image
img = imread('lady.bmp');
%figure,imshow(img)  
scale = 3;
%% compute quality score
score = RISE(img,scale)
