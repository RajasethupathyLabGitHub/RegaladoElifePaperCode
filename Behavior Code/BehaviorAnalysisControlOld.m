% %%Give a lap number for each new context

%if AddLickLocs wasn't done, do this
%behavior=exper.M;



if habituation==1
    behavior(:,trialtypes)=1;
end

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
historymissed=nan(100,1000);
historyduring=nan(100,1000);
historyafter=nan(100,1000);
timetonextstop=nan(100,2);
timetonextcontextrew=nan(100,2);
timetonextcontext=nan(100,2);
speedtonextcontext=nan(100,2);
context12rewpupilchange=nan(100,2);

timetoengage=nan(100,3);
speedinengage=nan(100,3);
timeinengage=nan(100,3);
distanceinengage=nan(100,3);
context12lick=nan(100,2);
context12antilick=nan(100,2);
context12rewlick=nan(100,2);
context12afterlick=nan(100,2);
context12afterspeed=nan(100,2);
context12rewspeed=nan(100,2);
context12contexttime=nan(100,2);
context12lick=nan(100,2);
context12rewtime=nan(100,2);
context12speed=nan(100,2);
context12speedorigall=nan(100,2);
context12speedorigcontext=nan(100,2);
contextHABantirewafterlick=nan(100,3);
contextHABantirewafterspeed=nan(100,3);
context12time=nan(100,2);
context12engagetime=nan(100,2);
context12nextlick=nan(100,4);
context12nextspeed=nan(100,4);
context12nextallspeed=nan(100,4);
countHABengagewin=0;
countHABengagefail=0;
countcontext1engagewin=0;
countcontext1engagefail=0;
countcontext2engagewin=0;
countcontext2engagefail=0;
countc2noreward=0;
countc2reward=0;
countc1noreward=0;
countc1reward=0;
countc1=0;
countc2=0;
countc1reward=0;
countc2reward=0;
countcontext=0;
c1=0;
countc2=0;

countc1nextc1correct=0;
countc1nextc1notcorrect=0;
countc2nextc1correct=0;
countc2nextc1notcorrect=0;
countc1nextc2correct=0;
countc1nextc2notcorrect=0;
countc2nextc2correct=0;
countc2nextc2notcorrect=0;

countrewardcontext=0;
previouscontextmissed=0;
previouscontext=0;
trial_missed_null=0;
trial_missed=0;
trial_correct=0;

stopposition=[];
    
    rewardtrial=0;
    
    addon=20;
    

rewardcounter=0;
checkforwater=1;
stopcheckingcounting=1;
trials= behavior(:,trialcolumn);
last_trial=1:max(trials);
mini1=0;
mini2=0;

previousreward=0;

for v=3:length(last_trial)-2
    
    trial=behavior(find(behavior(:,trialcolumn)==v),:);
    behavioruntiltrialend=behavior(find(behavior(:,trialcolumn)<=v),:);
    behavioraftertrialend=behavior(find(behavior(:,trialcolumn)>v),:);
    behaviorfromtrialtoend=behavior(find(behavior(:,trialcolumn)>=v),:);
    lastposition=numel(behavioruntiltrialend(:,timecolumn));
    if numel(trial(:,1))>2 && trial(1,timecolumn)<1800
        
        
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
    if startcounting==0 && any(trial(end,watercolumn:acidcolumn))==1 
        lastrewardend=numel(behavioruntiltrialend(:,timecolumn))+1;
    end
    %%%
%     if any(trial(end,watercolumn:acidcolumn))==1
%     end
        
    if trainingday==1 && trial(end,trialtypes)~=behavior(5,trialtypes) && stopcheckingcounting==1
%        hello
        startcounting=1;
        stopcheckingcounting=0;
    elseif trainingday==1 && stopcheckingcounting==1
        startcounting=0;
%        hello
    end
    
    %%%%-----------------------------------------%%%%
    %%%%------------check if mouse stoped in context----------------%%%%
    %%%%-----------------------------------------%%%%
    rewardtrial=0;
    if any(trial(:,visualcolumn))>0 
        
        
        
%         contextbeginnings=[find(behavioruntiltrialend(:,xcolumn)==contextx,1,'last')];
        contextbeginnings=[find(behavioruntiltrialend(:,xcolumn)~=behavioruntiltrialend(end,xcolumn),1,'last')];
        contextbeginnings=[find(behavioruntiltrialend(:,visualcolumn)==0,1,'last')]+1;

        contextbeginnings=min(contextbeginnings);
        counttimes=0;
        tryonce=1;
        rewardtrial=0;
        timestop=[];
%         hello
        for i=1:numel(behavior(contextbeginnings:lastposition,originalspeedcolumn))
            if behavior(contextbeginnings+i-1,originalspeedcolumn)<=stopthreshold
                counttimes=counttimes+1;
                timestop(counttimes)=behavior(contextbeginnings+i-1,timecolumn);
                
                if timestop(end)-timestop(1)>1 && tryonce==1 && behavior(contextbeginnings+i-1,timecolumn)>behavior(contextbeginnings,timecolumn)+3
                    
                    %rewarddelivery=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn)+3,1,'first')
                    %hello
                    countreward=countreward+1;
                    tryonce=0;
                    rewardbeginnings=contextbeginnings+i-1;
                    %rewardbeginnings=rewarddelivery+1;
                    rewardtrial=1;
                    rewardending=numel(behavioruntiltrialend(:,timecolumn));
                    nextcontext=find(behavior(rewardending+1:numel(behavior(:,1)),xcolumn)~=contextx,1,'first');
                    nextcontext=nextcontext+rewardending+1;
                    behaviorfromcontexttocontext=behavior(contextbeginnings+1:nextcontext,:);
                    stopposition=find(behavior(:,timecolumn)==timestop(1));
                    rewardcounter=rewardcounter+1;
                end
            elseif behavior(contextbeginnings+i-1,originalspeedcolumn)>stopthreshold && tryonce==1 
                counttimes=0;
                timestop=[];
           end
            
        end
        
        if behavioruntiltrialend(end-10,9)==1 || behavioruntiltrialend(end-10,10)==1
               rewardbeginnings=[find(behavioruntiltrialend(:,9)==0,1,'last')+1 find(behavioruntiltrialend(:,10)==0,1,'last')+1];
               rewardbeginnings=min(rewardbeginnings);
                    rewardtrial=1;
        end
        
%         if behavioruntiltrialend(end-10,9)==0 && behavioruntiltrialend(end-10,10)==0 && behavior(lastposition,timecolumn)-behavior(contextbeginnings,timecolumn)>5
%             hello   
%             rewardbeginnings=[find(behavioruntiltrialend(:,9)==0,1,'last')+1 find(behavioruntiltrialend(:,10)==0,1,'last')+1];
%                rewardbeginnings=min(rewardbeginnings);
%                     rewardtrial=1;
%         end
           
           if passiveday==1
%               hello
% if ii>=6
%                rewardbeginnings=find(behavior(:,timecolumn)<=behavior(lastposition,timecolumn)-2,1,'last')+1;
% else
%                rewardbeginnings=find(behavior(:,timecolumn)<=behavior(lastposition,timecolumn)-2,1,'last')+1;
% end
               rewardbeginnings=[find(behavioruntiltrialend(:,9)==0,1,'last')+1 find(behavioruntiltrialend(:,10)==0,1,'last')+1];
               rewardbeginnings=find(behavior(:,timecolumn)<=behavior(lastposition,timecolumn)-3,1,'last')+1;
%                hello
               rewardbeginnings=min(rewardbeginnings);
                    rewardtrial=1;
                    rewardending=numel(behavioruntiltrialend(:,timecolumn));
                    nextcontext=find(behavior(rewardending+1:numel(behavior(:,1)),xcolumn)~=contextx,1,'first');
                    nextcontext=nextcontext+rewardending+1;
                    behaviorfromcontexttocontext=behavior(contextbeginnings+1:nextcontext,:);
                    timestop=behavior(rewardbeginnings,timecolumn)
                    stopposition=rewardbeginnings;
                     rewardcounter=rewardcounter+1;
           end 
    end
    

    %%%%-------------------------------------------------------------%%%%
    %%%%------------ONLY count nulls, context, and reward after 1st reward----------------%%%%
    %%%%-------------------------------------------------------------%%%%
    
    
    %%%%%%% is trial missed? did mouse not stop? did mouse stop?
    contexttrial=0;
    if startcounting==1 && trial(10,xcolumn)==0 %&& behavior(contextbeginnings+24,speedcolumn)<1.5 %&& mean(behavior(contextbeginnings:rewardbeginnings,lickcolumn))>6
        
        if trial(end,visualcolumn)==1 && rewardtrial==0 && trial(end,trialtypes)==0
            counthabcontextnoreward=counthabcontextnoreward+1;
        elseif trial(end,visualcolumn)==1 && rewardtrial==1 && trial(end,trialtypes)==0
            rewardtrial=1;
            counthabcontextreward=counthabcontextreward+1;
            posofnextcontext=find(behavioraftertrialend(:,visualcolumn)>0,1,'first');
            
