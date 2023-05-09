function [time, score] = iqa_duan(idx, path, kerSize)
%IQA_DUAN 此处显示有关此函数的摘要
%   此处显示详细说明
    fprintf(1, "duan's is calculating the %d th img %s.\n", idx, path);
    startTime = datetime("now");

    %% read image and turn into gray scale image
    img = rgb2gray(imread(path));
    img = int64(img);
    
    %% caculate q(x,y)
    [h, w] = size(img);
    matrixI = int64(zeros(h, w));
    matrixJ = int64(zeros(h, w));
    % matrixI 上移一格 matrixJ 左移一格
    matrixI(1:h-1, 1:w) = img(2:h,1:w);
    matrixJ(1:h, 1:w-1) = img(1:h, 2:w);
    d1 = img - matrixI;
    d2 = img - matrixJ;
    d1(h,:) = 0;
    d2(:,w) = 0;
    matrix = d1 .* d2;
    matrix = abs(matrix);
   
    %% caculate Qmn
    M = floor(h / kerSize);
    N = floor(w / kerSize);
    totalSum = 0;
    for i = 1:M
        for j = 1:N
            subMat = matrix((i-1)*kerSize+1:i*kerSize, (j-1)*kerSize+1:j*kerSize);
            subMatSum = sum(subMat(:));
            totalSum = subMatSum * subMatSum + totalSum;
        end
    end
    
    score = totalSum / M / N;
    endTime = datetime("now");
    time = endTime - startTime;
end

