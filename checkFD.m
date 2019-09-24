%% Setup
%7/1/19
%This will assess the Framewide Displacement of all TOP rsBOLD Data

close all
clear all
clc

cd /project/psychimg3/Reagan/Top/BOLD_REST/Scan1/DPARSF/RealignParameter
direc = '/project/psychimg3/Reagan/Top/BOLD_REST/Scan1/DPARSF/RealignParameter';

% cd /project/psychimg3/Reagan/Top/BOLD_REST/Scan2/DPARSF/RealignParameter
% direc = '/project/psychimg3/Reagan/Top/BOLD_REST/Scan2/DPARSF/RealignParameter';

%% Checking Framewide Displacement


% FD by Power or Jenkinson
filt = 'FD_Power.*txt';

% file name to write
fid = fopen('QC_TOP_FD_Power.txt','wb');

%Get all the FD text files
[files,dirs] = spm_select('FPListRec',direc, filt);

for  i =1:size(files)

    fd = load(deblank(files(i,:)));
    mean_fd = mean(fd);
    if mean(fd) > 0.3
        fprintf(fid,'%s\n',deblank(files(i,:)));

    end
end
