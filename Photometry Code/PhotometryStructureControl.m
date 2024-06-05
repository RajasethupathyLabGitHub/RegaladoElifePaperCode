% %%Give a lap number for each new context

%if AddLickLocs wasn't done, do this
%behavior=exper.M;

clear all
clear all
close all
close all

all_files = dir
all_dir = all_files([all_files(:).isdir])
num_dir = numel(all_dir);


newmouse=0;
for foldernum=3:num_dir
    foldername=all_dir(foldernum).name;
    
    if ~contains(foldername,'Passive') && ~contains(foldername,'Fast Mouse') && ~contains(foldername,'Slow Mice') ...
        && ~contains(foldername,'Runners') && ~contains(foldername,'Stoppers')
    trialstructure=[];
    newmouse=newmouse+1
    load([pwd,'/',foldername,'/photometrybehavior.mat']);

    

% load 'photometrybehavior.mat'


for i=2:numel(photometrybehavior(:,1))
    
    if photometrybehavior(i,6)==1 && photometrybehavior(i-1,6)==0  
        
        endcontext=find(photometrybehavior(i:end,6)==0,1)+i-2;
        endcontextime=photometrybehavior(endcontext,1)-photometrybehavior(i,1)
           
           if  ~isempty(endcontextime) && endcontextime>5 && photometrybehavior(i,13)==2
               
               startreward=find(photometrybehavior(:,1)>=(photometrybehavior(endcontext,1)-3),1)
               photometrybehavior(startreward:endcontext,10)=1;
               
           end
    
    
    end

end




%%%%figure out what signals to leave in/out
% I recorded from 5 regions and always in this order 
% [OFC ACC AM BLA LC]
% a 1 means that mouse had that signal, and a 0 means it did not
mousename=char(mousemat);
numberofcol=numel(photometrybehavior(1,:));
photo=[1 1 1 1 1];
if contains(mousename,'mD3')
    photo=[1,0,0,0,0];
    photometrybehavior(:,numberofcol-3)=nan;
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'mD5')
    photo=[1,0,1,1,0];
    photometrybehavior(:,numberofcol-3)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mD7')
    photo=[1,0,1,1,0];
    photometrybehavior(:,numberofcol-3)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mD8')
    photo=[1,1,0,1,0];
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mP1')
    photo=[1,1,0,0,0];
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'mP4')
    photo=[1,1,1,1,1];
    elseif contains(mousename,'mP8')
    photo=[1,1,0,0,0];
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'m1_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'m2_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'m3_')
    photo=[0,1,0,0,0];
    photometrybehavior(:,numberofcol-4)=nan;
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m4_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m5_')
    photo=[1,0,0,0,0];
    photometrybehavior(:,numberofcol-3)=nan;
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m6_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m7_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m8_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m9_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m1Photo_')
    photo=[1,1,1,0,1];
    photometrybehavior(:,numberofcol-1)=nan;
    elseif contains(mousename,'m2Photo_')
    photo=[1,1,1,0,1]; 
    photometrybehavior(:,numberofcol-1)=nan;
    elseif contains(mousename,'m3Photo_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mDot')
    photo=[1,1,0,1,1];
    photometrybehavior(:,numberofcol-2)=nan;
end
%%%make context limits (if we want to look at engaged periods, or disengaged)
contextlimitlow=-1 
contextlimithigh=10000

if habituation==1
    photometrybehavior(:,trialtypes)=1;
end

photometryindex=numel(photometrybehavior(1,:))-signals;

signalchoose=5;

countnullstop=0;
countnonstop=0;
counthabcontextreward=0;
startcounting=0;
previouscontextreward=0;
rewardpreviouscontext=0;
countnullmissed=0;
long=0;
countnullcontext=0;
counthabcontextnoreward=0;
grabtime=0;
loweffort=0;
higheffort=0;
nullspeedtoreward=[];
postrewardlatencytimespeedlick=[];
contextpreviousnull=0;
countnulldistance=0;
water=0;
sugar=0;
acid=0;
counthistory=0;

countcontext=0;
previouscontextmissed=0;
previouscontext=0;
trial_missed_null=0;
trial_missed=0;
trial_correct=0;
countcontext1reward=0;
countcontext2reward=0;

countcontext1engagewin=0;
countcontext2engagewin=0;

countcontext1engagefail=0;
countcontext2engagefail=0;
countcontext1engage=0;
countcontext2engage=0;

countHABengagefail=0;
countHABengagewin=0;
countHABengage=0;

countanycontext1=0;
countanycontext2=0;
countanycontext=0;
countnullbehavior=0;
countstop=0;

countnullmissed=0;
counthabcontextnoreward=0;
counthabcontextreward=0;
councontext2noreward=0;
countcontext2reward=0;
councontext1noreward=0;
countcontext1reward=0;
    
contexttoendtime=nan(200,2);
endtocontexttime=nan(200,2);
contextcount=0;
rewardamount=0;
countreward=0;
countrewardc1=0;

countc1reward=0;
countc2reward=0;
countc1context=0;
countc2context=0;
countfalse=0;

minis=0;
engagements=0;
reengages=0;
minispeeds=[];
engagementspeed=[];

