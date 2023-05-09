function [sharpnessScore, map] = MLVSharpnessMeasure(x)

T=1000;
alpha=-0.01;
x=double(x);
x(:)=x(:)/255; 
x=rgb2gray(x);

[map] = MLVMap(x);

[xs, ys]=size(map);
xy_number=xs*ys;
l_number=round(xy_number);      % 四舍五入到最接近的整数
vec = reshape(map,1,xy_number); % 变成一个向量
vec=sort(vec,'descend');        % 排序
svec=vec(1:l_number);

a=(1:xy_number);
q=exp(alpha*a);
svec=svec.*q;
svec=svec(1:T);
[E, gamparam, sigma] = estimateggdparam(svec);
sharpnessScore=sigma;   
end %function

