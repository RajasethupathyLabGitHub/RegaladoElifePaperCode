%find correlations between running length and OFC/AM activity

clear all
clear all
close all
close all


all_files = dir
all_dir = all_files([all_files(:).isdir])
num_dir = numel(all_dir);

newmouse=0;
speedrewoutcomp=nan(100,6);
photometrytuningrewoutcomp=nan(100,6);
        speedengagecomp=nan(100,6);
        photometryengagecomp=nan(100,6);
        rewardstd=0;
        engagestd=0;
        
for foldernum=3:num_dir
    foldername=all_dir(foldernum).name;
    
    if  ~contains(foldername,'Runners') && ~contains(foldername,'Stoppers') && ~contains(foldername,'Passive')
    newmouse=newmouse+1
    load([pwd,'/',foldername,'/photometrybehavior.mat']);





%%%%engagement column create%%%%
counttimes=0;
runtimer=0;
newrunfail=0;
newrunrew=0;
failfail=0;



%%%make sure to nan columns mice dont have
%%%%figure out what signals to leave in/out
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
    photo=[1,1,0,0,0];
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mP1')
    photo=[1,1,0,0,0];
    photometrybehavior(:,numberofcol-2)=nan;
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    
    elseif contains(mousename,'mP4')
    photo=[1,1,1,1,0];
    photometrybehavior(:,numberofcol)=nan;
    
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
    elseif contains(mousename,'m2Photo_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'m3Photo_')
    photo=[1,1,1,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
    elseif contains(mousename,'mDot_')
    photo=[1,1,0,0,0];
    photometrybehavior(:,numberofcol-1)=nan;
    photometrybehavior(:,numberofcol)=nan;
end

if habituation==1
    photometrybehavior(:,trialtypes)=1;
end

colnummax=numel(photometrybehavior(1,:));

failuremissed=0;
failuregot=0;
trialnumbers=unique(photometrybehavior(:,14));

rewnew=0;
rewoutnew=0;
failnew=0;
rewnew=0;
rewstop=0;
failstop=0;
itiafterrew=0;
itiafterfail=0;
trialnew=0;
photometrytuningrew=[];
photometrytuningfail=[];
photometrytuningrewout=[];
speedrew=[];
speedfail=[];
lickfail=0;

speedfail=0;
photometrytuningfail=[0 0 0];


for i=2:numel(photometrybehavior(:,1))
    
    if (photometrybehavior(i,6)-photometrybehavior(i-1,6))==1 && any(photometrybehavior(1:i,9),1)==1
        lasttrial=find(photometrybehavior(:,14)==photometrybehavior(i,14)-1,1,'last');
        nexttrial=find(photometrybehavior(:,14)==photometrybehavior(i,14),1,'last');
        trialnew=trialnew+1;
        
        
        
        
%         hello
        %find the fail cue onset
        if photometrybehavior(i,13)==2 && numel(photometrybehavior(:,1))>i+34 %&& photometrybehavior(lasttrial,13)==1
            
        failnew=failnew+1;


        %any room
        nextrewardroom=find(photometrybehavior(i:end,6)==0,1,'first')+i-1;
        nextrewardcontext=find(photometrybehavior(nextrewardroom:end,6)==1,1,'first')+nextrewardroom-1;
        
        
        
%         nextcontexttime=photometrybehavior(find(photometrybehavior(i:end,13)==1,1,'first')+i-1,1);
if ~isempty(nextrewardcontext)
        nextcontexttime=photometrybehavior(nextrewardcontext,1);
        nextcontexttimes(failnew,1)=nextcontexttime-photometrybehavior(i,1);
        nextcontexttimes(failnew,1)=nextcontexttime-photometrybehavior(nextrewardroom,1);
        
%         hello
%         if nextcontexttimes(failnew,1)>10
%             hello
%         end
        
        failrun(failnew,1)=mean(photometrybehavior(i:nextrewardcontext,5));
%         photometryfail(failnew,1)=mean(photometrybehavior(i:i+34,22)); %-photometrybehavior(i,22);
%         photometryfail(failnew,2)=mean(photometrybehavior(i:i+34,23));  %-photometrybehavior(i,23);
%         photometryfail(failnew,3)=mean(photometrybehavior(i:i+34,24)); %-photometrybehavior(i,24);
        photometryfail(failnew,1)=mean(photometrybehavior(i:nextrewardcontext,colnummax-4));  %-photometrybehavior(i,22);
        photometryfail(failnew,2)=mean(photometrybehavior(i:nextrewardcontext,colnummax-3));  %-photometrybehavior(i,23);
        photometryfail(failnew,3)=mean(photometrybehavior(i:nextrewardcontext,colnummax-2));  %-photometrybehavior(i,24);
        
        if (photometrybehavior(nexttrial,1)-photometrybehavior(i,1))>5
            failstop=failstop+1;
        speedfail(failstop,1)=mean(photometrybehavior(i:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickfail(failstop,1)=sum(photometrybehavior(i:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningfail(failstop,1)=mean(photometrybehavior(i+1:i+34,colnummax-4)-photometrybehavior(i,colnummax-4));     %photometrybehavior(i+18,colnummax-4)-photometrybehavior(i+5,colnummax-4);
        photometrytuningfail(failstop,2)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));     %photometrybehavior(i+18,colnummax-3)-photometrybehavior(i+5,colnummax-3);
        photometrytuningfail(failstop,3)=mean(photometrybehavior(i+1:i+34,colnummax-2)-photometrybehavior(i,colnummax-2));     %photometrybehavior(i+18,colnummax-2)-photometrybehavior(i+5,colnummax-2);
        end
%         hello
        
        runsinfail(failnew,1:50)=photometrybehavior(i:i+49,17);
        stopinfail=photometrybehavior(find(photometrybehavior(i:nextrewardroom,17)<2,1,'first'),1);
        runinfail=photometrybehavior(find(photometrybehavior(i:nextrewardroom,17)<2,1,'last'),1);
        if any(photometrybehavior(i:nextrewardroom,17)<2)==0
            reengagetimes(failnew,1)=0;
            
%             hello
        elseif any(photometrybehavior(i:nextrewardroom,17)<2)==1
        reengagetimes(failnew,1)=runinfail-stopinfail;
        end
        
%         if runinfail-stopinfail>5
%             hello
%         end
%         hello
        
        OFCfail=photometrybehavior(i:i+34,22);
ACCfail=photometrybehavior(i:i+34,23);
AMfail=photometrybehavior(i:i+34,24);
OFCACC=corrcoef(OFCfail,ACCfail);
ACCAM=corrcoef(ACCfail,AMfail);
OFCAM=corrcoef(OFCfail,AMfail);
OFCACCAMfailcorr(failnew,1:3)=[OFCACC(1,2) ACCAM(1,2) OFCAM(1,2)];


%find last reward time and get the pretrial activity
        
        trialstart=find(photometrybehavior(1:i,14)==photometrybehavior(i,14),1,'first');
        lastreward=find(photometrybehavior(1:i,9)==1,1,'last');
        lastrewardtime=photometrybehavior(lastreward,1);
        lastrewardtimesfail(failnew,1)=photometrybehavior(i,1)-lastrewardtime;
        
        
end
        
        end
        
        %if the reward cue onset
        if photometrybehavior(i,13)==1 && numel(photometrybehavior(:,1))>i+34
        rewnew=rewnew+1;
        
        
        if (photometrybehavior(nexttrial,1)-photometrybehavior(i,1))>5
%             hello
        rewstop=rewstop+1;
        speedrew(rewstop,1)=mean(photometrybehavior(i:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickrew(rewstop,1)=sum(photometrybehavior(i:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningrew(rewstop,1)=mean(photometrybehavior(i+1:i+34,colnummax-4)-photometrybehavior(i,colnummax-4));
        photometrytuningrew(rewstop,2)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));
        photometrytuningrew(rewstop,3)=mean(photometrybehavior(i+1:i+34,colnummax-2)-photometrybehavior(i,colnummax-2));
        
        end
        
        OFCrew=photometrybehavior(i:i+34,22);
ACCrew=photometrybehavior(i:i+34,23);
AMrew=photometrybehavior(i:i+34,24);
OFCACC=corrcoef(OFCrew,ACCrew);
ACCAM=corrcoef(ACCrew,AMrew);
OFCAM=corrcoef(OFCrew,AMrew);
OFCACCAMrewcorr(rewnew,1:3)=[OFCACC(1,2) ACCAM(1,2) OFCAM(1,2)];



        end
        
        
        
        
        %%%for passive sessions, look at synchronicity in ITIs
        
        if photometrybehavior(lasttrial,13)==1 && passiveday==1
        itiafterrew=itiafterrew+1;
            OFCiti=photometrybehavior(lasttrial:i,colnummax-4);
            ACCiti=photometrybehavior(lasttrial:i,colnummax-3);
            AMiti=photometrybehavior(lasttrial:i,colnummax-2);
            OFCACC=corrcoef(OFCiti,ACCiti);
            ACCAM=corrcoef(ACCiti,AMiti);
            OFCAM=corrcoef(OFCiti,AMiti);
            OFCACCAMitirewcorr(itiafterrew,1:3)=[OFCACC(1,2) ACCAM(1,2) OFCAM(1,2)];
            
            
            TIMEitieach=photometrybehavior(lasttrial:lasttrial+149,1)-photometrybehavior(lasttrial,1);
            SPEEDitieach(itiafterrew,1:150)=photometrybehavior(lasttrial:lasttrial+149,19);
            OFCitieach(itiafterrew,1:150)=OFCiti(1:150);
            ACCitieach(itiafterrew,1:150)=ACCiti(1:150);
            AMitieach(itiafterrew,1:150)=AMiti(1:150);
%             hello

        end
                if photometrybehavior(lasttrial,13)==2 && passiveday==1
        itiafterfail=itiafterfail+1;
            OFCiti=photometrybehavior(lasttrial:i,colnummax-4);
            ACCiti=photometrybehavior(lasttrial:i,colnummax-3);
            AMiti=photometrybehavior(lasttrial:i,colnummax-2);
            OFCACC=corrcoef(OFCiti,ACCiti);
            ACCAM=corrcoef(ACCiti,AMiti);
            OFCAM=corrcoef(OFCiti,AMiti);
            OFCACCAMitifailcorr(itiafterfail,1:3)=[OFCACC(1,2) ACCAM(1,2) OFCAM(1,2)];
            
%             hello

        end
        
    end
    
    
    %%%%check reward tunings!
    if (photometrybehavior(i,9)-photometrybehavior(i-1,9))==1 && any(photometrybehavior(1:i-1,9),1)==1 && ~isempty(find(diff(photometrybehavior(i:end,9))==1,1,'first'))

        rewoutnew=rewoutnew+1;
        contextentry=find(photometrybehavior(1:i,6)==0,1,'last');
        speedrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn));
        speedrewoutcomp(rewoutnew,newmouse)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn));
        photometrytuningrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+34,colnummax-4)-photometrybehavior(i,colnummax-4));
        photometrytuningrewout(rewoutnew,2)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));
        photometrytuningrewout(rewoutnew,3)=mean(photometrybehavior(i+1:i+34,colnummax-2)-photometrybehavior(i,colnummax-2));
        
        photometrytuningrewoutcomp(rewoutnew,newmouse)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));
        
        lastreward=find(photometrybehavior(1:i-1,9)==1,1,'last');
        lastrewardtimesrew(rewoutnew)=photometrybehavior(i,1)-photometrybehavior(lastreward,1);
        
        nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        nextengage=find(photometrybehavior(1:nextcontext-1,originalspeedcolumn)<1,1,'last');
        nextcontexttimesrew(rewoutnew)=photometrybehavior(nextcontext,1)-photometrybehavior(i,1);
        
        nextreward=find(diff(photometrybehavior(i:end,9))==1,1,'first')+i;
        nextrewardtimesrew(rewoutnew)=photometrybehavior(nextreward,1)-photometrybehavior(i,1);
        
        speedengagecomp(rewoutnew,newmouse)=mean(photometrybehavior(nextengage+1:nextengage+12,originalspeedcolumn))-mean(photometrybehavior(nextengage-11:nextengage,originalspeedcolumn));
        photometryengagecomp(rewoutnew,newmouse)=mean(photometrybehavior(nextengage+1:nextengage+12,colnummax-3))-mean(photometrybehavior(nextengage-11:nextengage,colnummax-3));%-photometrybehavior(lastreward,22);
        
        
        %get the traces
        
        speedreward(rewoutnew,:)=photometrybehavior(i:i+22,originalspeedcolumn);
        speedrewardzscore(rewoutnew,:)=photometrybehavior(i:i+22,speedcolumn);
        photometrytuningreward(rewoutnew,:)=photometrybehavior(i:i+22,colnummax-3)-photometrybehavior(i,colnummax-3);
