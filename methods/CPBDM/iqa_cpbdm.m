function [time, score] = iqa_cpbdm(idx, imgPath)
    fprintf(1, "cpbdm is calculating the %d th img %s.\n", idx, imgPath);
    
    startTime = datetime("now");
    img = rgb2gray(imread(imgPath));
    score = CPBD_compute(img);
    endTime = datetime("now");
    time = endTime - startTime;
end