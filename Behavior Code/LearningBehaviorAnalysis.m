%analysis for measuring average lick rate across trial types flexible for
%Code from Josue and edited by Rhia and Ari
%JN 10.10.2017

clear all
clear all
close all
close all

    
    Files=dir('*.*')
    newmouse=0;
    mousemat={};
    mousenidaq={};
    for k=1:length(Files)

        if contains(Files(k).name,'.bin')
            newmouse=newmouse+1
            if newmouse==1
                mousemat=cellstr(Files(k+1).name);
                mousenidaq=cellstr(Files(k).name);
            end
            if newmouse>1
                mousemat=[mousemat; cellstr(Files(k+1).name)]
                mousenidaq=[mousenidaq; cellstr(Files(k).name)]
            end
        end
    end

%is it habituation or training? Put training=1 for preexposure too.
habituation=1;
trainingday=0;
%is it passive?
passiveday=0;

%do you only want to analyze behavior and save the plots you generate?
runbehavior=1;
saveplotting=1;

%do you only want to analyze photometry and save the plots you generate?
runphotometry=0;
plotting=1;


run('AddLicksToVirmenControl')