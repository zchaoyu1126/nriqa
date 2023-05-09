function [time, score] = iqa_mlv(idx, imgPath)
    fprintf(1, "mlv is calculating the %d th img %s.\n", idx, imgPath);
    
    img = imread(imgPath);
    startTime = datetime("now");
    [score, ~] = MLVSharpnessMeasure(img);
    endTime = datetime("now");
    time = endTime - startTime;
end