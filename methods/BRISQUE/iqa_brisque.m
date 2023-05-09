function [time, score] = iqa_brisque(idx, imgPath)
    fprintf(1, "brisque is calculating the %d th img %s.\n", idx, imgPath);
    
    img = imread(imgPath);
    startTime = datetime("now");
    score = brisquescore(img);
    endTime = datetime("now");
    time = endTime - startTime;
end

