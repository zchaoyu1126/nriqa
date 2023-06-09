function qualityscore  = brisquescore(imdist)

if(size(imdist,3)==3)
    imdist = uint8(imdist);
    imdist = rgb2gray(imdist);
end

imdist = double(imdist);

if(nargin<2)
feat = brisque_feature(imdist);
disp('feat computed')
end


%---------------------------------------------------------------------
%Quality Score Computation
%---------------------------------------------------------------------


fid = fopen('test_ind', "w");
for jj = 1:size(feat,1)
    fprintf(fid, '1 ');
    for kk = 1:size(feat,2)
        fprintf(fid,'%d:%f ',kk,feat(jj,kk));
    end
    fprintf(fid, '\n');
end
fclose(fid);

warning off all
delete output test_ind_scaled dump
disp(pwd());

system('.\methods\BRISQUE\svm-scale -r .\methods\BRISQUE\allrange test_ind >> test_ind_scaled');
system('.\methods\BRISQUE\svm-predict -b 1 test_ind_scaled .\methods\BRISQUE\allmodel output >> dump');

qualityscore = load('output');
delete output test_ind test_ind_scaled dump
end