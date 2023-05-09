function [time, score] = iqa_maxpool(idx, imgPath, type)
    fprintf(1, "maxpool is calculating the %d th img %s.\n", idx, imgPath);
    
    %% Load kernel and identify image blur type
    load('..\code\methods\MaxPool\utilities\HVS_MaxPol_kernel.mat');
    params_HVS_MaxPol.kernel_sheets = selected_sheets;
    params_HVS_MaxPol.type = type;   % 'natural' or 'synthetic'

    %% Read Img 
    img = im2double(rgb2gray(imread(imgPath)));

    % %% NR-ISA Score on in-focus/out-of-focus image by HVS-MaxPol-1
    % params_HVS_MaxPol.numKernel = 1; % identify the number of kernels used
    % score1 = HVS_MaxPol(img, params_HVS_MaxPol);

    
    startTime = datetime("now");
    %% NR-ISA Score on in-focus/out-of-focus image by HVS-MaxPol-2
    params_HVS_MaxPol.numKernel = 2; % identify the number of kernels used
    score = HVS_MaxPol(img, params_HVS_MaxPol);
    endTime = datetime("now");
    time = endTime - startTime;
end