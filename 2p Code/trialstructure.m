%%%For each neuron, get their signal for every cue and reward and
%%%engagement after reward
close all
clear all

%%%describe the columns in imagingbehavior
experimenttimecolumn=1;
trialtimecolumn=2;
distancey=3;
distancex=4;
speedcolumn=5;
cuecolumn=6;
trialtypecolumn=13;
trialcolumn=14;
lickratecolumn=19;
newcue1all=0;
newcue2all=0;
newwater1all=0;
newwater2all=0;

load 'imagingbehavior.mat'

ncount=0;
% ncount=0;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%start data structure%%%
%%%%%%%%%%%%%%%%%%%%%%%%%


currentdirectory = pwd;
%%%get mousename

if contains(currentdirectory,'m1')
    mousename='m1';
elseif contains(currentdirectory,'m2')
    mousename='m2';
elseif contains(currentdirectory,'m5')
    mousename='m5';
elseif contains(currentdirectory,'m6')
    mousename='m6';
elseif contains(currentdirectory,'m7')
    mousename='m7';
end

%get session name
if contains(currentdirectory,'Pre1')
    session='Pre1';
elseif contains(currentdirectory,'Pre2')
    session='Pre2';
elseif contains(currentdirectory,'T1')
    session='T1';
elseif contains(currentdirectory,'T2')
    session='T2';
elseif contains(currentdirectory,'T3')
    session='T3';
elseif contains(currentdirectory,'T4')
    session='T4';
elseif contains(currentdirectory,'T5')
    session='T5';
elseif contains(currentdirectory,'T6')
    session='T6';
elseif contains(currentdirectory,'T7')
    session='T7';
elseif contains(currentdirectory,'T8')
    session='T8';
elseif contains(currentdirectory,'Habituation')
    session='Hab';
    imagingbehavior(:,13)=1;
end


%make a column for trial initiations


% Threshold value
threshold = 1;

% Initialize variables
signal=imagingbehavior(:,17);
above_threshold = false;
above_threshold_start_time = 0;
time_above_threshold = 0;
first_time_above_threshold = zeros(size(signal));
below_threshold = zeros(size(signal));

% Loop through the signal to find when it goes above the threshold for more than 1 second
for i = 1:length(signal)-4
    if signal(i) < threshold
        above_threshold = false;
        time_above_threshold = 0;
    elseif signal(i) >= threshold && all(signal(i:i+3) > threshold)
        if ~above_threshold
            % Check if the signal was below the threshold for the previous 1 second
            if i > 11 % Ensure that we have at least 1 second of data before the current point
                if all(signal(i-5:i-1) < threshold)
%                     hello
                    above_threshold = true;
                    above_threshold_start_time = imagingbehavior(i,1);
                    first_time_above_threshold(i) = 1;
                end
            end
        end
        if above_threshold
            time_above_threshold = imagingbehavior(i,1) - above_threshold_start_time;
        end
    end
    
    if i>4
        if signal(i-4:i)<threshold
            below_threshold(i)=1;
        end
    end
end
% hello
figure
plot(imagingbehavior(:,17)); hold on; plot(first_time_above_threshold*10)


neuroncolumn=numel(imagingbehavior(1,:))-numel(Fnew(:,1));
neuronnum=numel(Fnew(:,1));

for nn=1:neuronnum  
    ncount=ncount+1;
    
    %fill out the neuronnumber, mouse, and session
    neuronstructure(ncount).neuron=ncount;
    neuronstructure(ncount).mouse=mousename;
    neuronstructure(ncount).session=session;
    
    %grab all of the contextentries
    contextentries=find(diff(imagingbehavior(:,cuecolumn))==1);
    contextexits=find(diff(imagingbehavior(:,cuecolumn))==-1);
    
    startcon=10;
    finishcon=35;
    startpre=30;
    finishpre=30;
    startengage=30;
    finishengage=30;
    
    contextentries=contextentries(contextentries+finishcon<numel(imagingbehavior(:,1)));
