load("csiq_dmos.mat");
folder = "../result/20230510T113137";
methods = {'ARISM', 'BIBLE', 'BIQI', 'BRISQUE', 'CPBDM', ...
   'MAXPOOL', 'MLV', 'RISE', 'SSEQ'};

for i = 1 : length(methods)
    %% 根据需要修改结果文件目录
    fileName = sprintf("%s/%s_csiq.mat", folder, methods{i});
    load(fileName);
    
    % 图片保存目录imgDir
    imgDir = sprintf("%s/img", folder);
    if exist("imgDir", "dir") == 0
        mkdir(imgDir);
    end

    %% 计算plcc,srocc,rmse,mae
    y = 1-mos;
    minDmos = min(y);
    maxDmos = max(y);
    x = scores;
    x = x';
    [nx, ~] = mapminmax(x, minDmos, maxDmos);
    warning off;
    
    imgName = sprintf("%s/csiq_%s.svg", imgDir, methods{i});
    [plcc, srocc, rmse, mae] = evaluate(imgName, nx', y);
    fprintf(1, "method:%s plcc:%f, srocc:%f, rmse:%f, mae:%f\n", methods{i}, plcc, srocc, rmse, mae);
end
    