%         photometrytuningrewardnottnorm(rewoutnew,:)=photometrybehavior(i:i+26,colnummax-3);
        
        
        photopositionto1std=find(photometrytuningreward(rewoutnew,:)>1,1,'first');
        speedpositionto1std=find(speedreward(rewoutnew,:)>1,1,'first');
        if ~isempty(photopositionto1std) && ~isempty(speedpositionto1std)
        rewardstd=rewardstd+1;
        
        
        timeto1stdrew(rewardstd,1)=photometrybehavior(i+photopositionto1std,1)-photometrybehavior(i,1);
        timeto1stdrew(rewardstd,2)=photometrybehavior(i+speedpositionto1std,1)-photometrybehavior(i,1);
        
        
        [c,lags] =xcorr(speedreward(rewoutnew,:),photometrytuningreward(rewoutnew,:));
        crosscorrreward(rewardstd)=(lags(find(c==max(c),1,'first'))*0.053);
        
        
        if crosscorrreward(rewardstd)>0
%             plot(speedreward(rewoutnew,:))
%             hold on
%             plot(photometrytuningreward(rewoutnew,:))
%             
%             hello
        end
        
        else
            
        end
        
        
        speedengage(rewoutnew,:)=photometrybehavior(nextengage-6:nextengage+15,originalspeedcolumn);
        speedengagezscore(rewoutnew,:)=photometrybehavior(nextengage-6:nextengage+15,speedcolumn);
        photometrytuningengage(rewoutnew,:)=photometrybehavior(nextengage-6:nextengage+15,colnummax-3)-photometrybehavior(nextengage-6,colnummax-3);%-mean(photometrybehavior(i,colnummax-3));
        

        photopositionto1stdengage=find(photometrytuningengage(rewoutnew,:)>0.5,1,'first');
        speedpositionto1stdengage=find(speedengage(rewoutnew,:)>2,1,'first');
        
