function [time, score] = iqa_sseq(idx, imgPath)
    fprintf(1, "sseq is calculating the %d th img %s.\n", idx, imgPath);

    startTime = datetime("now");
    imdist = imread(imgPath);
    feature = feature_extract(imdist, 3);
    score = SSQA_by_f(feature);
    endTime = datetime("now");
    time = endTime - startTime;
end