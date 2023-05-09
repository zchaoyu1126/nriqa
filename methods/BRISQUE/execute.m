clear;
clc;
close all;

method = "brisque";

% srcFolder = "F:\thesis\dataset\myown\fromcannon\test4";
% imgFormat = "*.bmp";
% startGID = 1;
% endGID = 10;

% srcFolder = "F:\thesis\dataset\myown\fromcannon\test5";
% imgFormat = "*.JPG";
% startGID = 1;
% endGID = 5;

srcFolder = "F:\thesis\dataset\myown\fromcannon\test6";
imgFormat = "*.jpg";
startGID = 2;
endGID = 6;

% srcFolder = "F:\thesis\dataset\tid2008\group";
% srcFolder = "F:\thesis\dataset\tid2013\group";
% imgFormat = "*.bmp";
% startGID = 8;
% endGID = 8;

for k = startGID:endGID
    groupID = sprintf("group%02d", k);
    paths = dir(fullfile(srcFolder, groupID, imgFormat));
    scores = zeros(1, length(paths));
    for i = 1:length(paths)
        path = fullfile(srcFolder, groupID, paths(i).name);
        [~, score] = brisque(path);
        scores(i) = score;
    end
    saveMatPath = fullfile(srcFolder, sprintf("group%02d", k), sprintf("%s.mat", method));
    save(saveMatPath, "scores");
end

disp("finished");