%         firstime=0;
%         speedpositionto1stdengage=[];
%         for each=1:numel(speedengage(rewoutnew,:))-1
%             if speedengage(rewoutnew,each)>2 && speedengage(rewoutnew,each+1)>2 && firstime==0
%                 speedpositionto1stdengage=each;
%                 firstime=1;
%             end
%         end
%         
%                 firstime=0;
%                 photopositionto1stdengage=[];
%         for each=1:numel(photometrytuningengage(rewoutnew,:))-1
%             if photometrytuningengage(rewoutnew,each)>1 && photometrytuningengage(rewoutnew,each+1)>1 && firstime==0
%                 photopositionto1stdengage=each;
%                 firstime=1;
%             end
%         end
        
%         hello
        
        if ~isempty(photopositionto1stdengage) && ~isempty(speedpositionto1stdengage)
        engagestd=engagestd+1;
%         hello

        timeto1stdengage(engagestd,1)=photometrybehavior(nextengage-6+photopositionto1stdengage,1)-photometrybehavior(nextengage,1);
        timeto1stdengage(engagestd,2)=photometrybehavior(nextengage-6+speedpositionto1stdengage,1)-photometrybehavior(nextengage,1);
        
%         timeto1stdengage(engagestd,1)=photometrybehavior(nextengage-5+plocs(1),1)-photometrybehavior(nextengage,1);
%         timeto1stdengage(engagestd,2)=photometrybehavior(nextengage-5+slocs(1),1)-photometrybehavior(nextengage,1);
        
        
        [c,lags] =xcorr(speedengage(rewoutnew,:),photometrytuningengage(rewoutnew,:));
        crosscorrengage(engagestd)=(lags(find(c==max(c),1,'first'))*0.053);
        
        if timeto1stdengage(engagestd,1)>0
