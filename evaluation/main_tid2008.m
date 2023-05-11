load("tid2008_mos.mat");
folder = "../result/20230510T113137";
methods = {'ARISM', 'BIBLE', 'BIQI', 'BRISQUE', 'CPBDM', ...
   'MAXPOOL', 'MLV', 'RISE', 'SSEQ'};

for i = 1 : length(methods)
    %% 根据需要修改结果文件目录
    fileName = sprintf("%s/%s_tid2008.mat", folder, methods{i});
    load(fileName);
    
    % 图片保存目录imgDir
    imgDir = sprintf("%s/img", folder);
    if exist("imgDir", "dir") == 0
        mkdir(imgDir);
    end

    %% 计算plcc,srocc,rmse,mae
    y = mos;
    x = scores;
    x = x';
    [nx, ~] = mapminmax(x, 0, 9);
    warning off;
    
    imgName = sprintf("%s/tid2008_%s.svg", imgDir, methods{i});
    [plcc, srocc, rmse, mae] = evaluate(imgName, nx', y);
    fprintf(1, "method:%s plcc:%f, srocc:%f, rmse:%f, mae:%f\n", methods{i}, plcc, srocc, rmse, mae);
end
    




