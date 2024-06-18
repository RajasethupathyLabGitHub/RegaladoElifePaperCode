%make a script to plot context tunings for all, after rew, after fail


clear all
close all

load neuronstructure.mat

%1 is for all context, 2 is  only stop, 3 is only run
c1allstoprun=1;
c2allstoprun=1;

neuroncontexts=0;
neuronpre=0;
instructcomplex=0;
instructsimple=0;
cuechange=0;
roomcombinations=0;
neuronfuture=0;
neuronfuturesimple=0;
actioninstruct=0;
afterewfail=0;
plotstructure=0;
plotstructurerffr=1;
plotengagements=0;

ploteachneuron=1;
plotneurontogether=0;


timerangecon=timerangecon;
    limitxcon=[round(timerangecon(1)) round(timerangecon(end))];
timerangepre=timerangepre;
    limitxpre=[round(timerangepre(1)) round(timerangepre(end))];

timerangeengage=timerangeengage;
    limitxengage=[round(timerangeengage(1)) round(timerangeengage(end))];
    
    xaxiscon=linspace(round(timerangecon(1)), round(timerangecon(end)), numel(neuronstructure(1).contextneuron.zscore(1,:)));
    xaxispre=linspace(round(timerangepre(1)), round(timerangepre(end)), numel(neuronstructure(1).preneuron.zscore(1,:)));
    xaxisengage=linspace(round(timerangeengage(1)), round(timerangeengage(end)), numel(neuronstructure(1).engageneuron.zscore(1,:)));

    limityneuron=[-1 2];
    limityheat=[-1 1];
coloraxis=[0 3];

% neuronstructure, context, all/stop/run
% function plotneurons(neuronstructure,conout,allstoprun)

mkdir neuroncontexts
mkdir neuronpre
mkdir neuronfailext
mkdir neuronrewardafter
mkdir neuronfailafter
mkdir neuronafter
mkdir neuroninstruct
mkdir neuroninstructsimple
mkdir neuronchangecues
mkdir neuroncombo
mkdir neuronfuture
mkdir neuronactioninstruct
mkdir neuronfuturesimple
mkdir neuronrffr
mkdir neuronengage
mkdir neuronrffronly

for neuron=1:numel(neuronstructure(:))
rew1=0;
rewrew1=0;
fail1=0;
    outcome=0;
    rew1behav=[];
rew1neuroncon=[];
rew1split=[];
rew1behavsplit=[];
fail1behavsplit=[];
rewfuturesplit=[];
failfuturesplit=[];
rew1combosplit=[];
fail1combosplit=[];
neuronactionsplit=[];
rewrew1neuron=[];
    fail1behav=[];
fail1neuroncon=[];
allneuroncon=[];
allneuronengage=[];
allspeedengage=[];
engagesplit=[];
fail1split=[];
rr=0;
rfr=0;
rffr=0;
afterrew1=0;
afterfail1=0;
all1=0;
engagecount=0;
                rew1combosplit=0;
                rrsignals=[];
                rrspeed=[];
                rffrsignals=[];
                rffrspeed=[];
                rfrsignals=[];
                rfrspeed=[];
                neuronaftersplit=[];
                
                for engage=1:numel(neuronstructure(neuron).engagecontext(:,1))
                    
            engagecount=engagecount+1;
            allneuronengage(engagecount,:)=neuronstructure(neuron).engageneuron.zscore(engage,:);
            allspeedengage(engagecount,:)=neuronstructure(neuron).engagespeed(engage,:);
            allneuronengagecon(engagecount,:)=neuronstructure(neuron).engageneuroncon.zscore(engage,:);
            allspeedengagecon(engagecount,:)=neuronstructure(neuron).engagespeedcon(engage,:);
            
                if neuronstructure(neuron).engagecontext(engage,1)==1 && neuronstructure(neuron).engagecontext(engage,2)==1
                engagesplit(engagecount,1)=1;
                end
                
                if neuronstructure(neuron).engagecontext(engage,1)==2 && neuronstructure(neuron).engagecontext(engage,2)==1
                engagesplit(engagecount,1)=2;
                end
                
                end
    
    for context=1:numel(neuronstructure(neuron).context(:,1))
        
        
        
        
        
            all1=all1+1;
            allneuroncon(all1,:)=neuronstructure(neuron).contextneuron.zscore(context,:);
            allneuronpre(all1,:)=neuronstructure(neuron).preneuron.zscore(context,:);
            allspeedcon(all1,:)=neuronstructure(neuron).contextspeed(context,:);
            allspeedpre(all1,:)=neuronstructure(neuron).prespeed(context,:);
            neuronactionsplit(all1,1)=0;
            neuronaftersplit(all1,1)=0;
            neuronstructuresplit1(all1,1)=0;
            neuronstructuresplit2(all1,1)=0;
            
            
        %plot all rooms after a reward or nothing
        
        if context>2
            if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                if neuronstructure(neuron).context(context-2,1)==1 && neuronstructure(neuron).context(context-2,2)==1
                neuronaftersplit(all1,1)=1;
                elseif neuronstructure(neuron).context(context-2,1)==2 %&& neuronstructure(neuron).context(context-2,2)==1 %&& neuronstructure(neuron).context(context-2)==1
                neuronaftersplit(all1,1)=2;