%%%figureout the trials for behavior
trials= photometrybehavior(:,trialcolumn);
last_trial=1:max(trials);
firsttrial=photometrybehavior(1,trialcolumn)
trials=unique(photometrybehavior(:,trialcolumn))
trials=trials(2:end-2).'

if passiveday==1
    trials=unique(photometrybehavior(:,trialcolumn))'
    trials=trials(1:end-1);
end

for v=trials
    
    %setting up the behavior for before, during, and after this trial
    trial=photometrybehavior(find(photometrybehavior(:,trialcolumn)==v),:);
    
    
    if numel(trial(:,1))>1
        
    behavioruntiltrialend=photometrybehavior(find(photometrybehavior(:,trialcolumn)<=v),:);
    behavioraftertrialend=photometrybehavior(find(photometrybehavior(:,trialcolumn)>v),:);
    behaviorfromtrialtoend=photometrybehavior(find(photometrybehavior(:,trialcolumn)>=v),:);
    lastposition=numel(behavioruntiltrialend(:,timecolumn));
    contextbeginnings=[];
    rewardbeginnings=[];
    positiontoengage=[];
    %Update what reinforcement it is
    water=0;
    sugar=0;
    acid=0;
    if trial(end-1,watercolumn)==1
        water=1;
    elseif trial(end-1,sucrosecolumn)==1
        water=0;
        sugar=1;
        acid=0;
    elseif trial(end-1,acidcolumn)==1
        water=0;
        sugar=0;
        acid=1;
    end
    
    %%%the first reward instance
    if startcounting==0 && trial(end,xcolumn)>=contextx && any(trial(end,watercolumn:acidcolumn))==1
        lastrewardend=numel(behavioruntiltrialend(:,timecolumn))+1;
    end
    
    if any(trial(end,watercolumn:acidcolumn))==1
        rewardamount=rewardamount+1;
    end
    
    
    %%%%-----------------------------------------------------------%%%%
    %%%%------------check if mouse went to a context----------------%%%%
    %%%%-----------------------------------------------------------%%%%
    if trial(10,trialtypes)==1
        contextcount=contextcount+1;
            trialstructure(contextcount).trial=contextcount;
            trialstructure(contextcount).context=1;
            trialstructure(contextcount).stop=0;
            trialstructure(contextcount).rewardamount=rewardamount;
    elseif trial(10,trialtypes)==2
        contextcount=contextcount+1;
            trialstructure(contextcount).trial=contextcount;
            trialstructure(contextcount).context=2;
            trialstructure(contextcount).stop=0;
            trialstructure(contextcount).rewardamount=rewardamount;
    end
    %%%%-----------------------------------------------------------%%%%
    %%%%------------check if mouse stoped in context----------------%%%%
    %%%%-----------------------------------------------------------%%%%
    
    if any(trial(:,visualcolumn))==1
        
        contextbeginnings=[find(behavioruntiltrialend(:,xcolumn)==contextx,1,'last')]
%         contextbeginnings=[find(behavioruntiltrialend(:,xcolumn)==contextx,1,'last')];
        contextbeginnings=[find(behavioruntiltrialend(:,xcolumn)~=behavioruntiltrialend(end,xcolumn),1,'last')];
        contextbeginnings=[find(behavioruntiltrialend(:,visualcolumn)==0,1,'last')];
        contextbeginnings=min(contextbeginnings)+1;
        
        counttimes=0;
        tryonce=1;
        rewardtrial=0;
        timestop=[];
        
        
        for i=1:numel(photometrybehavior(contextbeginnings:lastposition,originalspeedcolumn))
            
            if photometrybehavior(contextbeginnings+i-1,originalspeedcolumn)<=stopthreshold
                counttimes=counttimes+1;
                timestop(counttimes)=photometrybehavior(contextbeginnings+i-1,timecolumn);
                
                if timestop(end)-timestop(1)>=1 && tryonce==1 && photometrybehavior(contextbeginnings+i-1,timecolumn)>=photometrybehavior(contextbeginnings,timecolumn)+3
                    countreward=countreward+1;
                    tryonce=0;
                    rewardbeginnings=contextbeginnings+i-1
                    rewardtrial=1;
                    rewardending=numel(behavioruntiltrialend(:,timecolumn));
                    nextcontext=find(photometrybehavior(rewardending+1:numel(photometrybehavior(:,1)),xcolumn)~=contextx,1,'first');
                    nextcontext=nextcontext+rewardending+1;
                    
                    stopposition=find(photometrybehavior(:,timecolumn)==timestop(1));
                    
             
                    behaviorfromrewardendtocontext=photometrybehavior(rewardbeginnings+1:nextcontext,:);
                    if trialstructure(contextcount).context==2
                        countrewardc1=countrewardc1+1;
                    allrewardbeginnings(countrewardc1,1:10)=photometrybehavior(rewardbeginnings-4:rewardbeginnings+5,watercolumn);
                    end
                    
                    trialstructure(contextcount).stop=1;
                end
            elseif photometrybehavior(contextbeginnings+i-1,originalspeedcolumn)>stopthreshold
                counttimes=0;
                timestop=[];
           end
            
        
        end
        
        if behavioruntiltrialend(end-10,9)==1 || behavioruntiltrialend(end-10,10)==1
               rewardbeginnings=[find(behavioruntiltrialend(:,9)==0,1,'last')+1 find(behavioruntiltrialend(:,10)==0,1,'last')+1];
               rewardbeginnings=min(rewardbeginnings);
