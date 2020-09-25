function [cell_raw,tbl_impedance]=loadEEG_raw(flag_int)
p031_setPara;
switch flag_int
case 1
    %% from raw
origin=vbmbmi(1);
subD = dir('sub*');
num_sub = numel(subD);
cell_raw = cell(num_sub,num_sess);
tbl_impedance=zeros(num_ch,num_sess,num_sub); 
for i_sub = 1 : num_sub
    old = vbmbmi(1);
    name = subD(i_sub).name;
    [tbl_EEG,tbl_impedance(:,:,i_sub),~]=sub_loadEEG(name);
    for i_sess = 1 : num_sess
        tmp = tbl_EEG{i_sess,1};
        tmp = tmp(1+(time_pre-1)*Fs:end,:);
        tmp = tmp(1:Fs/fs_ds:end,:);
        data_fil = filtEEG(tmp,fs_ds,flag_spa);
        cell_raw{i_sub,i_sess} = data_fil;
    end
    cd(old);
end
cd(origin)
case 2
    %% from int
origin = cd(path_int);
subD = dir('sub*');
num_sub = numel(subD);
cell_raw = cell(num_sub,num_sess);
tbl_impedance=zeros(num_ch,num_sess,num_sub);
for i_sub = 1 : num_sub
    old = cd(subD(i_sub).name);
    runD = dir('run*');
    for i_sess = 1 : numel(runD)
        load(runD(i_sess).name);
        cell_raw{i_sub,i_sess} = Sig;
        tbl_impedance(:,i_sess,i_sub) = imp;
    end
    cd(old);
end
cd(origin)
end
