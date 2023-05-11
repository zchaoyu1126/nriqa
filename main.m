function main()
    methodMap = containers.Map();

    methodMap('ARISM') = 1; methodMap('BIBLE') = 2; methodMap('BIQI') = 3;
    methodMap('BRISQUE') = 4; methodMap('CPBDM') = 5; methodMap('DUAN') = 6;
    methodMap('MAXPOOL') = 7; methodMap('MLV') = 8; methodMap('RISE') = 9;
    methodMap('SSEQ') = 10;

    handles = {@iqa_arism, @iqa_bible, @iqa_biqi, @iqa_brisque, @iqa_cpbdm,...
        @iqa_duan, @iqa_maxpool, @iqa_mlv, @iqa_rise, @iqa_sseq};

    % 根据需要修改参与测试的方法
    % methods = {'ARISM', 'BIBLE', 'BIQI', 'BRISQUE', 'CPBDM', 'DUAN', ...
    %    'MAXPOOL', 'MLV', 'RISE', 'SSEQ'};
    methods = {'MLV'};
    
    % 根据需要修改参与测试的数据集
    datasets = {'live'};

    time_stamp = datestr(now, 30);
    folder = sprintf("./result/%s", time_stamp); %%定义变量
    if exist(folder,"dir") == 0 
        mkdir(folder);  
    end

    queue = TaskQueue();
    for i = 1 : length(methods)
        for j = 1 : length(datasets)
            method = handles{methodMap(methods{1, i})};
            paths = getImagePaths(datasets{j});
            fileName = sprintf("%s/%s_%s.mat", folder, methods{1, i}, datasets{j});
            functionDir = sprintf("./methods/%s", methods{1, i});
            
            task = Task();
            task = task.init(method, paths, fileName, functionDir);
            queue = queue.pushTask(task);
        end
    end

    task = queue.getNextTask();
    queue = queue.popTask();
    while ~isempty(task)
        task.execute();
        task = queue.getNextTask();
        queue = queue.popTask();
    end  
end

function paths = getImagePaths(dataset)
    root = "..\dataset";
    files = "";
    expectedNum = 0;

    if dataset == "tid2008"
        expectedNum = 100;
        pos = "tid2008\renamed_distorted_images";
        files = dir(fullfile(root, pos, '*_08_*.bmp'));
    elseif dataset == "tid2013"
        expectedNum = 125;
        pos = "tid2013\renamed_distorted_images";
        files = dir(fullfile(root, pos, '*_08_*.bmp'));
    elseif dataset == "csiq"
        expectedNum = 150;
        pos = "CSIQ\dst_imgs\blur";
        files = dir(fullfile(root, pos, '*.png'));
    elseif dataset == "live"
        expectedNum = 174;
        pos = "live\gblur";
        files = dir(fullfile(root, pos, '*.bmp'));
    end

    if length(files) ~= expectedNum
        return
    end

    paths = cell(expectedNum, 1);
    for i = 1 : expectedNum
        paths{i} = fullfile(files(i).folder, files(i).name);
    end
end
    
    






