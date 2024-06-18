%%%input stuff to extract signals, align to behavior, and make
%%%neuronstructure

clear all
clear all
close all
close all

ndata=0;
tdata=0;
zdata=1;

%%%%These are the files for behavior
mousemat={'m6_H13_9_3_2021_T144741.mat'};
mousenidaq={'m6_H13_9_3_2021_T144741.bin'};

%%%%These is the file that are the output of the Bruker 2p imaging
%%%%These are not in the Zenodo folder, but contact Josue if you'd like them
sessionxml='TSeries-09032021-m6-h13-3-011.xml';
sessionv='TSeries-09032021-m6-h13-3-011_Cycle00001_VoltageRecording_001.csv';

%%%%%this removes neurons that are in the same plane 
run('DetectOverlaps.m')

%%%%%this zscores, normalizes, or removes "noise" to find transients based
%%%%%on what you put above for ndata, tdata, or zdata
run('ProcessNeurons.m')

%%%%%this processes the behavior files to get it ready to align to imaging
run('AddLicksToVirmen2p')

%%%%%This adjusts the times for imaging to align to behavior accurately
run('alignData_Josue.m')

%%%%%This now connects imaging data to behavior
run('ImagingAlign')

%%%%%This puts it into a trialstructure format
run('trialstructure.m')

%%%%%This generates heatmaps for a variety of context conditions
%%%%%Also it determines when neurons are tuned. See variable "NNRneurontuning"
run('HeatmapsNew.m')

%%%%%This finds neurons that are best tuned to each other
run('BestFit.m')

%%%%%This generates plots for individual neurons based on a variety of context conditions
run('ContextNeurons.m')