%     contextexits=contextexits(contextentries+finish<numel(imagingbehavior(:,1)));
    
    if contextexits(1)<contextentries(1)
    contextexits=contextexits(2:end);
    end
    
    if numel(contextentries)>numel(contextexits)
        contextentries=contextentries(1:end-1);
    end
    
        
        if contextentries(1)<startpre
            contextentries=contextentries(2:end);
            contextexits=contextexits(2:end);
        end
        
        if contextentries(1)<startpre
            contextentries=contextentries(2:end);
            contextexits=contextexits(2:end);
        end
    
    
    for cnum=1:numel(contextentries)-1
        
        if contextentries(cnum)>startcon
        neuronstructure(ncount).context(cnum,1)=imagingbehavior(contextentries(cnum),trialtypecolumn);
        
        if contextexits(cnum)-contextentries(cnum)>14
        neuronstructure(ncount).context(cnum,2)=1;
        else
        neuronstructure(ncount).context(cnum,2)=0;
        end
        
        if any(below_threshold(contextentries(cnum):contextentries(cnum+1)),1)
            
        neuronstructure(ncount).context(cnum,2)=1;
        else
        neuronstructure(ncount).context(cnum,2)=0;
        
        end
        
        
        if contextexits(cnum)<contextentries(cnum)
            hello
        end
        
        neuronstructure(ncount).contextspeed(cnum,1:startcon+finishcon+1)=imagingbehavior(contextentries(cnum)-startcon:contextentries(cnum)+finishcon,17);
%         hello
%         neuronstructure(ncount).contextneuron.zscore(cnum,1:start+finish+1)=zdff(nn,contextentries(cnum)-start:contextentries(cnum)+finish);
%         neuronstructure(ncount).contextneuron.transient(cnum,1:start+finish+1)=noisedff(nn,contextentries(cnum)-start:contextentries(cnum)+finish);
        neuronstructure(ncount).contextneuron.zscore(cnum,1:startcon+finishcon+1)=imagingbehavior(contextentries(cnum)-startcon:contextentries(cnum)+finishcon,neuroncolumn+nn);
        
        neuronstructure(ncount).prespeed(cnum,1:startpre+finishpre+1)=imagingbehavior(contextentries(cnum)-startpre:contextentries(cnum)+finishpre,17);
