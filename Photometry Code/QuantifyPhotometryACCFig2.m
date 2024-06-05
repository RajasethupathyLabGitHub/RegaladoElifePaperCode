%find correlations between running length and OFC/AM activity

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
        
        speedengage(failnew,1)=mean(photometrybehavior(i-10:i,5));%-photometrybehavior(lastreward,22);
        photometryengage(failnew,1)=mean(photometrybehavior(i-10:i,colnummax-4))-photometrybehavior(i,colnummax-4);%-photometrybehavior(lastreward,22);
        photometryengage(failnew,2)=mean(photometrybehavior(i-10:i,colnummax-3))-photometrybehavior(i,colnummax-3);%-photometrybehavior(lastreward,22);
        photometryengage(failnew,3)=mean(photometrybehavior(i-10:i,colnummax-2))-photometrybehavior(i,colnummax-2);%-photometrybehavior(lastreward,22);
        
        
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
        photometrytuningrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+33,colnummax-4)-photometrybehavior(i,colnummax-4));
        photometrytuningrewout(rewoutnew,2)=mean(photometrybehavior(i+1:i+33,colnummax-3)-photometrybehavior(i,colnummax-3));
        photometrytuningrewout(rewoutnew,3)=mean(photometrybehavior(i+1:i+33,colnummax-2)-photometrybehavior(i,colnummax-2));
        lastreward=find(photometrybehavior(1:i-1,9)==1,1,'last');
        lastrewardtimesrew(rewoutnew)=photometrybehavior(i,1)-photometrybehavior(lastreward,1);
        
        nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        nextcontexttimesrew(rewoutnew)=photometrybehavior(nextcontext,1)-photometrybehavior(i,1);
        
        nextreward=find(diff(photometrybehavior(i:end,9))==1,1,'first')+i;
        nextrewardtimesrew(rewoutnew)=photometrybehavior(nextreward,1)-photometrybehavior(i,1);
        
%         if lastrewardtimes(rewoutnew)>15
%             hello
%         end
        
    end

end



speedrewfail(newmouse,1:2)=[mean(speedrew(:,1)) mean(speedfail(:,1))];
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

if rewstop==0 || failstop==0
    speedrewfail(newmouse,1:2)=nan;
    lickrewfail(newmouse,1:2)=nan;
    photometrytuningsav(newmouse,1:9)=nan;
end

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