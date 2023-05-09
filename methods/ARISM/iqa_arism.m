function [time, score1, score2] = iqa_arism(idx, imgPath)
    fprintf(1, "arism is calculating the %d th img %s.\n", idx, imgPath);
    
    % 这里的时间计算其实有一些问题
    % 因为ARISMC计算了两个分数,具体见demo.m

    startTime = datetime("now");
    img = imread(imgPath);
    score = ARISMC(img);
    endTime = datetime("now");

    time = endTime - startTime;
    score1 = score(1);
    score2 = score(2);
end