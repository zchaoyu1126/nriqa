function [time, score] = iqa_rise(idx, imgPath)
    fprintf(1, "rise is calculating the %d th img %s.\n", idx, imgPath);

    startTime = datetime("now");
    img = imread(imgPath);
    scale = 3;
    score = RISE(img, scale);
    endTime = datetime("now");
    time = endTime - startTime;
    
end