%             if ~isempty(posofnextcontext)
%                 timetonextcontext(counthabcontextreward,1)=behavioraftertrialend(posofnextcontext,timecolumn)-behavioraftertrialend(1,timecolumn);
%                 timetonextcontext(counthabcontextreward,2:4)=[water sugar acid];
%                 speedtonextcontext(counthabcontextreward,1)=mean(behavioraftertrialend(1:posofnextcontext,speedcolumn));
%             end
            
        elseif any(trial(:,visualcolumn))==1 && rewardtrial==0 && trial(end,trialtypes)==2
            contexttrial=1;
            countc2norewardcompile=countc2norewardcompile+1;
            countc2noreward=countc2noreward+1;
            countcontext2compile=countcontext2compile+1;
            countcontext=countcontext+1;
            countcontextcompile=countcontextcompile+1;
            countc2compile=countc2compile+1;
            countc2=countc2+1;
        elseif any(trial(:,visualcolumn))==1 && rewardtrial==1 && trial(end,trialtypes)==2
            contexttrial=1;
            countc2rewardcompile=countc2rewardcompile+1;
            countc2reward=countc2reward+1;
            countcontext2compile=countcontext2compile+1;
            countcontextcompile=countcontextcompile+1;
            countcontext=countcontext+1;
            countc2compile=countc2compile+1;
            countc2=countc2+1;
            posofnextcontext=find(behavioraftertrialend(:,xcolumn)>0,1,'first');
            posofnextstop=find(behavioraftertrialend(:,watercolumn)>0,1,'first');
            
%             if ~isempty(posofnextcontext) && ~isempty(posofnextstop)
%             timetonextstop(countc2rewardcompile,2)=behavioraftertrialend(posofnextstop,timecolumn)-behavioraftertrialend(1,timecolumn);
%             timetonextcontext(countc2rewardcompile,2)=behavioraftertrialend(posofnextcontext,timecolumn)-behavioraftertrialend(1,timecolumn);
%             speedtonextcontext(countc2rewardcompile,2)=mean(behavioraftertrialend(1:posofnextcontext,speedcolumn));
%             end
            
        elseif any(trial(:,visualcolumn))==1 && rewardtrial==0 && trial(end,trialtypes)==1
            contexttrial=1;
            countc1norewardcompile=countc1norewardcompile+1;
            countc1noreward=countc1noreward+1;
            countcontext1compile=countcontext1compile+1;
            countcontextcompile=countcontextcompile+1;
            countcontext=countcontext+1;
            countc1compile=countc1compile+1;
            countc1=countc1+1;
        elseif any(trial(:,visualcolumn))==1 && rewardtrial==1 && trial(end,trialtypes)==1
            contexttrial=1;
            countc1rewardcompile=countc1rewardcompile+1;
            countc1reward=countc1reward+1;
            countcontext1compile=countcontext1compile+1;
            countcontextcompile=countcontextcompile+1;
            countcontext=countcontext+1;
            countc1compile=countc1compile+1;
            countc1=countc1+1;
            posofnextcontext=find(behavioraftertrialend(:,xcolumn)>0,1,'first');
            posofnextstop=find(behavioraftertrialend(:,watercolumn)>0,1,'first');
%             if ~isempty(posofnextcontext) && ~isempty(posofnextstop)
%             timetonextstop(countc1rewardcompile,1)=behavioraftertrialend(posofnextstop,timecolumn)-behavioraftertrialend(1,timecolumn);
%             timetonextcontext(countc1rewardcompile,1)=behavioraftertrialend(posofnextcontext,timecolumn)-behavioraftertrialend(1,timecolumn);
%             speedtonextcontext(countc1rewardcompile,1)=mean(behavioraftertrialend(1:posofnextcontext,speedcolumn));
%             end
        end
        if trial(end,xcolumn)==0 && any(trial(:,speedcolumn)>1)
            trial_missed_null=trial_missed_null+1;
            countnullmissed=countnullmissed+1;
            previousnullmissed=1;
        end
    end
    

    %%%%-------------------------------------------------------------%%%%
    %%%%------------ONLY make arrays for each trial after 1st reward----------------%%%%
    %%%%-------------------------------------------------------------%%%%
    
   if startcounting==1 && trial(10,xcolumn)==0 %&& behavior(contextbeginnings+24,speedcolumn)<1.5 %&& mean(behavior(contextbeginnings:rewardbeginnings,lickcolumn))>6
       
        
        if any(trial(:,visualcolumn))==1 
            
            positionforcontext3s=find(behavior(:,timecolumn)>=behavior(contextbeginnings,timecolumn)+3,1,'first');
            
            pupil=behavior(contextbeginnings:lastposition,pupilcolumn);
            speed=behavior(contextbeginnings:lastposition,speedcolumn);
            lick=behavior(contextbeginnings:lastposition,lickcolumn);   
                    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%get context behavior%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if any(trial(:,visualcolumn))==1 && trial(end-10,trialtypes)==1
            
        C1starttime(countc1compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C1startlick(countc1compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C1startspeed(countc1compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C1startpupil(countc1compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        
        
        prevcontext=find(behavior(:,14)==v-1,1,'last');
        
        if numel(behavior(:,1))>contextbeginnings+259 %&& behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,9)==1
%             hello
            countc1compilelong=countc1compilelong+1;
        C1startspeedlong(countc1compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,originalspeedcolumn);
        C1startengagelong(countc1compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,engagementcolumn);
        C1startlicklong(countc1compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,lickcolumn);
        C1starttimelong(countc1compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,timecolumn)-behavior(contextbeginnings,timecolumn);
        end
        
        context3=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn)+3,1,'first');
        contextendanti=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn),1,'first');
        context12speedcompile(countcontext1compile,1)=mean(behavior(contextendanti:context3,speedcolumn));
%         context12speed(countc1,1)=mean(behavior(contextendanti:context3,speedcolumn));
        context12speedorigcontext(countc1,1)=mean(behavior(contextbeginnings:context3,originalspeedcolumn));
        context12speed(countc1,1)=mean(behavior(contextbeginnings:lastposition,speedcolumn));
        context12speedorigall(countc1,1)=mean(behavior(contextbeginnings:lastposition,originalspeedcolumn));
        context12timetoreward(countcontext1compile,1)=behavior(lastposition,timecolumn)-behavior(contextbeginnings,timecolumn);
        
        
        
        positionforcontext3s=find(behavior(:,timecolumn)>=behavior(contextbeginnings,timecolumn)+3,1,'first');
        contextpupilchangecompile(countcontext1compile,1)=behavior(positionforcontext3s,pupilcolumn)-behavior(contextbeginnings,pupilcolumn);
        
        context12lick(countcontext,1)=sum(behavior(contextendanti:context3,18))/(behavior(context3,1)-behavior(contextendanti,1));
%         hello
        context12antilickcompile(countcontext1compile,1)=behavior(context3,19); %sum(behavior(contextendanti:context3,18))/(behavior(context3,1)-behavior(contextendanti,1));
       

            cc=corrcoef(pupil,speed, 'rows','complete');
%             pupilspeedcorrelationscompile(countcontext1compile,1)=cc(1,2);
            cc=corrcoef(pupil,lick, 'rows','complete');
%             pupillickcorrelationscompile(countcontext1compile,1)=cc(1,2);
            
            
        prevcontext=find(behavior(:,14)==v-1,1,'first');
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+1;
        
        prevcontext=find(behavior(:,14)==v-1,1,'last');
        
        
        contextendantinext=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn)+1,1,'first');
        
        if behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,9)==1
            context12nextlick(countc1,1)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
            context12nextlickcompile(countcontext1compile,1)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
            context12nextspeed(countc1,1)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
            context12nextspeedcompile(countcontext1compile,1)=mean(behavior(context3:context3,speedcolumn));
            
        elseif behavior(prevcontext,trialtypes)==2 && behavior(prevcontext,10)==1
            context12nextlick(countc1,3)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
            context12nextlickcompile(countcontext1compile,3)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1))
            context12nextspeed(countc1,3)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
            context12nextspeedcompile(countcontext1compile,3)=mean(behavior(context3:context3,speedcolumn));
        end
        
                if behavior(prevcontext,trialtypes)==1 %&& behavior(prevcontext,9)==1
%             context12nextlick(countc1,1)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
%             context12nextlickcompile(countcontext1compile,1)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
            context12nextallspeed(countc1,1)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
%             context12nextspeedcompile(countcontext1compile,1)=mean(behavior(context3:context3,speedcolumn));
            
        elseif behavior(prevcontext,trialtypes)==2 %&& behavior(prevcontext,10)==1
%             context12nextlick(countc1,3)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(contextendantinext,1));
%             context12nextlickcompile(countcontext1compile,3)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1))
            context12nextallspeed(countc1,3)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
%             context12nextspeedcompile(countcontext1compile,3)=mean(behavior(context3:context3,speedcolumn));
                end
        
                
        % stop
        newlastposition=find(behavior(lastposition+1:end,3)>=20,1,'first')+lastposition;
        timetonextcontextcompile(countcontext1compile,1)=behavior(nextcontext,timecolumn)-behavior(newlastposition,timecolumn);
        speedtonextcontextcompile(countcontext1compile,1)=mean(behavior(newlastposition:nextcontext,speedcolumn));
        timetonextcontext(countc1,1)=behavior(nextcontext,timecolumn)-behavior(newlastposition,timecolumn);
        speedtonextcontext(countc1,1)=mean(behavior(newlastposition:nextcontext,speedcolumn));


        if any(behavior(:,3)==0)
            adjlastposition=find(behavior(1:nextcontext,3)==0,1,'last');
        timetonextcontext(countc1,1)=behavior(nextcontext,timecolumn)-behavior(adjlastposition,timecolumn);
        end
