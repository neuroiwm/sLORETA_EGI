function path = sLor_generateEEGtxt(EEG_fil,path_dest,name)
%% function path = generateEEGtxt(EEG_fil[time ch trial],path_dest,name)
[time_trl,num_ch,num_trl] = size(EEG_fil);
if nargin < 3
    path = fullfile(path_dest,['sLORETA_rawEEG',datenow]);
else
    path = fullfile(path_dest,name);
end
mkdir(path);
fprintf('\nWriting EEG...');
for i_trl = 1 : num_trl
    tmp = EEG_fil(:,:,i_trl);
    path_eeg = fullfile(path,['EEG',sprintf('%02d',i_trl),'.txt']);
    dlmwrite(path_eeg,tmp,'delimiter',' ','precision',3,'newline','pc');
    if mod(i_trl,10) == 0
        fprintf('%d->',i_trl);
    end
end
fprintf('\nFinished');
end