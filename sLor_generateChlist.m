function path=sLor_generateChlist(ch_rep,destpath)
chListEGI = importChlist('chList_EGI.txt');
chListEGI = chListEGI([1;ch_rep+1],:);
chListEGI(1,1) = {numel(ch_rep)};
fileName='chList_EGI_rep.txt';
path    =fullfile(destpath,fileName);
writetable(chListEGI,path,'Delimiter',' ','WriteVariableNames',false);
end

function chListEGI = importChlist(filename, dataLines)
if nargin < 2
    dataLines = [1, Inf];
end
opts = delimitedTextImportOptions("NumVariables", 4);
opts.DataLines = dataLines;
opts.Delimiter = " ";
opts.VariableNames = ["X", "Y", "Z", "chName"];
opts.VariableTypes = ["string", "string", "string", "string"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
opts = setvaropts(opts, "chName", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "chName", "EmptyFieldRule", "auto");
chListEGI = readtable(filename, opts);
end