%         hello
        
        %%%%%%%%%Check if this reward was after 1R, 1F, or 2F%%%%%%%%%%%%%%
        lasttrialtype=behavior(find(behavior(:,trialcolumn)==v-1,1,'last')-2,trialtypes);
        lastlasttrialtype=behavior(find(behavior(:,trialcolumn)==v-2,1,'last')-2,trialtypes);
        
        if lasttrialtype==1 && lastlasttrialtype==2
            context211=context211+1;
            context211time(context211,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context211lick(context211,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context211speed(context211,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context211pupil(context211,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        elseif lasttrialtype==2 && lastlasttrialtype==1
            context121=context121+1;
            context121time(context121,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context121lick(context121,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context121speed(context121,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context121pupil(context121,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        elseif lasttrialtype==2 && lastlasttrialtype==2
            context221=context221+1;
            context221time(context221,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context221lick(context221,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context221speed(context221,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context221pupil(context221,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
        if lasttrialtype==1
            context11=context11+1;
            context11time(context11,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context11licktrace(context11,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context11speedtrace(context11,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context11pupil(context11,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
       if lasttrialtype==2
            context21=context21+1;
            context21time(context21,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context21licktrace(context21,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context21speedtrace(context21,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context21pupil(context21,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
        
        elseif any(trial(:,visualcolumn))==1 && trial(end-10,trialtypes)==2
            
        C2starttime(countc2compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C2startlick(countc2compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C2startspeed(countc2compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C2startpupil(countc2compile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        
        
        nextcontext=find(behavior(:,14)==v+1,1,'first');
        prevcontext=find(behavior(:,14)==v-1,1,'last');
        
        if numel(behavior(:,1))>contextbeginnings+259 %&& behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,9)==1 %&& rewardtrial==0
            countc2compilelong=countc2compilelong+1;
        C2startspeedlong(countc2compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,originalspeedcolumn);
        C2startengagelong(countc2compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,engagementcolumn);
        C2startlicklong(countc2compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,lickcolumn);
        C2starttimelong(countc2compilelong,1:300)=behavior(contextbeginnings-40:contextbeginnings+259,timecolumn)-behavior(contextbeginnings,timecolumn);
        
        if behavior(nextcontext,trialtypes)==2 && rewardtrial==0
            countc2c2=countc2c2+1;
        C2C2startspeedlong(countc2c2,1:250)=behavior(contextbeginnings-40:contextbeginnings+209,originalspeedcolumn);
        C2C2startengagelong(countc2c2,1:250)=behavior(contextbeginnings-40:contextbeginnings+209,engagementcolumn);
        C2C2startlicklong(countc2c2,1:250)=behavior(contextbeginnings-40:contextbeginnings+209,lickcolumn);
        C2C2starttimelong(countc2c2,1:250)=behavior(contextbeginnings-40:contextbeginnings+209,timecolumn)-behavior(contextbeginnings,timecolumn);
        end
        end
        
        context3=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn)+3,1,'first');
        contextendanti=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn),1,'first');
        context12speedcompile(countcontext2compile,2)=mean(behavior(contextendanti:context3,speedcolumn));
%         context12speed(countc2,2)=mean(behavior(contextendanti:context3,speedcolumn));
        context12speedorigcontext(countc2,2)=mean(behavior(contextbeginnings:context3,originalspeedcolumn));
        context12speed(countc2,2)=mean(behavior(contextbeginnings:lastposition,speedcolumn));
        context12speedorigall(countc2,2)=mean(behavior(contextbeginnings:lastposition,originalspeedcolumn));
        context12timetoreward(countcontext2compile,2)=behavior(lastposition,timecolumn)-behavior(contextbeginnings,timecolumn);
        
        
        
        context12lick(countcontext,2)=sum(behavior(contextendanti:context3,18))/(behavior(context3,1)-behavior(contextendanti,1));
        context12antilickcompile(countcontext2compile,2)= behavior(context3,19);%sum(behavior(contextendanti:context3,18))/(behavior(context3,1)-behavior(contextendanti,1));
        
        contextpupilchangecompile(countcontext2compile,2)=behavior(positionforcontext3s,pupilcolumn)-behavior(contextbeginnings,pupilcolumn);
            
        cc=corrcoef(pupil,speed, 'rows','complete');
%         pupilspeedcorrelationscompile(countcontext2compile,2)=cc(1,2);
        cc=corrcoef(pupil,lick, 'rows','complete');
%         pupillickcorrelationscompile(countcontext2compile,2)=cc(1,2);
            

%%%GET prev Context behavior
        prevcontext=find(behavior(:,14)==v-1,1,'first');
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+1;
        prevcontext=find(behavior(:,14)==v-1,1,'last');
        
        contextendantinext=find(behavior(:,timecolumn)>behavior(contextbeginnings,timecolumn)+1,1,'first');
        if behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,9)==1
            context12nextlick(countc2,2)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextlickcompile(countcontext2compile,2)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextspeed(countc2,2)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
            context12nextspeedcompile(countcontext2compile,2)=mean(behavior(context3:context3,speedcolumn));
        elseif behavior(prevcontext,trialtypes)==2 && behavior(prevcontext,10)==1
            context12nextlick(countc2,4)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextlickcompile(countcontext2compile,4)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextspeed(countc2,4)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
            context12nextspeedcompile(countcontext2compile,4)=mean(behavior(context3:context3,speedcolumn));
        end
        
                if behavior(prevcontext,trialtypes)==1 %&& behavior(prevcontext,9)==1
%             context12nextlick(countc2,2)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(context3,1));
%             context12nextlickcompile(countcontext2compile,2)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextallspeed(countc2,2)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
%             context12nextspeedcompile(countcontext2compile,2)=mean(behavior(context3:context3,speedcolumn));
        elseif behavior(prevcontext,trialtypes)==2 %&& behavior(prevcontext,10)==1
%             context12nextlick(countc2,4)=sum(behavior(contextendantinext:context3,18))/(behavior(context3,1)-behavior(context3,1));
%             context12nextlickcompile(countcontext2compile,4)=sum(behavior(context3:context3,18))/(behavior(context3,1)-behavior(context3,1));
            context12nextallspeed(countc2,4)=mean(behavior(contextendantinext:context3,originalspeedcolumn));
%             context12nextspeedcompile(countcontext2compile,4)=mean(behavior(context3:context3,speedcolumn));
                end
        
                
        
        
        newlastposition=find(behavior(lastposition+1:end,3)>=20,1,'first')+lastposition;
        timetonextcontextcompile(countcontext2compile,2)=behavior(nextcontext,timecolumn)-behavior(newlastposition,timecolumn);
        speedtonextcontextcompile(countcontext2compile,2)=mean(behavior(newlastposition:nextcontext,speedcolumn));
        timetonextcontext(countc2,2)=behavior(nextcontext,timecolumn)-behavior(newlastposition,timecolumn);
        speedtonextcontext(countc2,2)=mean(behavior(newlastposition:nextcontext,speedcolumn));

        if any(behavior(:,3)==0)
        adjlastposition=find(behavior(1:nextcontext,3)==0,1,'last');
        timetonextcontext(countc2,2)=behavior(nextcontext,timecolumn)-behavior(adjlastposition,timecolumn);
        end
        
        
        lasttrialtype=behavior(find(behavior(:,trialcolumn)==v-1,1,'last')-2,trialtypes);
        lastlasttrialtype=behavior(find(behavior(:,trialcolumn)==v-2,1,'last')-2,trialtypes);
        if lasttrialtype==2 && lastlasttrialtype==1
            context122=context122+1;
            context122time(context122,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context122lick(context122,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context122speed(context122,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context122pupil(context122,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        elseif lasttrialtype==1 && lastlasttrialtype==2
            context212=context212+1;
            context212time(context212,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context212lick(context212,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context212speed(context212,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context212pupil(context212,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        elseif lasttrialtype==1 && lastlasttrialtype==1
            context112=context112+1;
            context112time(context112,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context112lick(context112,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context112speed(context112,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context112pupil(context112,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
        if lasttrialtype==1
            context12=context12+1;
            context12time(context12,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context12licktrace(context12,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context12speedtrace(context12,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context12pupil(context12,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
       if lasttrialtype==2
            context22=context22+1;
            context22time(context22,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
            context22licktrace(context22,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
            context22speedtrace(context22,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
            context22pupil(context22,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        end
        
        
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%counting rewards%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if rewardtrial==1 
            countrewardcontext=countrewardcontext+1;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%counting Context 1 (Training)%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==1 
            
            cc=corrcoef(pupil,speed, 'rows','complete');
%             behavcorrcompilereward(countc1rewardcompile,1)=cc(1,2);
            cc=corrcoef(pupil,lick, 'rows','complete');
%             behavcorrcompilereward(countc1rewardcompile,1)=cc(1,2);
            
        C1startrewtime(countc1rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C1startrewlick(countc1rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C1startrewspeed(countc1rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C1startrewpupil(countc1rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
            
        C1rewardtime(countc1rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,timecolumn)-behavior(rewardbeginnings,timecolumn);
        C1rewardlick(countc1rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,lickcolumn);
        C1rewardspeed(countc1rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,speedcolumn);
        C1rewardpupil(countc1rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,pupilcolumn);
        
        if numel(behavior(:,1))>rewardbeginnings+259 %&& behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,watercolumn)==1
%             hello
            countc1rewcompilelong=countc1rewcompilelong+1;
        C1rewardspeedlong(countc1rewcompilelong,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,originalspeedcolumn);
        C1rewardengagelong(countc1rewcompilelong,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,engagementcolumn);
        C1rewardlicklong(countc1rewcompilelong,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,lickcolumn);
        C1rewardtimelong(countc1rewcompilelong,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,timecolumn)-behavior(rewardbeginnings,timecolumn);
        end
        
        C1rewardon(countc1rewardcompile,1:100)=behavior(rewardbeginnings-75:rewardbeginnings+24,watercolumn);
        
        positionforanti=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)-1.5,1,'first');
        positionforantipupil=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)-0.5,1,'first');
        positionforpost1=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)+1,1,'first');
        positionforpost2=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)+1.5,1,'first');
        
        positionforpost1con=find(behavior(:,timecolumn)>=behavior(contextbeginnings,timecolumn)+1.5,1,'first');
        context12timetoreward(countcontext1compile,1)=behavior(rewardbeginnings,timecolumn)-behavior(contextbeginnings,timecolumn);
        if ~isempty(timestop)
        context12timeofstop(countcontext1compile,1)=behavior(rewardbeginnings,timecolumn)-timestop(1);
        end
        context12rewlick(countcontext,1)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12rewspeed(countcontext,1)=mean(behavior(rewardbeginnings:lastposition,originalspeedcolumn));
        context12contexttime(countcontext,1)=behavior(rewardbeginnings,timecolumn)-behavior(contextbeginnings,timecolumn);
        context12rewtime(countcontext,1)=behavior(lastposition,timecolumn)-behavior(rewardbeginnings,timecolumn);
        context12afterlick(countcontext,1)=mean(behavior(lastposition:lastposition+60,lickcolumn));
        context12afterspeed(countcontext,1)=mean(behavior(lastposition:lastposition+60,speedcolumn));
        
           
        context12antilick(countcontext,1)=behavior(rewardbeginnings,19);
        
        context12speedcompile(countcontext1compile,1)=mean(behavior(positionforanti:rewardbeginnings,speedcolumn));
        context12rewspeedcompile(countcontext1compile,1)=mean(behavior(rewardbeginnings:lastposition,originalspeedcolumn));
        context12rewlickcompile(countcontext1compile,1)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12rewpupilchangecompile(countcontext1compile,1)=mean(behavior(positionforpost1:positionforpost2,pupilcolumn))-mean(behavior(positionforantipupil:rewardbeginnings,pupilcolumn));
        context12rewpupilchange(countcontext,1)=mean(behavior(positionforpost1:positionforpost2,pupilcolumn))-mean(behavior(positionforantipupil:rewardbeginnings,pupilcolumn));
        
        %context12rewpupilchangecompile(countcontext1compile,1)=behavior(positionforpost1,pupilcolumn)-behavior(rewardbeginnings,pupilcolumn);
        context12rewpupilchange3compile(countcontext1compile,1)=behavior(lastposition,pupilcolumn)-behavior(rewardbeginnings,pupilcolumn);
        context12rewspeedchangecompile(countcontext1compile,1)=behavior(positionforpost1,speedcolumn)-behavior(rewardbeginnings,speedcolumn);
        
        behaviorfromrewardtoend=behavior(rewardbeginnings:numel(behavior(:,1)),:);
        
%%%%%%%%%%%%%% ENGAGEMENT %%%%%%%%%%%%%%
countposition=0;
time=[];
firsttime=1;
behaviorfromrewardtocontext=behavior(rewardbeginnings:nextcontext,:);
for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
        countposition=countposition+1;
        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
            if time(end)-time(1)>=1 && firsttime==1
                firsttime=0;
                positiontoengage1=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first');
                positiontoengage1=positiontoengage1+rewardbeginnings-1;
                timetosubtractfrom=behavior(rewardbeginnings,timecolumn);
            end
    else
    countposition=0;
    time=[];
    end
end


%just to grab the engagement prior to next context entry
positiontoengage=find(behavior(1:nextcontext,originalspeedcolumn)<1,1,'last');
timetosubtractfrom=behavior(rewardbeginnings,timecolumn);

%find any small bumps in speed prior to full engagement

starthere=find(behavior(rewardbeginnings:nextcontext,watercolumn)==0,1,'first');
starthere=starthere+rewardbeginnings-1;
starthere=rewardbeginnings;
% starthere=lastposition;
behaviorfromlasttoengage=behavior(starthere:positiontoengage,:);
backtoone=0;
takethispos=1;
for i=1:numel(behaviorfromlasttoengage(:,1))
    
    if behaviorfromlasttoengage(i,timecolumn)-behaviorfromlasttoengage(1,timecolumn)<1 && behaviorfromlasttoengage(i,originalspeedcolumn)<1
        backtoone=1;
    end
    
    if behaviorfromlasttoengage(i,originalspeedcolumn)>1 && backtoone==1
        if behaviorfromlasttoengage(end,timecolumn)-behaviorfromlasttoengage(i,timecolumn)>=1
        mini1=mini1+1;
        miniengageposition1(mini1)=i-2+starthere;
        backtoone=0;
        takethispos=i;
        
        mini1compile=mini1compile+1;
        C1minispeed(mini1compile,1:150)=behavior(miniengageposition1(mini1)-75:miniengageposition1(mini1)+74,speedcolumn);
        C1minilick(mini1compile,1:150)=behavior(miniengageposition1(mini1)-75:miniengageposition1(mini1)+74,lickcolumn);
        C1minipupil(mini1compile,1:150)=behavior(miniengageposition1(mini1)-75:miniengageposition1(mini1)+74,pupilcolumn);
        C1minitime(mini1compile,1:150)=behavior(miniengageposition1(mini1)-75:miniengageposition1(mini1)+74,timecolumn)-behavior(miniengageposition1(mini1),timecolumn);
        C1minitimes(mini1compile)=behavior(miniengageposition1(mini1),timecolumn)-behavior(starthere,timecolumn);

        endengagetime=behaviorfromlasttoengage(find(behaviorfromlasttoengage(i:end,originalspeedcolumn)<1,1,'first')+i-1,timecolumn);
        minitimes1(mini1compile)=endengagetime-behaviorfromlasttoengage(i,timecolumn);
        
        end
    elseif behaviorfromlasttoengage(i,originalspeedcolumn)<1 && backtoone==0 && behaviorfromlasttoengage(i,timecolumn)-behaviorfromlasttoengage(takethispos,timecolumn)>=1
        backtoone=1;
    end
end



timetolickless=find(behavior(lastposition:nextcontext,lickcolumn)<5,1,'first');
if ~isempty(timetolickless)
timetolickless=timetolickless+lastposition;
lickless1=lickless1+1;
        C1lesslickspeed(lickless1,1:150)=behavior(timetolickless-75:timetolickless+74,speedcolumn);
        C1lesslicklick(lickless1,1:150)=behavior(timetolickless-75:timetolickless+74,lickcolumn);
        C1lesslickpupil(lickless1,1:150)=behavior(timetolickless-75:timetolickless+74,pupilcolumn);
        C1lesslicktime(lickless1,1:150)=behavior(timetolickless-75:timetolickless+74,timecolumn)-behavior(timetolickless,timecolumn);
        C1lesslicktimes(lickless1,1)=behavior(timetolickless,timecolumn)-behavior(lastposition,timecolumn);
        C1lesslicktimes(lickless1,2)=behavior(nextcontext,timecolumn)-behavior(timetolickless,timecolumn);
        C1lesslicktimes(lickless1,3)=ii;
end



if passiveday==1
    countposition=0;
time=[];
firsttime=1;
positiontoengage=[];
behaviorfromrewardtocontext=behavior(rewardbeginnings:nextcontext,:);
for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
        countposition=countposition+1;
        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
            if time(end)-time(1)>=1 && firsttime==1
                firsttime=0;
                positiontoengage=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first');
                positiontoengage=positiontoengage+rewardbeginnings-1;
                timetosubtractfrom=behavior(rewardbeginnings,timecolumn);
            end
    else
    countposition=0;
    time=[];
    end
end

end
        
    %%%%%%%%%%%%%%%%%%%%%%%
        
        behaviorfromengagetoend=behavior(positiontoengage:numel(behavior(:,1)),:);
        
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+1;
        if previousreward==1 && ~isempty(positiontoengage)
        end
        
        timetonextcontextrew(countc1,1)=behavior(nextcontext,timecolumn)-behavior(lastposition,timecolumn);
        timetonextcontextrewcompile(countcontext1compile,1)=behavior(nextcontext,timecolumn)-behavior(lastposition,timecolumn);
        
        if previousreward==1 && ~isempty(positiontoengage)
%             timetonextcontext12rewardfear(countcontext1compile,1)=behavior(positiontoengage1,timecolumn)-behavior(rewardbeginnings,timecolumn);
        elseif previousreward==2 && ~isempty(positiontoengage)
%             timetonextcontext12rewardfear(countcontext1compile,2)=behavior(positiontoengage1,timecolumn)-behavior(rewardbeginnings,timecolumn);
        end
        
        
        if ~isempty(positiontoengage) %&& behavior(positiontoengage,timecolumn)<behavior(nextcontext,timecolumn) && positiontoengage>=contextbeginnings %&& behavior(positiontoengage,timecolumn)>behavior(lastposition,timecolumn)
        countc1engagecompile=countc1engagecompile+1;
        positionforengagepre=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)-1,1,'first');
        
        context12engagepupilcompile(countcontext1compile,1)=behavior(positiontoengage,pupilcolumn)-behavior(positionforengagepre,pupilcolumn);

        
        C1engagetime(countc1engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,timecolumn)-behavior(positiontoengage,timecolumn);
        C1engagelick(countc1engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,lickcolumn);
        C1engagespeed(countc1engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,originalspeedcolumn);
        C1engagepupil(countc1engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,pupilcolumn);  
        
        
        
        nextcontextpre=find(behavior(:,timecolumn)>=behavior(nextcontext,timecolumn)-1,1,'first');
        
        if behavior(nextcontext,trialtypes)==1 && numel(behavior(:,1))>=nextcontext+74
            
        next11=next11+1;
        C1stoptime(next11,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C1stoplick(next11,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C1stopspeed(next11,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C1stoppupil(next11,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        
        elseif behavior(nextcontext,trialtypes)==2 && numel(behavior(:,1))>=nextcontext+74
            
        next12=next12+1;
        C1stoptime2(next12,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C1stoplick2(next12,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C1stopspeed2(next12,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C1stoppupil2(next12,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        
        end
        
        
        
        
            engagepre1s=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)-1,1,'first');
            engagepost1s=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)+1,1,'first');
            
            pupilpost=behavior(positiontoengage:engagepost1s,pupilcolumn);
            speedpost=behavior(positiontoengage:engagepost1s,speedcolumn);
            lickpost=behavior(positiontoengage:engagepost1s,lickcolumn);
            
            
            pupilpre=behavior(engagepre1s,pupilcolumn);
            speedpre=behavior(engagepre1s,speedcolumn);
            lickpre=behavior(engagepre1s,lickcolumn);
            
            pupilspeedlickpre(countcontextcompile,1:3)=[nanmean(pupilpost)-nanmean(pupilpre) nanmean(speedpost)-nanmean(speedpre) nanmean(lickpost)-nanmean(lickpre)];

%             if pupilspeedlickpre(countcontextcompile,1)>2 && pupilspeedlickpre(countcontextcompile,2)<1
%                 hello
%             end
        end

        positiontodisengage=find(behaviorfromengagetoend(:,speedcolumn)<2,1,'first');

        positiontodisengage=positiontodisengage+positiontoengage-1;
        
        if ~isempty(positiontoengage) && behavior(positiontodisengage,visualcolumn)==0 && numel(behavior(:,1))>=positiontoengage+49
            countcontext1engagefail=countcontext1engagefail+1;
        C1disengagestartfailspeed(countcontext1engagefail,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,speedcolumn);
        C1disengagestartfaillick(countcontext1engagefail,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,lickcolumn);

        elseif ~isempty(positiontoengage) && behavior(positiontodisengage,visualcolumn)==1 && numel(behavior(:,1))>=positiontoengage+49
            countcontext1engagewin=countcontext1engagewin+1;
        C1disengagestartwinspeed(countcontext1engagewin,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,speedcolumn);
        C1disengagestartwinlick(countcontext1engagewin,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,lickcolumn);

        end
        

        if ~isempty(positiontoengage)
        timetoengage(countrewardcontext,2)=behavior(positiontoengage,timecolumn)-behavior(lastposition,timecolumn);
        timeinengage(countrewardcontext,2)=behavior(positiontodisengage,timecolumn)-behavior(positiontoengage,timecolumn);
        distanceinengage(countrewardcontext,2)=behavior(positiontodisengage-1,ycolumn)-behavior(positiontoengage,ycolumn);
        context12engagetime(countc1rewardcompile,1)=behavior(positiontoengage,timecolumn)-behavior(lastposition,timecolumn);
        
        context12engagetimecompile(countc1rewardcompile,1)=behavior(positiontoengage,timecolumn)-timetosubtractfrom;
        speedinengage(countrewardcontext,1)=mean(behavior(positiontoengage:engagepost1s,originalspeedcolumn))-mean(behavior(engagepre1s:positiontoengage,originalspeedcolumn));
        speedinengagecompile(countc1rewardcompile,1)=mean(behavior(positiontoengage:engagepost1s,originalspeedcolumn))-mean(behavior(engagepre1s:positiontoengage,originalspeedcolumn));
        
        context12engagespeedcompile(countc1rewardcompile,1)=mean(behavior(positiontoengage:engagepost1s,speedcolumn))-mean(behavior(engagepre1s:positiontoengage,speedcolumn));
        context12engagelickcompile(countc1rewardcompile,1)=mean(behavior(engagepre1s:positiontoengage,lickcolumn));
        context12engagelickcompile(countc1rewardcompile,1)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12engagelickcompile(countc1rewardcompile,1)=mean(behavior(contextbeginnings:rewardbeginnings,lickcolumn));
        context12engagelickcompile(countc1rewardcompile,1)=mean(behavior(contextbeginnings:lastposition,lickcolumn));
  

        
        nextcontextend=find(behavior(nextcontext:end,visualcolumn)==0,1,'first');
        nextcontextend=nextcontext+nextcontextend-1;
        
        
        if isnan(context12engagespeedcompile(countc1rewardcompile,1))
            hello
        end
        
        end
         
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%counting Context 2 (Training)%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==2 
            
            cc=corrcoef(pupil,speed, 'rows','complete');
%             behavcorrcompilereward(countc2rewardcompile,2)=cc(1,2);
            cc=corrcoef(pupil,lick, 'rows','complete');
%             behavcorrcompilereward(countc2rewardcompile,2)=cc(1,2);
            
        C2startrewtime(countc2rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C2startrewlick(countc2rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C2startrewspeed(countc2rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C2startreworigspeed(countc2rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,originalspeedcolumn);
        C2startrewpupil(countc2rewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        
        C2rewardtime(countc2rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,timecolumn)-behavior(rewardbeginnings,timecolumn);
        C2rewardlick(countc2rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,lickcolumn);
        C2rewardspeed(countc2rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,speedcolumn);
        C2rewardpupil(countc2rewardcompile,1:150)=behavior(rewardbeginnings-25:rewardbeginnings+124,pupilcolumn);
        
                if numel(behavior(:,1))>rewardbeginnings+259 %&& behavior(prevcontext,trialtypes)==1 && behavior(prevcontext,watercolumn)==1
%             hello
            countc2rewardlongcompile=countc2rewardlongcompile+1;
        C2rewardspeedlong(countc2rewardlongcompile,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,originalspeedcolumn);
        C2rewardengagelong(countc2rewardlongcompile,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,engagementcolumn);
        C2rewardlicklong(countc2rewardlongcompile,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,lickcolumn);
        C2rewardtimelong(countc2rewardlongcompile,1:300)=behavior(rewardbeginnings-40:rewardbeginnings+259,timecolumn)-behavior(rewardbeginnings,timecolumn);
        end
        
        C2rewardon(countc2rewardcompile,1:100)=behavior(rewardbeginnings-75:rewardbeginnings+24,watercolumn);
        
        behaviorfromrewardtoend=behavior(rewardbeginnings:numel(behavior(:,1)),:);

        %%%%%%%%%%%%%% ENGAGEMENT %%%%%%%%%%%%%%
countposition=0;
time=[];
firsttime=1;
behaviorfromrewardtocontext=behavior(rewardbeginnings:nextcontext,:);
for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
        countposition=countposition+1;
        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
            if time(end)-time(1)>=1 && firsttime==1
                firsttime=0;
                positiontoengage1=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first');
                positiontoengage1=positiontoengage1+rewardbeginnings-1;
                timetosubtractfrom=behavior(rewardbeginnings,timecolumn);
            end
    else
    countposition=0;
    time=[];
    end
end


%just to grab the engagement prior to next context entry
positiontoengage=find(behavior(1:nextcontext,originalspeedcolumn)<1,1,'last');
timetosubtractfrom=behavior(rewardbeginnings,timecolumn);

%find any small bumps in speed prior to full engagement
starthere=find(behavior(rewardbeginnings:nextcontext,watercolumn)==0,1,'first');
starthere=starthere+rewardbeginnings-1;
starthere=rewardbeginnings;
% starthere=lastposition;
behaviorfromlasttoengage=behavior(starthere:positiontoengage,:);
backtoone=0;
takethispos=1;
for i=1:numel(behaviorfromlasttoengage(:,1))
    
    if behaviorfromlasttoengage(i,timecolumn)-behaviorfromlasttoengage(1,timecolumn)<1 && behaviorfromlasttoengage(i,originalspeedcolumn)<1
        backtoone=1;
    end
    
    if behaviorfromlasttoengage(i,originalspeedcolumn)>1 && backtoone==1
        if behaviorfromlasttoengage(end,timecolumn)-behaviorfromlasttoengage(i,timecolumn)>=1
        mini2=mini2+1;
        miniengageposition2(mini2)=i-2+starthere;
        backtoone=0;
        takethispos=i;
        
        mini2compile=mini2compile+1;
        C2minispeed(mini2compile,1:150)=behavior(miniengageposition2(mini2)-75:miniengageposition2(mini2)+74,speedcolumn);
        C2minilick(mini2compile,1:150)=behavior(miniengageposition2(mini2)-75:miniengageposition2(mini2)+74,lickcolumn);
        C2minipupil(mini2compile,1:150)=behavior(miniengageposition2(mini2)-75:miniengageposition2(mini2)+74,pupilcolumn);
        C2minitime(mini2compile,1:150)=behavior(miniengageposition2(mini2)-75:miniengageposition2(mini2)+74,timecolumn)-behavior(miniengageposition2(mini2),timecolumn);
        C2minitimes(mini2compile)=behavior(miniengageposition2(mini2),timecolumn)-behavior(starthere,timecolumn);
        
        endengagetime=behaviorfromlasttoengage(find(behaviorfromlasttoengage(i:end,originalspeedcolumn)<1,1,'first')+i-1,timecolumn);
        minitimes2(mini2compile)=endengagetime-behaviorfromlasttoengage(i,timecolumn);
        
        end
    elseif behaviorfromlasttoengage(i,originalspeedcolumn)<1 && backtoone==0 && behaviorfromlasttoengage(i,timecolumn)-behaviorfromlasttoengage(takethispos,timecolumn)>=1
        backtoone=1;
        
        
    end
end

%%%%lick less????%%%%%%%%
timetolickless=find(behavior(lastposition:nextcontext,lickcolumn)<5,1,'first');
if ~isempty(timetolickless)
timetolickless=timetolickless+lastposition;
lickless2=lickless2+1;
        C2lesslickspeed(lickless2,1:150)=behavior(timetolickless-75:timetolickless+74,speedcolumn);
        C2lesslicklick(lickless2,1:150)=behavior(timetolickless-75:timetolickless+74,lickcolumn);
        C2lesslickpupil(lickless2,1:150)=behavior(timetolickless-75:timetolickless+74,pupilcolumn);
        C2lesslicktime(lickless2,1:150)=behavior(timetolickless-75:timetolickless+74,timecolumn)-behavior(timetolickless,timecolumn);
        C2lesslicktimes(lickless2,1)=behavior(timetolickless,timecolumn)-behavior(lastposition,timecolumn);
        C2lesslicktimes(lickless2,2)=behavior(nextcontext,timecolumn)-behavior(timetolickless,timecolumn);
        C2lesslicktimes(lickless2,3)=ii;
end


if passiveday==1
    
positiontoengage=[];
    countposition=0;
time=[];
firsttime=1;
behaviorfromrewardtocontext=behavior(rewardbeginnings:nextcontext,:);
for i=1:numel(behaviorfromrewardtocontext(:,originalspeedcolumn))
    if behaviorfromrewardtocontext(i,originalspeedcolumn)>=1 
        countposition=countposition+1;
        time(countposition)=behaviorfromrewardtocontext(i,timecolumn);
            if time(end)-time(1)>=1 && firsttime==1
                firsttime=0;
                positiontoengage=find(behaviorfromrewardtocontext(:,timecolumn)>=time(1),1,'first');
                positiontoengage=positiontoengage+rewardbeginnings-1;
                timetosubtractfrom=behavior(rewardbeginnings,timecolumn);
            end
    else
    countposition=0;
    time=[];
    end
end
end
        
    %%%%%%%%%%%%%%%%%%%%%%%
        
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+2;
        
%         if ~isempty(positiontoengage)
        timetonextcontextrewcompile(countcontext2compile,2)=behavior(nextcontext,timecolumn)-behavior(lastposition,timecolumn);
        timetonextcontextrew(countc2,2)=behavior(nextcontext,timecolumn)-behavior(lastposition,timecolumn);
%         end
        
        if previousreward==1 && ~isempty(positiontoengage)
%             timetonextcontext12rewardfear(countcontext2compile,3)=behavior(positiontoengage1,timecolumn)-behavior(rewardbeginnings,timecolumn);
        elseif previousreward==2 && ~isempty(positiontoengage)
%             timetonextcontext12rewardfear(countcontext2compile,4)=behavior(positiontoengage1,timecolumn)-behavior(rewardbeginnings,timecolumn);
        end
        
        if ~isempty(positiontoengage)  && behavior(positiontoengage,timecolumn)<behavior(nextcontext,timecolumn) && positiontoengage>=contextbeginnings %&& behavior(positiontoengage,timecolumn)>behavior(lastposition,timecolumn)
        countc2engagecompile=countc2engagecompile+1;

        C2engagetime(countc2engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,timecolumn)-behavior(positiontoengage,timecolumn);
        C2engagelick(countc2engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,lickcolumn);
        C2engagespeed(countc2engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,speedcolumn);
        C2engagepupil(countc2engagecompile,1:150)=behavior(positiontoengage-75:positiontoengage+74,pupilcolumn);
        
        nextcontextpre=find(behavior(:,timecolumn)>=behavior(nextcontext,timecolumn)-1,1,'first');
        
        if behavior(nextcontext,trialtypes)==1 && numel(behavior(:,1))>=nextcontext+74
            next21=next21+1;
        C2stoptime(next21,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C2stoplick(next21,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C2stopspeed(next21,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C2stoppupil(next21,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        elseif behavior(nextcontext,trialtypes)==2 && numel(behavior(:,1))>=nextcontext+74
            next22=next22+1;
        C2stoptime2(next22,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C2stoplick2(next22,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C2stopspeed2(next22,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C2stoppupil2(next22,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        end
        
        
        
            engagepre1s=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)-1,1,'first');
            engagepost1s=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)+1,1,'first');
            
            pupilpost=behavior(positiontoengage:engagepost1s,pupilcolumn);
            speedpost=behavior(positiontoengage:engagepost1s,speedcolumn);
            lickpost=behavior(positiontoengage:engagepost1s,lickcolumn);
            
            
            pupilpre=behavior(engagepre1s,pupilcolumn);
            speedpre=behavior(engagepre1s,speedcolumn);
            lickpre=behavior(engagepre1s,lickcolumn);
            
            pupilspeedlickpre(countcontextcompile,1:3)=[nanmean(pupilpost)-nanmean(pupilpre) nanmean(speedpost)-nanmean(speedpre) nanmean(lickpost)-nanmean(lickpre)];

        end
        behaviorfromengagetoend=behavior(positiontoengage:end,:);

        positiontodisengage=find(behaviorfromengagetoend(:,speedcolumn)<2,1,'first');

        positiontodisengage=positiontodisengage+positiontoengage-1;
        
        if ~isempty(positiontodisengage) && behavior(positiontodisengage,visualcolumn)==0
        countcontext2engagefail=countcontext2engagefail+1;
        C2disengagestartfailspeed(countcontext2engagefail,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,speedcolumn);
        C2disengagestartfaillick(countcontext2engagefail,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,lickcolumn);
        elseif ~isempty(positiontodisengage) && behavior(positiontodisengage,visualcolumn)==1
        countcontext2engagewin=countcontext2engagewin+1;
        C2disengagestartwinspeed(countcontext2engagewin,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,speedcolumn);
        C2disengagestartwinlick(countcontext2engagewin,1:50)=behavior(positiontodisengage-25:positiontodisengage+24,lickcolumn);
        end

        if ~isempty(positiontoengage) 
        timetoengage(countrewardcontext,3)=behavior(positiontoengage,timecolumn)-timetosubtractfrom;
        timeinengage(countrewardcontext,3)=behavior(positiontodisengage,timecolumn)-behavior(positiontoengage,timecolumn);
        distanceinengage(countrewardcontext,3)=behavior(positiontodisengage-1,ycolumn)-behavior(positiontoengage,ycolumn);
        context12engagetime(countc2rewardcompile,2)=behavior(positiontoengage,timecolumn)-behavior(lastposition,timecolumn);
        
        context12engagetimecompile(countc2rewardcompile,2)=behavior(positiontoengage,timecolumn)-timetosubtractfrom;
        speedinengage(countrewardcontext,2)=mean(behavior(positiontoengage:engagepost1s,speedcolumn))-mean(behavior(engagepre1s:positiontoengage,speedcolumn));
        context12engagespeedcompile(countc2rewardcompile,2)=mean(behavior(positiontoengage:engagepost1s,speedcolumn))-mean(behavior(engagepre1s:positiontoengage,speedcolumn));
        context12engagelickcompile(countc2rewardcompile,2)=mean(behavior(engagepre1s:positiontoengage,lickcolumn));
        context12engagelickcompile(countc2rewardcompile,2)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12engagelickcompile(countc2rewardcompile,2)=mean(behavior(contextbeginnings:rewardbeginnings,lickcolumn));
        context12engagelickcompile(countc2rewardcompile,2)=mean(behavior(contextbeginnings:lastposition,lickcolumn));



        
        
        nextcontextend=find(behavior(nextcontext:end,visualcolumn)==0,1,'first');
        nextcontextend=nextcontext+nextcontextend-1;
        
        
        if isnan(context12engagespeedcompile(countc2rewardcompile,2))
%             hello
        end
        
        end
        
        
        positionforpost1con=find(behavior(:,timecolumn)>=behavior(contextbeginnings,timecolumn)+1.5,1,'first');
        positionforanti=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)-1.5,1,'first');
        positionforpost1=find(behavior(:,timecolumn)>=behavior(rewardbeginnings,timecolumn)+1,1,'first');
        context12timetoreward(countcontext2compile,2)=behavior(rewardbeginnings,timecolumn)-behavior(contextbeginnings,timecolumn);
        if ~isempty(timestop)
        context12timeofstop(countcontext2compile,2)=behavior(rewardbeginnings,timecolumn)-timestop(1);
        end
        
        context12antilick(countcontext,2)=behavior(rewardbeginnings,19);
        
        context12rewlick(countcontext,2)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12rewspeed(countcontext,2)=mean(behavior(rewardbeginnings:lastposition,originalspeedcolumn));
        context12contexttime(countcontext,2)=behavior(rewardbeginnings,timecolumn)-behavior(contextbeginnings,timecolumn);
        context12rewtime(countcontext,2)=behavior(lastposition,timecolumn)-behavior(rewardbeginnings,timecolumn);
        context12afterlick(countcontext,2)=mean(behavior(lastposition:lastposition+60,lickcolumn));
        context12afterspeed(countcontext,2)=mean(behavior(lastposition:lastposition+60,speedcolumn));
        

        context12speedcompile(countcontext2compile,2)=mean(behavior(positionforanti:rewardbeginnings,speedcolumn));
        context12rewspeedcompile(countcontext2compile,2)=mean(behavior(rewardbeginnings:lastposition,speedcolumn));
        context12rewlickcompile(countcontext2compile,2)=mean(behavior(rewardbeginnings:lastposition,lickcolumn));
        context12rewpupilchangecompile(countcontext2compile,2)=behavior(positionforpost1,pupilcolumn)-behavior(rewardbeginnings,pupilcolumn);
        context12rewpupilchange3compile(countcontext2compile,2)=behavior(lastposition,pupilcolumn)-behavior(rewardbeginnings,pupilcolumn);
        context12rewspeedchangecompile(countcontext2compile,2)=behavior(positionforpost1,speedcolumn)-behavior(rewardbeginnings,speedcolumn);
        
        if passiveday==0 && ~isempty(positiontoengage)
        positionforengagepre=find(behavior(:,timecolumn)>=behavior(positiontoengage,timecolumn)-1,1,'first');
        
        context12engagepupilcompile(countcontext2compile,2)=behavior(positiontoengage,pupilcolumn)-behavior(positionforengagepre,pupilcolumn);
        end
        
        end
        
        else
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%if running out of context%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==1 
            
        C1startnotime(countc1norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C1startnolick(countc1norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C1startnospeed(countc1norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C1startnopupil(countc1norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        
        
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+2;
        
        if behavior(nextcontext,trialtypes)==1 && numel(behavior(:,1))>=nextcontext+74
            miss11=miss11+1;
        C1missC1time(miss11,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C1missC1lick(miss11,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C1missC1speed(miss11,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C1missC1pupil(miss11,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        elseif behavior(nextcontext,trialtypes)==2 && numel(behavior(:,1))>=nextcontext+74
            miss12=miss12+1;
        C1missC2time(miss12,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C1missC2lick(miss12,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C1missC2speed(miss12,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C1missC2pupil(miss12,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        end
            
        elseif any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==2
            
        C2startnotime(countc2norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,timecolumn)-behavior(contextbeginnings,timecolumn);
        C2startnolick(countc2norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,lickcolumn);
        C2startnospeed(countc2norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,speedcolumn);
        C2startnopupil(countc2norewardcompile,1:150)=behavior(contextbeginnings-75:contextbeginnings+74,pupilcolumn);
        
        nextcontext=find(behavior(lastposition+2:end,6)==1,1,'first')+lastposition+2;
        
        if behavior(nextcontext,trialtypes)==1 && numel(behavior(:,1))>=nextcontext+74
            miss21=miss21+1;
        C2missC1time(miss21,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C2missC1lick(miss21,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C2missC1speed(miss21,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C2missC1pupil(miss21,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        elseif behavior(nextcontext,trialtypes)==2 && numel(behavior(:,1))>=nextcontext+74
            miss22=miss22+1;
        C2missC2time(miss22,1:150)=behavior(nextcontext-75:nextcontext+74,timecolumn)-behavior(nextcontext,timecolumn);
        C2missC2lick(miss22,1:150)=behavior(nextcontext-75:nextcontext+74,lickcolumn);
        C2missC2speed(miss22,1:150)=behavior(nextcontext-75:nextcontext+74,speedcolumn);
        C2missC2pupil(miss22,1:150)=behavior(nextcontext-75:nextcontext+74,pupilcolumn);
        end
        
        end
   end
        end
   end
   

   
    %%%change startcounting to 1
    if any(trial(end,watercolumn:acidcolumn))==1
        
        lastrewardendtime=behavioruntiltrialend(end,timecolumn);
        lasttrialendposition=numel(behavioruntiltrialend(:,1));
        previouscontextreward=1;
        if startcounting==0 && trainingday==0
        startcounting=1;
        end

    end
    end
    
    
     if rewardtrial==1 && any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==1 
         previousreward=1;
     elseif rewardtrial==1 && any(trial(:,visualcolumn))==1 && trial(end,trialtypes)==2
         previousreward=2;
     end
    
end


countall=[trial_missed_null trial_missed trial_correct];
countall(2,:)=[countall(1,1)/sum(countall) countall(1,2)/sum(countall) countall(1,3)/sum(countall)];

% if trainingday==1
%%%Calculating DI for anti licks ALL
meanlickrate(1,1)=nanmean(context12lick(:,1));
meanlickrate(1,2)=nanmean(context12lick(:,2));
meanlickrate(isnan(meanlickrate))=0;
meanlickratepermouse(ii,1:2)=[meanlickrate(1,1)  meanlickrate(1,2)];

comparemeanlickrate=((meanlickrate(1,1)-meanlickrate(1,2))/2)+meanlickrate(1,2);

rewardfearlickno(1,1)=nansum(context12lick(:,1)>comparemeanlickrate);
rewardfearlickno(1,2)=nansum(context12lick(:,1)<comparemeanlickrate);
rewardfearlickno(1,3)=nansum(context12lick(:,2)>comparemeanlickrate);
rewardfearlickno(1,4)=nansum(context12lick(:,2)<comparemeanlickrate);


lickcorrectwrong(1,1)=nansum(rewardfearlickno(1,1) + rewardfearlickno(1,4));
lickcorrectwrong(1,2)=nansum(rewardfearlickno(1,2) + rewardfearlickno(1,3));

lickDI=(lickcorrectwrong(1,1) - lickcorrectwrong(1,2)) / (lickcorrectwrong(1,1) + lickcorrectwrong(1,2));

lickDIrewardfear(1,1)= lickDI;
lickDIrewardfear(1,2)= (rewardfearlickno(1,1))/(rewardfearlickno(1,1)+rewardfearlickno(1,2));
lickDIrewardfear(1,3)= (rewardfearlickno(1,3))/(rewardfearlickno(1,3)+rewardfearlickno(1,4));

c1lick=(rewardfearlickno(1,1)/(rewardfearlickno(1,1)+rewardfearlickno(1,2)))*100;
c2lick=(rewardfearlickno(1,3)/(rewardfearlickno(1,3)+rewardfearlickno(1,4)))*100;

c1c2lickpercent(ii,1:3)=[lickDI c1lick c2lick];
%%%%

%%%Calculating DI for anti licks NEXT from 1
meanlickrate(1,1)=nanmean(context12nextlick(:,1));
meanlickrate(1,2)=nanmean(context12nextlick(:,2));
meanlickrate(isnan(meanlickrate))=0;

comparemeanlickrate=((meanlickrate(1,1)-meanlickrate(1,2))/2)+meanlickrate(1,2);

rewardfearlickno(1,1)=nansum(context12nextlick(:,1)>comparemeanlickrate);
rewardfearlickno(1,2)=nansum(context12nextlick(:,1)<comparemeanlickrate);
rewardfearlickno(1,3)=nansum(context12nextlick(:,2)>comparemeanlickrate);
rewardfearlickno(1,4)=nansum(context12nextlick(:,2)<comparemeanlickrate);


lickcorrectwrong(1,1)=nansum(rewardfearlickno(1,1) + rewardfearlickno(1,4));
lickcorrectwrong(1,2)=nansum(rewardfearlickno(1,2) + rewardfearlickno(1,3));

lickDI=(lickcorrectwrong(1,1) - lickcorrectwrong(1,2)) / (lickcorrectwrong(1,1) + lickcorrectwrong(1,2));

lickDIrewardfear(1,1)= lickDI;
lickDIrewardfear(1,2)= (rewardfearlickno(1,1))/(rewardfearlickno(1,1)+rewardfearlickno(1,2));
lickDIrewardfear(1,3)= (rewardfearlickno(1,3))/(rewardfearlickno(1,3)+rewardfearlickno(1,4));

c1lick=(rewardfearlickno(1,1)/(rewardfearlickno(1,1)+rewardfearlickno(1,2)))*100;
c2lick=(rewardfearlickno(1,3)/(rewardfearlickno(1,3)+rewardfearlickno(1,4)))*100;

c1c2lickpercentrew1(ii,1:3)=[lickDI c1lick c2lick];
%%%%
%%%Calculating DI for anti licks NEXT from 2
meanlickrate(1,1)=nanmean(context12nextlick(:,3));
meanlickrate(1,2)=nanmean(context12nextlick(:,4));
meanlickrate(isnan(meanlickrate))=0;

comparemeanlickrate=((meanlickrate(1,1)-meanlickrate(1,2))/2)+meanlickrate(1,2);

rewardfearlickno(1,1)=nansum(context12nextlick(:,3)>comparemeanlickrate);
rewardfearlickno(1,2)=nansum(context12nextlick(:,3)<comparemeanlickrate);
rewardfearlickno(1,3)=nansum(context12nextlick(:,4)>comparemeanlickrate);
rewardfearlickno(1,4)=nansum(context12nextlick(:,4)<comparemeanlickrate);


lickcorrectwrong(1,1)=nansum(rewardfearlickno(1,1) + rewardfearlickno(1,4));
lickcorrectwrong(1,2)=nansum(rewardfearlickno(1,2) + rewardfearlickno(1,3));

lickDI=(lickcorrectwrong(1,1) - lickcorrectwrong(1,2)) / (lickcorrectwrong(1,1) + lickcorrectwrong(1,2));

lickDIrewardfear(1,1)= lickDI;
lickDIrewardfear(1,2)= (rewardfearlickno(1,1))/(rewardfearlickno(1,1)+rewardfearlickno(1,2));
lickDIrewardfear(1,3)= (rewardfearlickno(1,3))/(rewardfearlickno(1,3)+rewardfearlickno(1,4));

c1lick=(rewardfearlickno(1,1)/(rewardfearlickno(1,1)+rewardfearlickno(1,2)))*100;
c2lick=(rewardfearlickno(1,3)/(rewardfearlickno(1,3)+rewardfearlickno(1,4)))*100;

c1c2lickpercentrew2(ii,1:3)=[lickDI c1lick c2lick];
%%%%
%%%Calculating DI for speed ALL
meanspeedrate(1,1)=nanmean(context12speed(:,1));
meanspeedrate(1,2)=nanmean(context12speed(:,2));
meanspeedrate(isnan(meanlickrate))=0;

comparemeanspeedrate=((meanspeedrate(1,1)-meanspeedrate(1,2))/2)+meanspeedrate(1,2);

rewardfearspeedno(1,1)=nansum(context12speed(:,1)<comparemeanspeedrate);
rewardfearspeedno(1,2)=nansum(context12speed(:,1)>comparemeanspeedrate);
rewardfearspeedno(1,3)=nansum(context12speed(:,2)<comparemeanspeedrate);
rewardfearspeedno(1,4)=nansum(context12speed(:,2)>comparemeanspeedrate);


speedcorrectwrong(1,1)=nansum(rewardfearspeedno(1,1) + rewardfearspeedno(1,4));
speedcorrectwrong(1,2)=nansum(rewardfearspeedno(1,2) + rewardfearspeedno(1,3));

speedDI=(speedcorrectwrong(1,1) - speedcorrectwrong(1,2)) / (speedcorrectwrong(1,1) + speedcorrectwrong(1,2));

speedDIrewardfear(1,1)= speedDI;
speedDIrewardfear(1,2)= (rewardfearspeedno(1,1))/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2));
speedDIrewardfear(1,3)= (rewardfearspeedno(1,3))/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4));

c1speed=(rewardfearspeedno(1,1)/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2)))*100;
c2speed=(rewardfearspeedno(1,3)/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4)))*100;

c1c2speedpercent(ii,1:3)=[speedDI c1speed c2speed];
%%%%
%%%Calculating DI for speed NEXT 1
meanspeedrate(1,1)=nanmean(context12nextspeed(:,1));
meanspeedrate(1,2)=nanmean(context12nextspeed(:,2));
meanspeedrate(isnan(meanlickrate))=0;

comparemeanspeedrate=((meanspeedrate(1,1)-meanspeedrate(1,2))/2)+meanspeedrate(1,2);

rewardfearspeedno(1,1)=nansum(context12nextspeed(:,1)<comparemeanspeedrate);
rewardfearspeedno(1,2)=nansum(context12nextspeed(:,1)>comparemeanspeedrate);
rewardfearspeedno(1,3)=nansum(context12nextspeed(:,2)<comparemeanspeedrate);
rewardfearspeedno(1,4)=nansum(context12nextspeed(:,2)>comparemeanspeedrate);


speedcorrectwrong(1,1)=nansum(rewardfearspeedno(1,1) + rewardfearspeedno(1,4));
speedcorrectwrong(1,2)=nansum(rewardfearspeedno(1,2) + rewardfearspeedno(1,3));

speedDI=(speedcorrectwrong(1,1) - speedcorrectwrong(1,2)) / (speedcorrectwrong(1,1) + speedcorrectwrong(1,2));

speedDIrewardfear(1,1)= speedDI;
speedDIrewardfear(1,2)= (rewardfearspeedno(1,1))/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2));
speedDIrewardfear(1,3)= (rewardfearspeedno(1,3))/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4));

c1speed=(rewardfearspeedno(1,1)/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2)))*100;
c2speed=(rewardfearspeedno(1,3)/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4)))*100;

c1c2speedpercentnext1(ii,1:3)=[speedDI c1speed c2speed];%%%%
%%%Calculating DI for speed NEXT 2
meanspeedrate(1,1)=nanmean(context12nextspeed(:,3));
meanspeedrate(1,2)=nanmean(context12nextspeed(:,4));
meanspeedrate(isnan(meanlickrate))=0;

comparemeanspeedrate=((meanspeedrate(1,1)-meanspeedrate(1,2))/2)+meanspeedrate(1,2);

rewardfearspeedno(1,1)=nansum(context12nextspeed(:,3)<comparemeanspeedrate);
rewardfearspeedno(1,2)=nansum(context12nextspeed(:,3)>comparemeanspeedrate);
rewardfearspeedno(1,3)=nansum(context12nextspeed(:,4)<comparemeanspeedrate);
rewardfearspeedno(1,4)=nansum(context12nextspeed(:,4)>comparemeanspeedrate);


speedcorrectwrong(1,1)=nansum(rewardfearspeedno(1,1) + rewardfearspeedno(1,4));
speedcorrectwrong(1,2)=nansum(rewardfearspeedno(1,2) + rewardfearspeedno(1,3));

speedDI=(speedcorrectwrong(1,1) - speedcorrectwrong(1,2)) / (speedcorrectwrong(1,1) + speedcorrectwrong(1,2));

speedDIrewardfear(1,1)= speedDI;
speedDIrewardfear(1,2)= (rewardfearspeedno(1,1))/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2));
speedDIrewardfear(1,3)= (rewardfearspeedno(1,3))/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4));

c1speed=(rewardfearspeedno(1,1)/(rewardfearspeedno(1,1)+rewardfearspeedno(1,2)))*100;
c2speed=(rewardfearspeedno(1,3)/(rewardfearspeedno(1,3)+rewardfearspeedno(1,4)))*100;

c1c2speedpercentnext2(ii,1:3)=[speedDI c1speed c2speed];
%%%%

habstops=(counthabcontextreward/(counthabcontextreward+counthabcontextnoreward))*100;
c2stops=(countc2reward/(countc2reward+countc2noreward))*100;
c1stops=(countc1reward/(countc1reward+countc1noreward))*100;
c1vsc2stops=(countc1reward-countc2reward)/(countc1reward+countc2reward);

correcttrials=(countc2norewardcompile+countc1reward);
incorrecttrials=(countc2rewardcompile+countc1noreward);
c1vsc2correct=(correcttrials/(incorrecttrials+correcttrials))*100;

correcttrials=(countc2noreward+countc1reward);
incorrecttrials=(countc2reward+countc1noreward);
c1vsc2correct=(correcttrials/(incorrecttrials+correcttrials))*100;

c1c2DIpercentrunstop(1,ii)=((countc1reward+countc2noreward)-(countc1noreward+countc2reward))/((countc1reward+countc2noreward)+(countc1noreward+countc2reward))


c1c2DIpercent(ii,1:3)=[c1vsc2stops c1stops c2stops];
% end

pupil=behavior(:,20);
speed=behavior(:,5);
lick=behavior(:,19);

cc=corrcoef(pupil,speed, 'rows','complete');
behavtobehavcorrelations(ii,1)=cc(1,2);
cc=corrcoef(pupil,lick, 'rows','complete');
behavtobehavcorrelations(ii,2)=cc(1,2);
cc=corrcoef(speed,lick, 'rows','complete');
behavtobehavcorrelations(ii,3)=cc(1,2);

rewpupilchange(ii,1:2)=[nanmean(context12rewpupilchange(:,1)) nanmean(context12rewpupilchange(:,2))];
timetonextcontextrewpermouse(ii,1:2)=[nanmean(timetonextcontextrew(:,1)) nanmean(timetonextcontextrew(:,2))]
timetonextcontextpermouse(ii,1:3)=[nanmean(timetonextcontext(:,1)) nanmean(timetonextcontext(:,2))  (nanmean(timetonextcontext(:,1))+nanmean(timetonextcontext(:,2)))/2]
timetoengagepermouse(ii,1:2)=[nanmean(timetoengage(:,2)) nanmean(timetoengage(:,3))]
speedtonextcontextpermouse(ii,1:2)=[nanmean(speedtonextcontext(:,1)) nanmean(speedtonextcontext(:,2))]
speedinegagepermouse(ii,1:2)=[nanmean(speedinengage(:,1)) nanmean(speedinengage(:,2))]
speedinrewardpermouse(ii,1:2)=[nanmean(context12rewspeed(:,1)) nanmean(context12rewspeed(:,2))]
speedincontextpermouse(ii,1:2)=[nanmean(context12speed(:,1)) nanmean(context12speed(:,2))]
speedorigincontextallpermouse(ii,1:2)=[nanmean(context12speedorigall(:,1)) nanmean(context12speedorigall(:,2))]
speedorigincontextpermouse(ii,1:2)=[nanmean(context12speedorigcontext(:,1)) nanmean(context12speedorigcontext(:,2))]

speedorigincontextafterpermouse(ii,1:4)=[nanmean(context12nextspeed(:,1)) nanmean(context12nextspeed(:,2)) nanmean(context12nextspeed(:,3)) nanmean(context12nextspeed(:,4))]

speedorigincontextafterallpermouse(ii,1:4)=[nanmean(context12nextallspeed(:,1)) nanmean(context12nextallspeed(:,2)) nanmean(context12nextallspeed(:,3)) nanmean(context12nextallspeed(:,4))]

% if ii==6
%     hello
% end

minipermouse(ii,1:2)=[mini1 mini2];
minutes=behavior(end,1)/60;
if trainingday==0
    countc1reward=countc1reward+countc2reward;
end
speedoriginalpermouse(ii,1)=[mean(behavior(:,originalspeedcolumn))]

firstreward=find(diff(behavior(:,9))==1,1,'first');
lastreward=find(diff(behavior(:,9))==1,1,'last');
minutes=(behavior(lastreward,1)-behavior(firstreward,1))/60;

countc1reward=sum(diff(behavior(:,9))==1);

rewardspermouse(ii,1:3)=[countc1reward/minutes countc1reward/minutes (countc1reward+countc2reward)/minutes];
contextspermouse(ii,1:3)=[countc1/minutes countc2/minutes (countc1+countc2)/minutes];

c1vsc2stops=(countc1reward-countc2reward)/(countc1reward+countc2reward);

rewardsperminute(ii,1:11)=nan;
rewardsperminute(ii,1)=sum(diff(behavior(:,9))==1)/minutes;
   
if habituation==1
   rewardsperminute(ii,1)=sum(diff(behavior(:,9))==1)/minutes;
   
   first=find(behavior(:,1)>0,1,'first');
   last=find(behavior(:,1)<60,1,'last');
   rewardsperminute(ii,2)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>60,1,'first');
   last=find(behavior(:,1)<120,1,'last');
   rewardsperminute(ii,3)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>120,1,'first');
   last=find(behavior(:,1)<180,1,'last');
   rewardsperminute(ii,4)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>180,1,'first');
   last=find(behavior(:,1)<240,1,'last');
   rewardsperminute(ii,5)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>240,1,'first');
   last=find(behavior(:,1)<300,1,'last');
   rewardsperminute(ii,6)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>300,1,'first');
   last=find(behavior(:,1)<360,1,'last');
   rewardsperminute(ii,7)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>360,1,'first');
   last=find(behavior(:,1)<420,1,'last');
   rewardsperminute(ii,8)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>420,1,'first');
   last=find(behavior(:,1)<480,1,'last');
   rewardsperminute(ii,9)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>480,1,'first');
   last=find(behavior(:,1)<540,1,'last');
   rewardsperminute(ii,10)=sum(diff(behavior(first:last,9))==1);
   
   first=find(behavior(:,1)>540,1,'first');
   last=find(behavior(:,1)<600,1,'last');
   rewardsperminute(ii,11)=sum(diff(behavior(first:last,9))==1);
    
end

% hello

%%%%
%separate lickDI into after reward or fail

