load("live_mos.mat");
load("live_mos_order.mat");
load("live_file_order.mat");
folder = "../result/20230510T113137";
methods = {'ARISM', 'BIBLE', 'BIQI', 'BRISQUE', 'CPBDM', ...
   'MAXPOOL', 'MLV', 'RISE', 'SSEQ'};

for i = 1 : length(methods)
    %% 根据需要修改结果文件目录
    fileName = sprintf("%s/%s_live.mat", folder, methods{i});
    load(fileName);
    
    % 图片保存目录imgDir
    imgDir = sprintf("%s/img", folder);
    if exist("imgDir", "dir") == 0
        mkdir(imgDir);
    end

    n = length(mos);
    nScores = zeros(n, 1);
    for p = 1 : n
        for q = 1 : n
            if strcmp(mosOrder{p}, fileOrder{q})
                nScores(p) = scores(q);
            end
        end
    end
    scores = nScores;
    
    y = -mos;
    maxDmos = max(mos);
    minDmos = min(mos);
    x = scores;
    x = x';
    [nx, ~] = mapminmax(x, minDmos, maxDmos);
    
    warning off;
    imgName = sprintf("%s/live_%s.svg", imgDir, methods{i});
    [plcc, srocc, rmse, mae] = evaluate(imgName, nx', y);
    fprintf(1, "method:%s plcc:%f, srocc:%f, rmse:%f, mae:%f\n", methods{i}, plcc, srocc, rmse, mae); 
end