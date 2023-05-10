function [time, score] = iqa_biqi(idx, imgPath)
    fprintf(1, "biqi is calculating the %d th img %s.\n", idx, imgPath);
    
    startTime = datetime("now");
    img = rgb2gray(imread(imgPath));
    score = biqi(img);
    endTime = datetime("now");

    time = endTime - startTime;
end