%                allrewardbeginnings(contextcount)=rewardbeginnings;
        end
        
                     if passiveday==1
              
            countreward=countreward+1;
               rewardbeginnings=find(photometrybehavior(:,timecolumn)<=photometrybehavior(lastposition,timecolumn)-2,1,'last')+1;
               rewardbeginnings=[find(behavioruntiltrialend(:,9)==0,1,'last')+1 find(behavioruntiltrialend(:,10)==0,1,'last')+1];
               rewardbeginnings=min(rewardbeginnings);
               
               rewardbeginnings=find(photometrybehavior(:,timecolumn)<=photometrybehavior(lastposition,timecolumn)-3,1,'last')+1;
%                hello
                    rewardtrial=1;
                    rewardending=numel(behavioruntiltrialend(:,timecolumn));
                    nextcontext=find(photometrybehavior(rewardending+1:numel(photometrybehavior(:,1)),xcolumn)~=contextx,1,'first');
                    nextcontext=nextcontext+rewardending+1;
                    behaviorfromcontexttocontext=photometrybehavior(contextbeginnings+1:nextcontext,:);
                    timestop=photometrybehavior(rewardbeginnings,timecolumn);
                    stopposition=rewardbeginnings;
%                     rewardcounter=rewardcounter+1;
                    trialstructure(contextcount).stop=1;
