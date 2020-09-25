function path=sLor_generateBandlist(Band,destpath,fileName)
% Bandlist = importBandlist('Band.txt');
num_band = size(Band,1);
Bandlist = table;
Bandlist(1,1) = {num_band};
Bandlist(1,2) = {string(missing)};
for i_band = 1 : num_band
    Bandlist(i_band+1,1) = {Band(i_band,1)};
    Bandlist(i_band+1,2) = {Band(i_band,2)};
end
if nargin < 3
    fileName='Bandlist.txt';
else
    fileName=['Bandlist_',fileName,'.txt'];
end
path    =fullfile(destpath,fileName);
writetable(Bandlist,path,'Delimiter',' ','WriteVariableNames',false);
end


function Band = importBandlist(filename, dataLines)
if nargin < 2
    dataLines = [1, Inf];
end
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = dataLines;
opts.Delimiter = " ";
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["string", "string"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
opts = setvaropts(opts, ["VarName1", "VarName2"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["VarName1", "VarName2"], "EmptyFieldRule", "auto");
Band = readtable(filename, opts);
end