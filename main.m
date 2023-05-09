function main()
    addpath(genpath('.\methods\ARISM'));
    addpath(genpath('.\methods\BIBLE'));
    addpath(genpath('.\methods\BIQI'));
    addpath(genpath('.\methods\BRISQUE'));
    addpath(genpath('.\methods\CPBDM'));
    addpath(genpath('.\methods\DUAN'));
    addpath(genpath('.\methods\MAXPOOL'));
    addpath(genpath('.\methods\MLV'));
    addpath(genpath('.\methods\RISE'));
    addpath(genpath('.\methods\SSEQ'));
    
    methodMap = containers.Map();

    methodMap('ARISM') = 1; methodMap('BIBLE') = 2; methodMap('BIQI') = 3;
    methodMap('BRISQUE') = 4; methodMap('CPBDM') = 5; methodMap('DUAN') = 6;
    methodMap('MAXPOOL') = 7; methodMap('MLV') = 8; methodMap('RISE') = 9;
    methodMap('SSEQ') = 10;

    handles = {@iqa_arism, @iqa_bible, @iqa_biqi, @iqa_brisque, @iqa_cpbdm,...
        @iqa_duan, @iqa_maxpool, @iqa_mlv, @iqa_rise, @iqa_sseq};

    % 根据需要修改参与测试的方法
    methods = {'ARISM', 'BIBLE', 'BIQI', 'BRISQUE', 'CPBDM', 'DUAN',...
        'MAXPOOL', 'MLV', 'RISE', 'SSEQ'};
  
    % 根据需要修改参与测试的数据集
    datasets = {'tid2008', 'tid2013', 'csiq', 'live'};
    
    queue = TaskQueue();
    for i = 1 : length(methods)
        for j = 1 : length(datasets)
            method = handles(methodMap(methods{1, i}));
            [paths, fileName] = getImagePaths(datasets(j)); 
            queue = queue.addTask({method, paths, fileName});
        end
    end

    [queue, task] = queue.getNextTask();
    disp(queue.getQueueLength());

    method = task(1, 1);
    paths = task(1, 2);
    fileName = task(1, 3);
    while ~isempty(task)
        [queue, task] = queue.getNextTask();
    end  
end

function [paths, fileName] = getImagePaths(dataset)
    paths = {};
    fileName = "";
    % root = "..\dataset";
    % files = "";
    % expectedNum = 0;
    % disp(dataset);
    % disp(class(dataset));
    % if dataset == "tid2008"
    %     disp("hiiihi");
    %     expectedNum = 100;
    %     pos = "tid2008\renamed_distorted_images";
    %     files = dir(fullfile(root, pos, '*_08_*.bmp'));
    %     fileName = ".\evl_result\mat\tid2008_blur_result.mat";
    % elseif dataset == "tid2013"
    %     expectedNum = 125;
    %     pos = "tid2013\renamed_distorted_images";
    %     files = dir(fullfile(root, pos, '*_08_*.bmp'));
    %     fileName = ".\evl_result\mat\tid2013_blur_result.mat";
    % elseif dataset == "csiq"
    %     expectedNum = 150;
    %     pos = "CSIQ\dst_imgs\blur";
    %     files = dir(fullfile(root, pos, '*.png'));
    %     fileName = ".\evl_result\mat\csiq_blur_result.mat";
    % elseif dataset == "live"
    %     expectedNum = 174;
    %     pos = "live\gblur";
    %     files = dir(fullfile(root, pos, '*.bmp'));
    %     fileName = ".\evl_result\mat\live_blur_result.mat";
    % end
    % 
    % if length(files) ~= expectedNum
    %     return
    % end
    % 
    % paths = cell(expectedNum, 1);
    % for i = 1 : expectedNum
    %     paths{i} = fullfile(files(i).folder, files(i).name);
    % end
end
    
    