%                     hello
                     end 
           
    end
    

    %%%%-------------------------------------------------------------%%%%
    %%%%------------ONLY count nulls, context, and reward after 1st reward----------------%%%%
    %%%%-------------------------------------------------------------%%%%
    
        if photometrybehavior(contextbeginnings-10,xcolumn)==0
            trialstructure(contextcount).firstcontext=1;
        else
            trialstructure(contextcount).firstcontext=0;
        end
    
    
    %%%%%%% is trial missed? did mouse stop? did mouse not stop?
    contexttrial=0;
    if startcounting==1
        
        
        if trial(end,xcolumn)==-20 && any(trial(:,originalspeedcolumn)>1)
            trial_missed_null=trial_missed_null+1;
            countnullmissed=countnullmissed+1;
            previousnullmissed=1;
        elseif any(trial(:,trialtypes))==2 && rewardtrial==0
            contexttrial=1;
            councontext2noreward=councontext2noreward+1;
        elseif any(trial(:,trialtypes))==2 && rewardtrial==1
            contexttrial=1;
            countcontext2reward=countcontext2reward+1;
        elseif any(trial(:,trialtypes))==1 && rewardtrial==0
            contexttrial=1;
            councontext1noreward=councontext1noreward+1;
        elseif any(trial(:,trialtypes))==1 && rewardtrial==1
            contexttrial=1;
            countcontext1reward=countcontext1reward+1;
        end
    end
    
    %%%%-------------------------------------------------------------%%%%
    %%%%------------find when engagement starts after stopping----------------%%%%
    %%%%-------------------------------------------------------------%%%%
  falsestarts=0;
   if contextcount>0 && ~isempty(contextbeginnings) 
    if trialstructure(contextcount).stop==1
                behaviorfromrewardtoend=photometrybehavior(rewardbeginnings:numel(photometrybehavior(:,1)),:);
                
                nextcontext=find(photometrybehavior(lastposition+2:end,6)==1,1,'first')+lastposition+1;
                
                %%%%%%%%%%%%%%setup engagement and mini variables%%%%%%%%%%
                
                      engagetime=[];
                      engagetimetrace=[];
                      engagespeedav=[];
                      engagespeedtrace=[];
                      engagelickav=[];
                      engagelicktrace=[];
                      engagesignals=[];
                      
                      minitime=[];
                      minitimetrace=[];
                      minispeedav=[];
                      minispeedtrace=[];
                      minilickav=[];
                      minilicktrace=[];
                      minisignals=[];
                
                %%%%%%%%%%%%%% Mini ENGAGEMENTS (shorter than 1s) %%%%%%%%%%%%%%
                countposition=0;
                time=[];
                firstengage=1;
                firstmini=1;
                minispertrial=0;
                behaviorfromrewardtocontext=photometrybehavior(rewardbeginnings:nextcontext,:);
                for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
                    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
                        countposition=countposition+1;
                        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
                            if time(end)-time(1)>=0.5
                                
                                runend=find(photometrybehavior(i+rewardbeginnings-1:end,originalspeedcolumn)<1,1,'first')
                                runend=runend+i+rewardbeginnings-2;
                                if photometrybehavior(runend,timecolumn)-time(1)<1.05 && photometrybehavior(runend,visualcolumn)~=1 && firstmini==1
                                    
                                    firstmini=0;
                                    minis=minis+1;
                                    minispertrial=minispertrial+1;
                                    
                                    positiontomini=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first')
                                    positiontomini=positiontomini+rewardbeginnings-1;
                                    
                                    minispeeds(minis,:)=photometrybehavior(positiontomini-25:positiontomini+34,originalspeedcolumn);
                                    
                                    
                      minitime(minispertrial,:)=mean(photometrybehavior(positiontomini-25:positiontomini+34,timecolumn));
                      minitimetrace(minispertrial,:)=photometrybehavior(positiontomini-25:positiontomini+34,timecolumn)-photometrybehavior(positiontomini,timecolumn);
                      minispeedav(minispertrial,:)=mean(photometrybehavior(positiontomini-25:positiontomini+34,originalspeedcolumn));
                      minispeedtrace(minispertrial,:)=photometrybehavior(positiontomini-25:positiontomini+34,originalspeedcolumn);
                      minilickav(minispertrial,:)=mean(photometrybehavior(positiontomini-25:positiontomini+34,lickcolumn));
                      minilicktrace(minispertrial,:)=photometrybehavior(positiontomini-25:positiontomini+34,lickcolumn);
                      
                      for sig=1:signals
                          minisignals(minispertrial,:,sig)=photometrybehavior(positiontomini-25:positiontomini+34,photometryindex+sig);
                      end
                      
                                end
                                
                            end
                    else
                        firstmini=1;
                    countposition=0;
                    time=[];
                    end
                    
                end
                
                %%%%%%%%%%%%%% ENGAGEMENTS longer than 1s %%%%%%%%%%%%%%
                countposition=0;
                time=[];
                firstengage=1;
                mini1=0;
                behaviorfromrewardtocontext=photometrybehavior(rewardbeginnings:nextcontext,:);   
                if passiveday==0
                 engagements=engagements+1;
                %just to grab the engagement prior to next context entry
                positiontoengage=find(photometrybehavior(1:nextcontext,originalspeedcolumn)<1,1,'last');
                timetosubtractfrom=photometrybehavior(lastposition,timecolumn);
                engagementspeed(engagements,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn);
                engagementcuecolumn(engagements,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,6); 
                engagementtimecolumn(engagements,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,1)-photometrybehavior(positiontoengage,1); 
                
                      engagetime(1,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,timecolumn));
                      engagetimetrace(1,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,timecolumn)-photometrybehavior(positiontoengage,timecolumn);
                      engagespeedav(1,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn));
                      engagespeedtrace(1,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn);
                      engagelickav(1,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,lickcolumn));
                      engagelicktrace(1,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,lickcolumn);
                      
                      %%%instead of engagements do next context
                % engagementspeed(engagements,:)=photometrybehavior(nextcontext-35:nextcontext+24,originalspeedcolumn);
                % engagementcuecolumn(engagements,:)=photometrybehavior(nextcontext-35:nextcontext+24,6); 
                % engagementtimecolumn(engagements,:)=photometrybehavior(nextcontext-35:nextcontext+24,1)-photometrybehavior(nextcontext,1); 
                % 
                %       engagetime(1,:)=mean(photometrybehavior(nextcontext-35:nextcontext+24,timecolumn));
                %       engagetimetrace(1,:)=photometrybehavior(nextcontext-35:nextcontext+24,timecolumn)-photometrybehavior(nextcontext,timecolumn);
                %       engagespeedav(1,:)=mean(photometrybehavior(nextcontext-35:nextcontext+24,originalspeedcolumn));
                %       engagespeedtrace(1,:)=photometrybehavior(nextcontext-35:nextcontext+24,originalspeedcolumn);
                %       engagelickav(1,:)=mean(photometrybehavior(nextcontext-35:nextcontext+24,lickcolumn));
                %       engagelicktrace(1,:)=photometrybehavior(nextcontext-35:nextcontext+24,lickcolumn);
                      
                      for sig=1:signals
                          engagesignals(1,:,sig)=photometrybehavior(positiontoengage-25:positiontoengage+34,photometryindex+sig);
                      end
                
                end
                
                if passiveday==1
                    %%%%%%%%%%%%%% Passive ENGAGEMENTS (longer than 1s) %%%%%%%%%%%%%%
                countposition=0;
                time=[];
                firstengage=1;
                firstmini=1;
                engagementspertrial=0;
                behaviorfromrewardtocontext=photometrybehavior(rewardbeginnings:nextcontext,:);
                for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
                    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
                        countposition=countposition+1;
                        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
                            if time(end)-time(1)>=0.5
                                
                                runend=find(photometrybehavior(i+rewardbeginnings-1:end,originalspeedcolumn)<1,1,'first')
                                runend=runend+i+rewardbeginnings-2;
                                if photometrybehavior(runend,timecolumn)-time(1)>1.05 && photometrybehavior(runend,visualcolumn)~=1 && firstengage==1
                                    
                                    firstengage=0;
                                    engagements=engagements+1;
                                    engagementspertrial=engagementspertrial+1;
                                    
                                    positiontoengage=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first')
                                    positiontoengage=positiontoengage+rewardbeginnings-1;
                                    
                                    engagementspeed(engagements,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn);
                                    
                                    
                                  engagetime(engagementspertrial,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,timecolumn));
                                  engagetimetrace(engagementspertrial,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,timecolumn)-photometrybehavior(positiontoengage,timecolumn);
                                  engagespeedav(engagementspertrial,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn));
                                  engagespeedtrace(engagementspertrial,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,originalspeedcolumn);
                                  engagelickav(engagementspertrial,:)=mean(photometrybehavior(positiontoengage-25:positiontoengage+34,lickcolumn));
                                  engagelicktrace(engagementspertrial,:)=photometrybehavior(positiontoengage-25:positiontoengage+34,lickcolumn);
                                    
                      for sig=1:signals
                          engagesignals(engagementspertrial,:,sig)=photometrybehavior(positiontoengage-25:positiontoengage+34,photometryindex+sig);
                      end
                                end
                                
                            end
                    else
                        firstengage=1;
                    countposition=0;
                    time=[];
                    end
                    
                end
                end
                
                
                
                positiontodisengage=find(photometrybehavior(positiontoengage:end,originalspeedcolumn)<1,1,'first');
                positiontodisengage=positiontodisengage+positiontoengage-1;
                if positiontodisengage<nextcontext
                falsestarts=1;
                countfalse=countfalse+1;
                end
                
    end
   end
    %%%%-------------------------------------------------------------%%%%
    %%%%------------Check if mouse ran out after stopping------------%%%%
    %%%%-------------------------------------------------------------%%%%
                    
                      reengagetime=[];
                      reengagetimetrace=[];
                      reengagespeedav=[];
                      reengagespeedtrace=[];
                      reengagelickav=[];
                      reengagelicktrace=[];
                      reengagesignals=[];
    
    if trialstructure(contextcount).stop==0 || passiveday==1
        
                behaviorfromcontexttoend=photometrybehavior(contextbeginnings:numel(photometrybehavior(:,1)),:);
              
                %%%%%%%%%%%%%%setup engagement and mini variables%%%%%%%%%%

                
                %%%%%%%%%%%%%% Mini ENGAGEMENTS (shorter than 1s) %%%%%%%%%%%%%%
                countposition=0;
                time=[];
                firstreengage=1;
                minispertrial=0;
                stoponce=1;
                
        for i=1:numel(behaviorfromcontexttoend(:,originalspeedcolumn))
                    if behaviorfromcontexttoend(i,originalspeedcolumn)<1 
                        countposition=countposition+1;
                        time(countposition)=behaviorfromcontexttoend(i,timecolumn);
                            if time(end)-time(1)>=0.5 && stoponce==1
                                stoponce=0;
                                runstart=find(photometrybehavior(i+contextbeginnings-1:lastposition,originalspeedcolumn)>=1,1,'first')
                                if passiveday==1
                                runstart=find(photometrybehavior(i+contextbeginnings-1:rewardbeginnings,originalspeedcolumn)>=1,1,'first')
                                end
                                runstart=runstart+i+contextbeginnings-2;
                                
                                runstartend=find(photometrybehavior(runstart:end,originalspeedcolumn)<1,1,'first');
                                runstartend=runstartend+runstart-1;
                                
                                if ~isempty(runstart) && photometrybehavior(runstartend,timecolumn)-photometrybehavior(runstart,timecolumn)>0.5 && firstreengage==1
                                    
                                    firstreengage=0;
                                    reengages=reengages+1;