%         hello
%         neuronstructure(ncount).contextneuron.zscore(cnum,1:start+finish+1)=zdff(nn,contextentries(cnum)-start:contextentries(cnum)+finish);
%         neuronstructure(ncount).contextneuron.transient(cnum,1:start+finish+1)=noisedff(nn,contextentries(cnum)-start:contextentries(cnum)+finish);
        neuronstructure(ncount).preneuron.zscore(cnum,1:startpre+finishpre+1)=imagingbehavior(contextentries(cnum)-startpre:contextentries(cnum)+finishpre,neuroncolumn+nn);
        
        
        
        
        

        end
        
        
        
        
        
        %%%write code to extract out engagements
        engagements=find(first_time_above_threshold==1);
        engagementsroomsold=imagingbehavior(engagements,14);
        
        
        if engagements(1)<=startengage 
            engagements=engagements(2:end);
        end
        
        if engagements(2)<=startengage
            engagements=engagements(2:end);
        end
        
        
                roomstart=find(diff(imagingbehavior(1:engagements(1),6))==1,1,'last');
        if roomstart<=startengage
            engagements=engagements(2:end);
        end
        
                trialnumber=imagingbehavior(engagements(1),14);
                if trialnumber<3
                engagements=engagements(2:end);
                end
                
                
        for i=1:numel(engagements)
            if imagingbehavior(engagements(i),6)==0
                roomnumcheck(i)=imagingbehavior(find(diff(imagingbehavior(1:engagements(i),6))==1,1,'last'),14);
            else
                roomnumcheck(i)=imagingbehavior(engagements(i),14);
            end
        end
        
        
        engagements=engagements(diff(roomnumcheck)~=0);
        
        
        for enum=1:numel(engagements)
            
            if engagements(enum)+finishengage<numel(imagingbehavior(:,1))
                
                
            %if mouse is in ITI then grab the last trial type
            if imagingbehavior(engagements(enum),6)==0
                trialnumber=imagingbehavior(engagements(enum),14);
                roomstart=find(diff(imagingbehavior(1:engagements(enum),6))==1,1,'last');
                currentroomstartnum=find(diff(imagingbehavior(1:engagements(enum),14))==1,1,'last');
                neuronstructure(ncount).engagecontext(enum,1)=imagingbehavior(find(imagingbehavior(:,14)==trialnumber-1,1,'last'),trialtypecolumn);
                neuronstructure(ncount).engagecontext(enum,2)=imagingbehavior(find(imagingbehavior(:,14)==trialnumber-2,1,'last'),trialtypecolumn);
                

                %else just grab the current trial type
            else
                trialnumber=imagingbehavior(engagements(enum),14);
                roomstart=find(diff(imagingbehavior(1:engagements(enum),6))==1,1,'last');
                currentroomstartnum=find(diff(imagingbehavior(1:engagements(enum),6))==1,1,'last');
                neuronstructure(ncount).engagecontext(enum,1)=imagingbehavior(engagements(enum),trialtypecolumn);
                neuronstructure(ncount).engagecontext(enum,2)=imagingbehavior(find(imagingbehavior(:,14)==trialnumber-1,1,'last'),trialtypecolumn);
                
                
            end
            
        
            neuronstructure(ncount).engagespeed(enum,1:startengage+finishengage+1)=imagingbehavior(engagements(enum)-startengage:engagements(enum)+finishengage,17);
            neuronstructure(ncount).engageneuron.zscore(enum,1:startengage+finishengage+1)=imagingbehavior(engagements(enum)-startengage:engagements(enum)+finishengage,neuroncolumn+nn);
        
            neuronstructure(ncount).engagespeedcon(enum,1:startengage+finishengage+1)=imagingbehavior(roomstart-finishengage:roomstart+finishengage,17);
            neuronstructure(ncount).engageneuroncon.zscore(enum,1:startengage+finishengage+1)=imagingbehavior(roomstart-finishengage:roomstart+finishengage,neuroncolumn+nn);
                end
                
            end
        end
    end
        
        
        
    
%  grab all of the outcome entries
%     outcomeentries=find(diff(imagingbehavior(:,9))==1 | diff(imagingbehavior(:,10))==1);
%     
%     start=40;
%     finish=40;
%     
%     outcomeentries=outcomeentries(outcomeentries+finish<numel(imagingbehavior(:,1)));
%     
%     for cnum=2:numel(outcomeentries)
%         neuronstructure(ncount).outcome(cnum,1)=imagingbehavior(outcomeentries(cnum),trialtypecolumn);
%         neuronstructure(ncount).outcomespeed(cnum,1:start+finish+1)=imagingbehavior(outcomeentries(cnum)-start:outcomeentries(cnum)+finish,17);
%         neuronstructure(ncount).outcomeneuron(cnum,1:start+finish+1)=imagingbehavior(outcomeentries(cnum)-start:outcomeentries(cnum)+finish,neuroncolumn+nn);
%     end

timerangecon=imagingbehavior(contextentries(5)-startcon:contextentries(5)+finishcon,1)-imagingbehavior(contextentries(5),1);
timerangepre=imagingbehavior(contextentries(5)-startpre:contextentries(5)+finishpre,1)-imagingbehavior(contextentries(5),1);
timerangeengage=imagingbehavior(engagements(5)-startengage:engagements(5)+finishengage,1)-imagingbehavior(engagements(5),1);


clearvars -except neuronstructure ncount timerangecon startcon timerangepre startpre timerangeengage startengage

filename= 'neuronstructure.mat'
save(filename)
