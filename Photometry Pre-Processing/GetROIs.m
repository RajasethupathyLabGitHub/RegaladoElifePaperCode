% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

clear all
clear all


imagefiles = dir('*.tiff');
%sortedimagefiles=
sortedimagefiles=natsortfiles({imagefiles.name});

%imagefiles = dir('*.tiff');      
% D = 'C:\Test'; 
% S = dir(fullfile(D,'*.txt')); 
% N = natsortfiles({S.name}); 
% for k = 1:numel(N) 
% fullfile(D,N{k}) 
% end
nfiles = length(sortedimagefiles);    % Number of files found

numberofregions=5;

for region=1:numberofregions
    currentfilename = imagefiles(1).name;
    currentimage = imread(currentfilename);
    currentimageadj= imadjust(currentimage);
%    imshow(imadjust(currentimage))
    selectROIs{region}=roipoly(currentimageadj);
end

for ii=1:nfiles
    ii
        currentfilename = sortedimagefiles(ii);
        currentimage = imread(char(currentfilename));
    for region=1:length(selectROIs)
         ROI(ii,1)=ii;
         ROI(ii,region+1)= mean(currentimage(selectROIs{region}));
    end
end