%                                     positiontomini=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first')
%                                     positiontomini=positiontomini+rewardbeginnings-1;
                                    
                                    reengagespeeds(reengages,:)=photometrybehavior(runstart-25:runstart+34,originalspeedcolumn);
                                    
                                    
                      reengagetime(1,:)=mean(photometrybehavior(runstart-25:runstart+34,timecolumn));
                      reengagetimetrace(1,:)=photometrybehavior(runstart-25:runstart+34,timecolumn)-photometrybehavior(runstart,timecolumn);
                      reengagespeedav(1,:)=mean(photometrybehavior(runstart-25:runstart+34,originalspeedcolumn));
                      reengagespeedtrace(1,:)=photometrybehavior(runstart-25:runstart+34,originalspeedcolumn);
                      reengagelickav(1,:)=mean(photometrybehavior(runstart-25:runstart+34,lickcolumn));
                      reengagelicktrace(1,:)=photometrybehavior(runstart-25:runstart+34,lickcolumn);
                      
                      for sig=1:signals
                          reengagesignals(1,:,sig)=photometrybehavior(runstart-25:runstart+34,photometryindex+sig);
                      end
                      
                      
                                end
                                
                            end
                    else
                        firstreengage=1;
                    countposition=0;
                    time=[];
                    end
        
    
        end
    end
    %%%%-------------------------------------------------------------%%%%
    %%%%------------Fill out trialstructures for each context----------------%%%%
    %%%%-------------------------------------------------------------%%%%
    
   %if startcounting==1
   if contextcount>1 && ~isempty(contextbeginnings) 
       
   if trialstructure(contextcount).stop==0
      
      
      
      trialstructure(contextcount).contextbehavior.time=photometrybehavior(lastposition,timecolumn)-photometrybehavior(contextbeginnings,timecolumn);
      trialstructure(contextcount).contextbehavior.timetrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,timecolumn)-photometrybehavior(contextbeginnings,timecolumn);
      trialstructure(contextcount).contextbehavior.speedav=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,originalspeedcolumn));
      trialstructure(contextcount).contextbehavior.speedtrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,originalspeedcolumn);
      trialstructure(contextcount).contextbehavior.lickav=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,lickcolumn));
      trialstructure(contextcount).contextbehavior.licktrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,lickcolumn);
      
      trialstructure(contextcount).rewardbehavior.time=0;
      trialstructure(contextcount).rewardbehavior.speedav=0;
      trialstructure(contextcount).rewardbehavior.speedtrace=0;
      trialstructure(contextcount).rewardbehavior.lickav=0;
      trialstructure(contextcount).rewardbehavior.licktrace=0;
      
      trialstructure(contextcount).postbehavior.time=0;
      trialstructure(contextcount).postbehavior.speedav=0;
      trialstructure(contextcount).postbehavior.speedtrace=0;
      trialstructure(contextcount).postbehavior.lickav=0;
      trialstructure(contextcount).postbehavior.licktrace=0;
      
      trialstructure(contextcount).engagebehavior.time=0;
      trialstructure(contextcount).engagebehavior.timetrace=0;
      trialstructure(contextcount).engagebehavior.speedav=0;
      trialstructure(contextcount).engagebehavior.speedtrace=0;
      trialstructure(contextcount).engagebehavior.lickav=0;
      trialstructure(contextcount).engagebehavior.licktrace=0;
      
      trialstructure(contextcount).minibehavior.time=0;
      trialstructure(contextcount).minibehavior.timetrace=0;
      trialstructure(contextcount).minibehavior.speedav=0;
      trialstructure(contextcount).minibehavior.speedtrace=0;
      trialstructure(contextcount).minibehavior.lickav=0;
      trialstructure(contextcount).minibehavior.licktrace=0;
      
      trialstructure(contextcount).decisionbehavior=[];
      trialstructure(contextcount).motivationbehavior=[];
      trialstructure(contextcount).disengage=[];
      
      trialstructure(contextcount).reengagebehavior.time=reengagetime;
      trialstructure(contextcount).reengagebehavior.timetrace=reengagetimetrace;
      trialstructure(contextcount).reengagebehavior.speedav=reengagespeedav;
      trialstructure(contextcount).reengagebehavior.speedtrace=reengagespeedtrace;
      trialstructure(contextcount).reengagebehavior.lickav=reengagelickav;
      trialstructure(contextcount).reengagebehavior.licktrace=reengagelicktrace;
      
      
      trialstructure(contextcount).decisionbehavior.speedtrace=photometrybehavior(contextbeginnings:lastposition,speedcolumn);
      trialstructure(contextcount).decisionbehavior.licktrace=photometrybehavior(contextbeginnings:lastposition,lickcolumn);
      
      for sig=1:signals
      trialstructure(contextcount).contextbehavior.signals(sig).mean=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,photometryindex+sig));
      trialstructure(contextcount).contextbehavior.signals(sig).trace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,photometryindex+sig); %-photometrybehavior(contextbeginnings,photometryindex+sig);
      cc=corrcoef(photometrybehavior(contextbeginnings:lastposition,speedcolumn),photometrybehavior(contextbeginnings:lastposition,photometryindex+sig));
      trialstructure(contextcount).contextbehavior.signals(sig).speedcorrelations=cc(1,2);
      cc=corrcoef(photometrybehavior(contextbeginnings:lastposition,lickcolumn),photometrybehavior(contextbeginnings:lastposition,photometryindex+sig));
      trialstructure(contextcount).contextbehavior.signals(sig).lickcorrelations=cc(1,2);
      trialstructure(contextcount).contextbehavior.signals(sig).include=photo(sig);
      
      trialstructure(contextcount).rewardbehavior.signals(sig).mean=0;
      trialstructure(contextcount).rewardbehavior.signals(sig).trace=0;
      trialstructure(contextcount).postbehavior.signals(sig).mean=0;
      trialstructure(contextcount).postbehavior.signals(sig).trace=0;
      trialstructure(contextcount).engagebehavior.signals(sig).mean=0;
      trialstructure(contextcount).engagebehavior.signals(sig).trace=0;
      trialstructure(contextcount).minibehavior.signals(sig).mean=0;
      trialstructure(contextcount).minibehavior.signals(sig).trace=0;
      
      if ~isempty(reengagesignals)
      trialstructure(contextcount).reengagebehavior.signals(sig).mean=mean(reengagesignals(:,:,sig));
      trialstructure(contextcount).reengagebehavior.signals(sig).trace=reengagesignals(:,:,sig);
      end
      
      trialstructure(contextcount).decisionbehavior.signals(sig).trace=photometrybehavior(contextbeginnings:lastposition,photometryindex+sig);
      end
      
      
