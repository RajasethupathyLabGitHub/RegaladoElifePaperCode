%find correlations between running length and OFC/AM activity

clear all
clear all
close all
close all


all_files2 = dir
all_dir2 = all_files2([all_files2(:).isdir])
num_dir2 = numel(all_dir2);

newmouse2=0;
for foldernum2=3:num_dir2
    foldername2=all_dir2(foldernum2).name;
    
 if ~contains(foldername2,'Runners') && ~contains(foldername2,'Stoppers') && ~contains(foldername2,'Passive')
    
    newmouse2=newmouse2+1
    load([pwd,'/',foldername2,'/trialstructure.mat']);
    
    
if newmouse2==1
    newtrialstructure=trialstructure(2:end-1);
end
if newmouse2>1
    newtrialstructure=[newtrialstructure trialstructure(2:end-1)];
    
end
end
end

trialstructure=newtrialstructure;

close all
filename= ['trialstructure']
save(filename)

% stop

run('PhotometryStructurePlotControl.m')

% hello