function [n]=compute_mscn(imdist)    %计算图像的MSCN系数并统计其像素值出现的频数
 
imdist = rgb2gray(imdist);
imdist = double(imdist);
 
%imdist=phasecong3(imdist);
%imshow(phaseCong)
 
window = fspecial('gaussian',7,7/6);
window = window/sum(sum(window));
 
mu            = filter2(window, imdist, 'same');
mu_sq         = mu.*mu;
sigma         = sqrt(abs(filter2(window, imdist.*imdist, 'same') - mu_sq));
structdis     = (imdist-mu)./(sigma+1);
% imshow(structdis,[]);  %显示MSCN图
% imshow(mu,[]);
% imshow(sigma,[]);
%hist(structdis);
 
for j=1:81              %统计MSCN系数出现的频数
    i=(j-40)*0.05;
    n(j)=length(find(structdis >=i&structdis<i+0.05));
    % t=t+1;
end
n=mapminmax(n,0,1);
 
end