%                 elseif neuronstructure(neuron).context(context-2,1)==2 && neuronstructure(neuron).context(context-2,2)==0 %&& neuronstructure(neuron).context(context-2)==2
%                 neuronaftersplit(all1,1)=3;
                end
            end
            
            if neuronstructure(neuron).context(context-1,1)==2 
                if neuronstructure(neuron).context(context-2,1)==1 && neuronstructure(neuron).context(context-2,2)==1
                neuronaftersplit(all1,1)=4;
                elseif neuronstructure(neuron).context(context-2,1)==2
                neuronaftersplit(all1,1)=5;
                end
            end
                    
        end
        
            
            %lets find the room structures
            
            %if R,F,F,R
            if context<numel(neuronstructure(neuron).context(:,1))-3
            if neuronstructure(neuron).context(context,1)==1 ...
                    && neuronstructure(neuron).context(context+1,1)==2 ...
                    && neuronstructure(neuron).context(context+2,1)==2 ...
                    && neuronstructure(neuron).context(context+3,1)==1 ...
                    && any(neuronstructure(neuron).context(context:context+3,2)==1)
                
                rffr=rffr+1;
                rffrsignals(rffr,:,1)=neuronstructure(neuron).preneuron.zscore(context,:);
                rffrsignals(rffr,:,2)=neuronstructure(neuron).preneuron.zscore(context+1,:);
                rffrsignals(rffr,:,3)=neuronstructure(neuron).preneuron.zscore(context+2,:);
                rffrsignals(rffr,:,4)=neuronstructure(neuron).preneuron.zscore(context+3,:);
                rffrspeed(rffr,:,1)=neuronstructure(neuron).prespeed(context,:);
                rffrspeed(rffr,:,2)=neuronstructure(neuron).prespeed(context+1,:);
                rffrspeed(rffr,:,3)=neuronstructure(neuron).prespeed(context+2,:);
                rffrspeed(rffr,:,4)=neuronstructure(neuron).prespeed(context+3,:);
                
            end
            end
            
            %if R,F,R
            
            if context<numel(neuronstructure(neuron).context(:,1))-2
            if neuronstructure(neuron).context(context,1)==1 ...  % && neuronstructure(neuron).context(context,2)==1 
                    && neuronstructure(neuron).context(context+1,1)==2 ...
                    && neuronstructure(neuron).context(context+2,1)==1 ...
                    && any(neuronstructure(neuron).context(context:context+2,2)==1)
                
                rfr=rfr+1;
                rfrsignals(rfr,:,1)=neuronstructure(neuron).preneuron.zscore(context,:);
                rfrsignals(rfr,:,2)=neuronstructure(neuron).preneuron.zscore(context+1,:);
                rfrsignals(rfr,:,3)=neuronstructure(neuron).preneuron.zscore(context+2,:);
                rfrspeed(rfr,:,1)=neuronstructure(neuron).prespeed(context,:);
                rfrspeed(rfr,:,2)=neuronstructure(neuron).prespeed(context+1,:);
                rfrspeed(rfr,:,3)=neuronstructure(neuron).prespeed(context+2,:);
            end
            end
            
            if context<numel(neuronstructure(neuron).context(:,1))-1
            if neuronstructure(neuron).context(context,1)==1 ... % && neuronstructure(neuron).context(context,2)==1 
                    && neuronstructure(neuron).context(context+1,1)==1 ...
                    && any(neuronstructure(neuron).context(context:context+1,2)==1)
                
                rr=rr+1;
                rrsignals(rr,:,1)=neuronstructure(neuron).preneuron.zscore(context,:);
                rrsignals(rr,:,2)=neuronstructure(neuron).preneuron.zscore(context+1,:);
                rrspeed(rr,:,1)=neuronstructure(neuron).prespeed(context,:);
                rrspeed(rr,:,2)=neuronstructure(neuron).prespeed(context+1,:);
            end
            end
            
            
            
            
            if context>1
                %if current context is stop
                if neuronstructure(neuron).context(context,2)==1
                %if prev context was a reward stop, reward run, fail stop,
                %or fail run
                if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    neuronactionsplit(all1,1)=1;
                elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    neuronactionsplit(all1,1)=2;
                elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    neuronactionsplit(all1,1)=3;
                elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    neuronactionsplit(all1,1)=4;
                end
                
                %if current context is run
                elseif neuronstructure(neuron).context(context,2)==0
                %if prev context was a reward stop, reward run, fail stop,
                %or fail run
                if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    neuronactionsplit(all1,1)=5;
                elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    neuronactionsplit(all1,1)=6;
                elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    neuronactionsplit(all1,1)=7;
                elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    neuronactionsplit(all1,1)=8;
                end
                
                end
            end
            
            
        %all reward contexts (and label if stop or no)
        if neuronstructure(neuron).context(context,1)==1 
            
            rew1=rew1+1;
            rew1behav(rew1,1)=neuronstructure(neuron).context(context,2);
            rew1neuroncon(rew1,:)=neuronstructure(neuron).contextneuron.zscore(context,:);
            rew1neuronpre(rew1,:)=neuronstructure(neuron).preneuron.zscore(context,:);
            rew1split(rew1,1)=0;
            %rewards after rewards (1)
            if context>=3 && neuronstructure(neuron).context(context-1,1)==1 %&& neuronstructure(neuron).context(context-1,2)==1
            rew1split(rew1,1)=1;
            %rewards after 1 fail (2)
            elseif context>=3 && neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-2,1)==1
            rew1split(rew1,1)=2;
            %rewards after 2 fail (3)
            elseif context>=3 && neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-2,1)==2
            rew1split(rew1,1)=3;
            end
            
            rew1behavsplit(rew1,1)=0;
            if context>=2 
                % if current reward stop
                if neuronstructure(neuron).context(context,2)==1
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    rew1behavsplit(rew1,1)=1;
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    rew1behavsplit(rew1,1)=2;
                    end
                    
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    rew1behavsplit(rew1,1)=3;
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    rew1behavsplit(rew1,1)=4;
                    end
                    
                % if current reward run
                elseif neuronstructure(neuron).context(context,2)==0
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    rew1behavsplit(rew1,1)=5;
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    rew1behavsplit(rew1,1)=6;
                    end
                    
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    rew1behavsplit(rew1,1)=7;
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    rew1behavsplit(rew1,1)=8;
                    end
                end
                
                % find different combinations
                if context>2
                    % F-F-R
                    if neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-2,1)==2 ...
                            && neuronstructure(neuron).context(context,2)==1
                        rew1combosplit(rew1,1)=1;
                        %F-R-R
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-2,1)==2 ...
                            && any(neuronstructure(neuron).context(context-1:context,2)==1)
                        rew1combosplit(rew1,1)=2;
                        %R-F-R
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-2,1)==1 
                        if neuronstructure(neuron).context(context,2)==1 || neuronstructure(neuron).context(context-2,2)==1
                        rew1combosplit(rew1,1)=3;
                        end
                    end
                end
                
                
                
                       
                    
            end
            
            rewfuturesplit(rew1,1)=0;
            if context<numel(neuronstructure(neuron).context(:,1))-1
                % if current reward stop
                if neuronstructure(neuron).context(context,2)==1
                    %if future a reward stop or run
                    if neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==1
                    rewfuturesplit(rew1,1)=1;
                    elseif neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==0
                    rewfuturesplit(rew1,1)=2;
                    end
                    
                    %if future a fail stop or run
                    if neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==1
                    rewfuturesplit(rew1,1)=3;
                    elseif neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==0
                    rewfuturesplit(rew1,1)=4;
                    end
                    
                % if current reward run
                elseif neuronstructure(neuron).context(context,2)==0
                    %if future a reward stop or run
                    if neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==1
                    rewfuturesplit(rew1,1)=5;
                    elseif neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==0
                    rewfuturesplit(rew1,1)=6;
                    end
                    
                    %if future a fail stop or run
                    if neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==1
                    rewfuturesplit(rew1,1)=7;
                    elseif neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==0
                    rewfuturesplit(rew1,1)=8;
                    end
                end
            end
            
           %all fail context 
        elseif neuronstructure(neuron).context(context,1)==2
            
            fail1=fail1+1;
            fail1neuroncon(fail1,:)=neuronstructure(neuron).contextneuron.zscore(context,:);
            fail1neuronpre(fail1,:)=neuronstructure(neuron).preneuron.zscore(context,:);
            fail1behav(fail1,1)=neuronstructure(neuron).context(context,2);
            fail1split(fail1,1)=0;
            %fails after 1 fail
            if context>=3 && neuronstructure(neuron).context(context-1,1)==2 %&& neuronstructure(neuron).context(context-1,2)==1
            fail1split(fail1,1)=1;
            %fails after 1 reward
            elseif context>=3 && neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-2,1)==2
            fail1split(fail1,1)=2;
            %fails after 2 reward
            elseif context>=3 && neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-2,1)==1
            fail1split(fail1,1)=3;
            end
            
            
            fail1behavsplit(fail1,1)=0;
            if context>=2 
                % if current fail stop
                if neuronstructure(neuron).context(context,2)==1
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    fail1behavsplit(fail1,1)=1;
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    fail1behavsplit(fail1,1)=2;
                    end
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    fail1behavsplit(fail1,1)=3;
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    fail1behavsplit(fail1,1)=4;
                    end
                % if current fail run
                elseif neuronstructure(neuron).context(context,2)==0
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==1
                    fail1behavsplit(fail1,1)=5;
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-1,2)==0
                    fail1behavsplit(fail1,1)=6;
                    end
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    fail1behavsplit(fail1,1)=7;
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    fail1behavsplit(fail1,1)=8;
                    end
                end
                
                 % find different combinations
                if context>2
                    % R-R-F
                    if neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-2,1)==1 ...
                            && any(neuronstructure(neuron).context(context-2:context-1,2)==1)
                        fail1combosplit(fail1,1)=1;
                        %F-R-F
                    elseif neuronstructure(neuron).context(context-1,1)==1 && neuronstructure(neuron).context(context-2,1)==2 ...
                            && neuronstructure(neuron).context(context-1,2)==1
                        fail1combosplit(fail1,1)=2;
                        %R-F-F
                    elseif neuronstructure(neuron).context(context-1,1)==2 && neuronstructure(neuron).context(context-2,1)==1 ...
                            && neuronstructure(neuron).context(context-2,2)==1
                        fail1combosplit(fail1,1)=3;
                    end
                end
            end
            
            
            failfuturesplit(fail1,1)=0;
            
            if context<numel(neuronstructure(neuron).context(:,1))-1
                % if current fail stop
                if neuronstructure(neuron).context(context,2)==1
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==1
                    failfuturesplit(fail1,1)=1;
                    elseif neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==0
                    failfuturesplit(fail1,1)=2;
                    end
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==1
                    failfuturesplit(fail1,1)=3;
                    elseif neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+1,2)==0
                    failfuturesplit(fail1,1)=4;
                    end
                % if current fail run
                elseif neuronstructure(neuron).context(context,2)==0
                    %if prev a reward stop or run
                    if neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==1
                    failfuturesplit(fail1,1)=5;
                    elseif neuronstructure(neuron).context(context+1,1)==1 && neuronstructure(neuron).context(context+1,2)==0
                    failfuturesplit(fail1,1)=6;
                    end
                    %if prev a fail stop or run
                    if neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context-1,2)==1
                    failfuturesplit(fail1,1)=7;
                    elseif neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context-1,2)==0
                    failfuturesplit(fail1,1)=8;
                    end
                end
            end
            
        end
        
        %%%%look at all contexts, but separate based on past history
        if context>=2 
            if neuronstructure(neuron).context(context-1,1)==1 %&& neuronstructure(neuron).context(context,2)==1 %&& neuronstructure(neuron).context(context-1,2)==1 
            
            afterrew1=afterrew1+1;
            afterrew1behav(afterrew1,1)=neuronstructure(neuron).context(context,2);
            afterrew1neuron(afterrew1,:)=neuronstructure(neuron).contextneuron.zscore(context,:);
            
            
           %all fail context 
            elseif neuronstructure(neuron).context(context-1,1)==2 %&& neuronstructure(neuron).context(context,2)==1 %&& neuronstructure(neuron).context(context-1,2)==1
            
            afterfail1=afterfail1+1;
            afterfail1behav(afterfail1,1)=neuronstructure(neuron).context(context,2);
            afterfail1neuron(afterfail1,:)=neuronstructure(neuron).contextneuron.zscore(context,:);
            end
            
        end
        
        
        %%%%%%%%get the failures in between rewards (either 1 fail or 2 fail)
        %check if current is reward received
        if context+3<=numel(neuronstructure(neuron).context(:,1)) ...
                && neuronstructure(neuron).context(context,1)==1 && neuronstructure(neuron).context(context,2)==1
            
        %check if next one is fail and nextnext one is reward