end
   
   if trialstructure(contextcount).stop==1 && numel(photometrybehavior(:,1))>(lastposition+59);
       
      trialstructure(contextcount).contextbehavior.time=photometrybehavior(rewardbeginnings-1,timecolumn)-photometrybehavior(contextbeginnings,timecolumn);
      trialstructure(contextcount).contextbehavior.timetrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,timecolumn)-photometrybehavior(contextbeginnings,timecolumn);
      trialstructure(contextcount).contextbehavior.speedav=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,originalspeedcolumn));
      trialstructure(contextcount).contextbehavior.speedtrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,originalspeedcolumn);
      trialstructure(contextcount).contextbehavior.lickav=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,lickcolumn));
      trialstructure(contextcount).contextbehavior.licktrace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,lickcolumn);
      
      trialstructure(contextcount).rewardbehavior.time=photometrybehavior(lastposition,timecolumn)-photometrybehavior(rewardbeginnings,timecolumn);
      trialstructure(contextcount).rewardbehavior.timetrace=photometrybehavior(rewardbeginnings-25:rewardbeginnings+34,timecolumn)-photometrybehavior(rewardbeginnings,timecolumn);
      trialstructure(contextcount).rewardbehavior.speedav=mean(photometrybehavior(rewardbeginnings:rewardbeginnings+34,originalspeedcolumn));
      trialstructure(contextcount).rewardbehavior.speedtrace=photometrybehavior(rewardbeginnings-25:rewardbeginnings+34,originalspeedcolumn);
      trialstructure(contextcount).rewardbehavior.lickav=mean(photometrybehavior(rewardbeginnings:rewardbeginnings+34,lickcolumn));
      trialstructure(contextcount).rewardbehavior.licktrace=photometrybehavior(rewardbeginnings-25:rewardbeginnings+34,lickcolumn);
      
      if trialstructure(contextcount).context==1
      trialstructure(contextcount).rewardbehavior.thisreward=1;
      elseif trialstructure(contextcount).context==2
      trialstructure(contextcount).rewardbehavior.thisreward=2;
      end
      
      trialstructure(contextcount).postbehavior.next=photometrybehavior(lastposition,trialtypes);
      trialstructure(contextcount).postbehavior.time=photometrybehavior(lastposition+59,timecolumn)-photometrybehavior(lastposition,timecolumn);
      trialstructure(contextcount).postbehavior.timetrace=photometrybehavior(lastposition:lastposition+59,timecolumn)-photometrybehavior(lastposition,timecolumn);
      trialstructure(contextcount).postbehavior.speedav=mean(photometrybehavior(lastposition:lastposition+59,originalspeedcolumn));
      trialstructure(contextcount).postbehavior.speedtrace=photometrybehavior(lastposition:lastposition+59,originalspeedcolumn);
      trialstructure(contextcount).postbehavior.lickav=mean(photometrybehavior(lastposition:lastposition+59,lickcolumn));
      trialstructure(contextcount).postbehavior.licktrace=photometrybehavior(lastposition:lastposition+59,lickcolumn);
      
      
      trialstructure(contextcount).engagebehavior.time=engagetime;
      trialstructure(contextcount).engagebehavior.timetrace=engagetimetrace;
      trialstructure(contextcount).engagebehavior.speedav=engagespeedav;
      trialstructure(contextcount).engagebehavior.speedtrace=engagespeedtrace;
      trialstructure(contextcount).engagebehavior.lickav=engagelickav;
      trialstructure(contextcount).engagebehavior.licktrace=engagelicktrace;

      trialstructure(contextcount).minibehavior.time=minitime;
      trialstructure(contextcount).minibehavior.timetrace=minitimetrace;
      trialstructure(contextcount).minibehavior.speedav=minispeedav;
      trialstructure(contextcount).minibehavior.speedtrace=minispeedtrace;
      trialstructure(contextcount).minibehavior.lickav=minilickav;
      trialstructure(contextcount).minibehavior.licktrace=minilicktrace;
      
      %%% pull out decision and motivation time series
      trialstructure(contextcount).decisionbehavior.speedtrace=photometrybehavior(stopposition-24:stopposition+34,originalspeedcolumn);
      trialstructure(contextcount).decisionbehavior.licktrace=photometrybehavior(stopposition-24:stopposition+34,lickcolumn);
      
      if any(trial(:,watercolumn))>0 || any(trial(:,sucrosecolumn))>0 || any(trial(:,acidcolumn))>0 
      trialstructure(contextcount).motivationbehavior.speedtrace=photometrybehavior(stopposition-25:stopposition+34,originalspeedcolumn);
      trialstructure(contextcount).motivationbehavior.licktrace=photometrybehavior(stopposition:stopposition,lickcolumn);
      else
      trialstructure(contextcount).motivationbehavior.speedtrace=photometrybehavior(stopposition:nextcontext,originalspeedcolumn);
      trialstructure(contextcount).motivationbehavior.licktrace=photometrybehavior(rewardbeginnings:nextcontext,lickcolumn);
      end
      %%%
      
      for sig=1:signals
      trialstructure(contextcount).contextbehavior.signals(sig).mean=mean(photometrybehavior(contextbeginnings:contextbeginnings+34,photometryindex+sig));
      trialstructure(contextcount).contextbehavior.signals(sig).trace=photometrybehavior(contextbeginnings-25:contextbeginnings+34,photometryindex+sig); %-photometrybehavior(contextbeginnings,photometryindex+sig);