%             plot(speedengage(rewoutnew,:))
%             hold on
%             plot(photometrytuningengage(rewoutnew,:))
%             
%             hello
        end
        
        
        else
            
        end
        
        
        if speedengagecomp(rewoutnew,newmouse)<0
            speedengagecomp(rewoutnew,newmouse)=nan;
            photometryengagecomp(rewoutnew,newmouse)=nan;
        end
        
    end

end

% hello


        [c,lags] =xcorr(mean(speedreward),mean(photometrytuningreward));
        crosscorrrewardpermouse(newmouse)=(lags(find(c==max(c),1,'first'))*0.053);
        
        
        [c,lags] =xcorr(mean(speedengage),mean(photometrytuningengage));
        crosscorrengagepermouse(newmouse)=(lags(find(c==max(c),1,'first'))*0.053)
        


correlationtospeed(newmouse,1)=corr(photometrybehavior(:,speedcolumn),photometrybehavior(:,colnummax-3));

% if correlationtospeed(newmouse,1)<0.1
%     hello
% end

correlationtolickrate(newmouse,1)=corr(photometrybehavior(:,lickcolumn),photometrybehavior(:,colnummax-3));

firstreward=find(diff(photometrybehavior(:,9))==1,1,'first');
lastreward=find(diff(photometrybehavior(:,9))==1,1,'last');
minutes=(photometrybehavior(lastreward,1)-photometrybehavior(firstreward,1))/60;

