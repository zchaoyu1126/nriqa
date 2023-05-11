function [coef1, coef2, rmse, mae] = evaluate(filename, x, y)
    beta0 = [max(y), 10, mean(x), 0.1, 0.1]';%待定系数的预估值
    [bayta, ehat, J] = nlinfit(x, y, @logistic, beta0);
    figure;
    set(gcf,'InvertHardCopy','off','color','white');
    hold all, plot(x, y,'.');
    xlabel('metric');
    ylabel('mos');
    
    [ypre, junk] = nlpredci(@logistic,x,bayta,ehat,J);
    a = min(x):0.01:max(x);
    b = nlpredci(@logistic,a,bayta,ehat,J);
    hold on;
    p = plot(a,b);

    [coef1, pval] = corr(ypre,y,'type','Pearson');
    [coef2, pval] = corr(x,y,'type','Spearman');
    if coef2 < 0 
        coef2 = -coef2;
    end
    rmse = sqrt(mean((y-ypre).^2));
    mae=mean(abs(y-ypre));
    %title(sprintf('Pearson = %g Spearman = %g rmse =%g mae =%g' , coef1, coef2, rmse, mae));
    saveas(gcf, filename);
end