%       trialstructure(contextcount).contextbehavior.signals(sig).include=photo(sig);
      
      trialstructure(contextcount).rewardbehavior.signals(sig).trace=photometrybehavior(rewardbeginnings-25:rewardbeginnings+34,photometryindex+sig); %-photometrybehavior(rewardbeginnings,photometryindex+sig);
      trialstructure(contextcount).rewardbehavior.signals(sig).mean=mean(photometrybehavior(rewardbeginnings:rewardbeginnings+34,photometryindex+sig));
%       trialstructure(contextcount).rewardbeginnings.signals(sig).include=photo(sig);
      
      trialstructure(contextcount).postbehavior.signals(sig).mean=mean(photometrybehavior(lastposition:lastposition+59,photometryindex+sig));
      trialstructure(contextcount).postbehavior.signals(sig).trace=photometrybehavior(lastposition:lastposition+59,photometryindex+sig);
%       trialstructure(contextcount).postbehavior.signals(sig).include=photo(sig); %-photometrybehavior(lastposition,photometryindex+sig);
      
      if ~isempty(engagesignals)
      trialstructure(contextcount).engagebehavior.signals(sig).mean=mean(engagesignals(:,:,sig));
      trialstructure(contextcount).engagebehavior.signals(sig).trace=engagesignals(:,:,sig);