countc1reward=sum(diff(photometrybehavior(:,9))==1);

rewardspermousequant(newmouse,1)=[countc1reward/minutes];

speedrewfail(newmouse,1:2)=[mean(speedrew(:,1)) mean(speedfail(:,1))];
speedrewoutav(newmouse,1)=[mean(speedrewout(:,1))];
speedengageav(newmouse,1)=[nanmean(speedengagecomp(:,newmouse))];
lickrewfail(newmouse,1:2)=[mean(lickrew(:,1)) mean(lickfail(:,1))];
photometrytuningsav(newmouse,1)=mean(photometrytuningrew(:,1));
photometrytuningsav(newmouse,2)=mean(photometrytuningfail(:,1));
photometrytuningsav(newmouse,3)=mean(photometrytuningrewout(:,1));
photometrytuningsav(newmouse,4)=mean(photometrytuningrew(:,2));
photometrytuningsav(newmouse,5)=mean(photometrytuningfail(:,2));
photometrytuningsav(newmouse,6)=mean(photometrytuningrewout(:,2));
photometrytuningsav(newmouse,7)=mean(photometrytuningrew(:,3));
photometrytuningsav(newmouse,8)=mean(photometrytuningfail(:,3));
photometrytuningsav(newmouse,9)=mean(photometrytuningrewout(:,3));
photometrytuningsav(newmouse,10)=nanmean(photometryengagecomp(:,newmouse));

% if rewstop==0 || failstop==0
%     speedrewfail(newmouse,1:2)=nan;
%     lickrewfail(newmouse,1:2)=nan;
%     photometrytuningsav(newmouse,1:9)=nan;
% end

%%%broad photometry correlations

OFCall=photometrybehavior(:,22);
ACCall=photometrybehavior(:,23);
AMall=photometrybehavior(:,24);
OFCACC=corrcoef(OFCall,ACCall);
ACCAM=corrcoef(ACCall,AMall);
OFCAM=corrcoef(OFCall,AMall);
OFCACCAMallcorr=[OFCACC(1,2) ACCAM(1,2) OFCAM(1,2)];


for i=1:numel(photometrybehavior(:,1))
    
    if i<40
        OFCAMcontcorr(i)=nan;
    elseif i>=40
        OFCall=photometrybehavior(i-39:i,22);
        AMall=photometrybehavior(i-39:i,24);
        OFCAM=corrcoef(OFCall,AMall);
        OFCAMcontcorr(i)=OFCAM(1,2);
    end
    
end

if passiveday==1
figure
plot(TIMEitieach,mean(SPEEDitieach))
figure
plot(TIMEitieach,mean(OFCitieach))
figure
plot(TIMEitieach,mean(ACCitieach))
figure
plot(TIMEitieach,mean(AMitieach))
end
    end

end