%             if neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+2,1)==1
%                 rfrrew(rfr,1:3)=[0 0 0];
%                 if neuronstructure(neuron).context(context,2)==1
%                     rfrrew(rfr,1)=1;
%                 end
%                 if neuronstructure(neuron).context(context+1,2)==1
%                 rfrrew(rfr,2)=1;
%                 end
%                 if neuronstructure(neuron).context(context+2,2)==1
%                 rfrrew(rfr,3)=1;
%                 end
%                     
%                 
%                 %check if next one is fail and nextnext one is fail
%             elseif neuronstructure(neuron).context(context+1,1)==2 && neuronstructure(neuron).context(context+2,1)==2
%                 rffrrew(rffr,1:4)=[0 0 0 0];
%                 if neuronstructure(neuron).context(context,2)==1
%                     rffrrew(rffr,1)=1;
%                 end
%                     if neuronstructure(neuron).context(context+1,2)==1
%                     rffrrew(rffr,2)=1;
%                     end
%                     if neuronstructure(neuron).context(context+2,2)==1
%                     rffrrew(rffr,3)=1;
%                     end
%                     if neuronstructure(neuron).context(context+3,2)==1
%                     rffrrew(rffr,4)=1;
%                     end
%                     
%                     
%                 end
%                 
%             end
        end
        end
        
    
   if ploteachneuron==1
       run('ContextNeuronsPlot')
   end
   
   if plotneurontogether==1
       run('ContextNeuronsAverageAll')
   end
    
    

end