%       trialstructure(contextcount).engagebehavior.signals(sig).include=photo(sig);
      end
      
      if ~isempty(minisignals)
      trialstructure(contextcount).minibehavior.signals(sig).mean=mean(minisignals(:,:,sig));
      trialstructure(contextcount).minibehavior.signals(sig).trace=minisignals(:,:,sig);
%       trialstructure(contextcount).minibehavior.signals(sig).include=photo(sig);
      end
      
      
      cc=corrcoef(photometrybehavior(positiontoengage-47:positiontoengage+12,speedcolumn),photometrybehavior(positiontoengage-47:positiontoengage+12,photometryindex+sig));
      trialstructure(contextcount).engagebehavior.signals(sig).speedcorrelations=cc(1,2);
      cc=corrcoef(photometrybehavior(positiontoengage-47:positiontoengage+12,lickcolumn),photometrybehavior(positiontoengage-47:positiontoengage+12,photometryindex+sig));
      trialstructure(contextcount).engagebehavior.signals(sig).lickcorrelations=cc(1,2);
      
      trialstructure(contextcount).decisionbehavior.signals(sig).trace=photometrybehavior(contextbeginnings:rewardbeginnings,photometryindex+sig);
            
      if any(trial(:,watercolumn))>0 || any(trial(:,sucrosecolumn))>0 || any(trial(:,acidcolumn))>0 
      trialstructure(contextcount).motivationbehavior.signals(sig).trace=photometrybehavior(lastposition:nextcontext,photometryindex+sig);
      else
      trialstructure(contextcount).motivationbehavior.signals(sig).trace=photometrybehavior(rewardbeginnings:nextcontext,photometryindex+sig);
      end
      
      end
      
        if numel(photometrybehavior(:,1))>positiontodisengage+34
       if falsestarts==1
       trialstructure(contextcount).disengage.correct=0;
       trialstructure(contextcount).disengage.speedtrace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,speedcolumn).';
       trialstructure(contextcount).disengage.licktrace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,lickcolumn).';
       for sig=1:signals
       trialstructure(contextcount).disengage.signals(sig).trace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,photometryindex+sig);
       end
       else 
       trialstructure(contextcount).disengage.correct=1;
       trialstructure(contextcount).disengage.speedtrace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,speedcolumn).';
       trialstructure(contextcount).disengage.licktrace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,lickcolumn).';

       for sig=1:signals
       trialstructure(contextcount).disengage.signals(sig).trace=photometrybehavior(positiontodisengage-25:positiontodisengage+34,photometryindex+sig);
       end
       end
        end
   
      trialstructure(contextcount).reengagebehavior.time=reengagetime;
      trialstructure(contextcount).reengagebehavior.timetrace=reengagetimetrace;
      trialstructure(contextcount).reengagebehavior.speedav=reengagespeedav;
      trialstructure(contextcount).reengagebehavior.speedtrace=reengagespeedtrace;
      trialstructure(contextcount).reengagebehavior.lickav=reengagelickav;
      trialstructure(contextcount).reengagebehavior.licktrace=reengagelicktrace;
      
      
      for sig=1:signals
      if ~isempty(reengagesignals)
      trialstructure(contextcount).reengagebehavior.signals(sig).mean=mean(reengagesignals(:,:,sig));
      trialstructure(contextcount).reengagebehavior.signals(sig).trace=reengagesignals(:,:,sig);
      end
      end
      
   end
   

   
   end
    
   
    %%%%-------------------------------------------------------------%%%%
    %%%%------------Find time since last reward----------------%%%%
    %%%%-------------------------------------------------------------%%%%
   
    %%%change startcounting to 1
    if any(trial(end,watercolumn:acidcolumn))==1 && startcounting==0
        startcounting=1;
        lastrewardendtime=behavioruntiltrialend(end,timecolumn);
        lasttrialendposition=numel(behavioruntiltrialend(:,1));
        previouscontextreward=1;
    end
    %%%
   
    end
end
end

% stop

% signals=5
% passiveday=0
% trainingday=1
% plotting=1
% hello
% hello
folderdirectory=[pwd,'/',foldername, '/trialstructure.mat'];


clearvars -except signals passiveday trainingday plotting trialstructure runbehavior runphotometry engagementspeed minispeeds folderdirectory ...
all_files all_dir num_dir newmouse foldernum foldername filename

save(folderdirectory)


% stop
% run('PhotometryStructurePlotControl')

% close all
% close all

end
