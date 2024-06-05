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
    
if  ~contains(foldername,'Runners') && ~contains(foldername,'Stoppers') && ~contains(foldername,'Passive')
    
    newmouse=newmouse+1
    load([pwd,'/',foldername,'/photometrybehavior.mat']);




%%%%engagement column create%%%%
counttimes=0;
runtimer=0;
newrunfail=0;
newrunrew=0;
failfail=0;

%Check if no wasnt tracking the no-reward column
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
photometrytuningrewstop=[];
photometrytuningfailstop=[];
photometrytuningrewout=[];
photometrydiffrewout=[];
photometrytuningengage=[];
photometrydiffengage=[];
photometrytuningrewall=[];
speedrewnext=[];
lickrewnext=[];
photometrytuningrewnext=[];
speedfailnext=[];
lickfailnext=[];
photometrytuningfailnext=[];
speedrew=[];
speedfail=[];
rewtofail=0;
failtofail=0;
photometryrewtofail=[];
photometryfailtofail=[];


    rfr2=0;
    photometryrfr2=[0 0 0 0 0];
    rfr3=0;
    photometryrfr3=[0 0 0 0 0];

lickfailall=0;
lickfailnext=0;
rewlast=0;
faillast=0;

speedfailall=0;
speedrewall=0;
speedfailnext=0;

speedrewout=0;
speedengagerew=0;
speedfailout=0;
speedengagefail=0;

rffr2=0;
rffr3=0;
rffr4=0;

rewlastrun=0;
faillastrun=0;
photometrytuningfailstop=[0 0 0 0 0];
photometrytuningfailall=[0 0 0 0 0];
photometrytuningrewstop=[0 0 0 0 0];
photometrytuningrewall=[0 0 0 0 0];
photometrytuningfailnext=[0 0 0 0 0];
photometryrewlast=[0 0 0 0 0];
photometryfaillast=[0 0 0 0 0];
photometrytuningrewoutend=[];
photometrytuningfailoutend=[0 0 0 0 0];
photometrytuningrewall=[];
photometrytuningfailall=[];
photometryrffr2=[];
photometryrffr3=[];
photometryrffr4=[];

speedfailstop=0;
lickfailstop=0;
speedrewstop=0;
lickrewstop=0;
speedfailall=0;
lickfailall=0;
speedrewall=0;
lickrewall=0;


    failoutnew=0;
    photometrytuningfailout=[0 0 0 0 0];
    
        photometrytuningrewout=[0 0 0 0 0]
        photometrytuningengagerew=[0 0 0 0 0];
        photometrytuningengagefail=[0 0 0 0 0];


for i=2:numel(photometrybehavior(:,1))
    
    if (photometrybehavior(i,6)-photometrybehavior(i-1,6))==1 && any(photometrybehavior(1:i,9),1)==1
        lasttrial=find(photometrybehavior(:,14)==photometrybehavior(i,14)-1,1,'last');
        nexttrial=find(photometrybehavior(:,14)==photometrybehavior(i,14),1,'last');
        trialnew=trialnew+1;
        
        
if trialnew>1 && numel(photometrybehavior(:,1))>nexttrial+1
    lastlasttrial=find(photometrybehavior(:,14)==photometrybehavior(i,14)-2,1,'last');
    
    j=find(diff(photometrybehavior(1:i-1,6))==1);
    
    lasttrialcues=find(photometrybehavior(1:lasttrial,6)==0,1,'last');
    
    
    if photometrybehavior(lasttrial,13)==1 && photometrybehavior(nexttrial,13)==2 && photometrybehavior(nexttrial+1,13)==2 && numel(j)>3
        rffr2=rffr2+1;
        
        j=j(end)+1;
    
        
        
        photometryrffr1(rffr2,2)=mean(photometrybehavior(lasttrialcues:lasttrialcues+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        
        photometryrffr2(rffr2,1)=mean(photometrybehavior(i-22:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrffr2(rffr2,2)=mean(photometrybehavior(i:i+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryrffr2(rffr2,3)=mean(photometrybehavior(i-22:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryrffr2(rffr2,4)=mean(photometrybehavior(i-22:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryrffr2(rffr2,5)=mean(photometrybehavior(i-22:i,colnummax));%-photometrybehavior(j,colnummax);
        
    end
    if photometrybehavior(lasttrial,13)==2 && photometrybehavior(lastlasttrial,13)==1 && photometrybehavior(nexttrial,13)==2 && numel(j)>3
    
        rffr3=rffr3+1;
        
    j=j(end-1)+1;
        photometryrffr3(rffr3,1)=mean(photometrybehavior(i-22:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrffr3(rffr3,2)=mean(photometrybehavior(i:i+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryrffr3(rffr3,3)=mean(photometrybehavior(i-22:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryrffr3(rffr3,4)=mean(photometrybehavior(i-22:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryrffr3(rffr3,5)=mean(photometrybehavior(i-22:i,colnummax));%-photometrybehavior(j,colnummax);
    end
    if photometrybehavior(lasttrial,13)==2 && photometrybehavior(lastlasttrial,13)==2 && numel(j)>3
%         hello
        rffr4=rffr4+1;
        
    j=j(end-2)+1;
        photometryrffr4(rffr4,1)=mean(photometrybehavior(i-22:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrffr4(rffr4,2)=mean(photometrybehavior(i:i+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryrffr4(rffr4,3)=mean(photometrybehavior(i-22:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryrffr4(rffr4,4)=mean(photometrybehavior(i-22:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryrffr4(rffr4,5)=mean(photometrybehavior(i-22:i,colnummax));%-photometrybehavior(j,colnummax);
    end
    
    %do it for the RFR contexts
    
    
    j=find(diff(photometrybehavior(1:i-1,6))==1);
    if photometrybehavior(lasttrial,13)==1 && photometrybehavior(nexttrial,13)==2 && photometrybehavior(nexttrial+1,13)==1 && numel(j)>1
        
    j=j(end)+1;
        rfr2=rfr2+1;
        
        photometryrfr1(rfr2,2)=mean(photometrybehavior(lasttrialcues:lasttrialcues+33,colnummax-3));
        
        photometryrfr2(rfr2,1)=mean(photometrybehavior(i-22:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrfr2(rfr2,2)=mean(photometrybehavior(i:i+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryrfr2(rfr2,3)=mean(photometrybehavior(i-22:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryrfr2(rfr2,4)=mean(photometrybehavior(i-22:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryrfr2(rfr2,5)=mean(photometrybehavior(i-22:i,colnummax));%-photometrybehavior(j,colnummax);
        
    end
    if photometrybehavior(lasttrial,13)==2 && photometrybehavior(lastlasttrial,13)==1 && photometrybehavior(nexttrial,13)==1 && numel(j)>1
    
    j=j(end-1)+1;
    
        rfr3=rfr3+1;
        photometryrfr3(rfr3,1)=mean(photometrybehavior(i-22:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrfr3(rfr3,2)=mean(photometrybehavior(i:i+33,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryrfr3(rfr3,3)=mean(photometrybehavior(i-22:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryrfr3(rfr3,4)=mean(photometrybehavior(i-22:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryrfr3(rfr3,5)=mean(photometrybehavior(i-22:i,colnummax));%-photometrybehavior(j,colnummax);
    end
    
    
    %only check history going into failures
    
    j=find(diff(photometrybehavior(1:i-1,6))==1,1,'last');
    if photometrybehavior(lasttrial,13)==1 && photometrybehavior(nexttrial,13)==2
        rewtofail=rewtofail+1;
        photometryrewtofail(rewtofail,1)=mean(photometrybehavior(i-22:i,colnummax-4))-photometrybehavior(j,colnummax-4);
        photometryrewtofail(rewtofail,2)=mean(photometrybehavior(i-22:i,colnummax-3))-photometrybehavior(j,colnummax-3);
        photometryrewtofail(rewtofail,3)=mean(photometrybehavior(i-22:i,colnummax-2))-photometrybehavior(j,colnummax-2);
        photometryrewtofail(rewtofail,4)=mean(photometrybehavior(i-22:i,colnummax-1))-photometrybehavior(j,colnummax-1);
        photometryrewtofail(rewtofail,5)=mean(photometrybehavior(i-22:i,colnummax))-photometrybehavior(j,colnummax);
    end
    
    if photometrybehavior(lasttrial,13)==2 && photometrybehavior(nexttrial,13)==2
        failtofail=failtofail+1;
        photometryfailtofail(failtofail,1)=mean(photometrybehavior(i-22:i,colnummax-4))-photometrybehavior(j,colnummax-4);
        photometryfailtofail(failtofail,2)=mean(photometrybehavior(i-22:i,colnummax-3))-photometrybehavior(j,colnummax-3);
        photometryfailtofail(failtofail,3)=mean(photometrybehavior(i-22:i,colnummax-2))-photometrybehavior(j,colnummax-2);
        photometryfailtofail(failtofail,4)=mean(photometrybehavior(i-22:i,colnummax-1))-photometrybehavior(j,colnummax-1);
        photometryfailtofail(failtofail,5)=mean(photometrybehavior(i-22:i,colnummax))-photometrybehavior(j,colnummax);
    end
end

%%%%track if last was reward or fail
j=find(diff(photometrybehavior(1:i-1,6))==1,1,'last');

if  numel(photometrybehavior(:,1))>i+34
if photometrybehavior(j,13)==1 
        rewlast=rewlast+1;
        rewlastrun(rewlast,1)=mean(photometrybehavior(i-11:i,originalspeedcolumn));
        photometryrewlast(rewlast,1)=mean(photometrybehavior(i-11:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryrewlast(rewlast,2)=mean(photometrybehavior(i-11:i,colnummax-3));%;-photometrybehavior(j,colnummax-3);
        photometryrewlast(rewlast,3)=mean(photometrybehavior(i-11:i,colnummax-2));%;-photometrybehavior(j,colnummax-2);
        photometryrewlast(rewlast,4)=mean(photometrybehavior(i-11:i,colnummax-1))%;-photometrybehavior(j,colnummax-1);
        photometryrewlast(rewlast,5)=mean(photometrybehavior(i-11:i,colnummax));%;)-photometrybehavior(j,colnummax);

        photometryrewlast(rewlast,1)=mean(photometrybehavior(i-11:i,colnummax-4))-photometrybehavior(j,colnummax-4);
        photometryrewlast(rewlast,2)=mean(photometrybehavior(i-11:i,colnummax-3))-photometrybehavior(j,colnummax-3);
        photometryrewlast(rewlast,3)=mean(photometrybehavior(i-11:i,colnummax-2))-photometrybehavior(j,colnummax-2);
        photometryrewlast(rewlast,4)=mean(photometrybehavior(i-11:i,colnummax-1))-photometrybehavior(j,colnummax-1);
        photometryrewlast(rewlast,5)=mean(photometrybehavior(i-11:i,colnummax))-photometrybehavior(j,colnummax);

elseif photometrybehavior(j,13)==2
        faillast=faillast+1;
        faillastrun(faillast,1)=mean(photometrybehavior(i-11:i,originalspeedcolumn));
        photometryfaillast(faillast,1)=mean(photometrybehavior(i-11:i,colnummax-4));%-photometrybehavior(j,colnummax-4);
        photometryfaillast(faillast,2)=mean(photometrybehavior(i-11:i,colnummax-3));%-photometrybehavior(j,colnummax-3);
        photometryfaillast(faillast,3)=mean(photometrybehavior(i-11:i,colnummax-2));%-photometrybehavior(j,colnummax-2);
        photometryfaillast(faillast,4)=mean(photometrybehavior(i-11:i,colnummax-1));%-photometrybehavior(j,colnummax-1);
        photometryfaillast(faillast,5)=mean(photometrybehavior(i-11:i,colnummax));%-photometrybehavior(j,colnummax);

        photometryfaillast(faillast,1)=mean(photometrybehavior(i-11:i,colnummax-4))-photometrybehavior(j,colnummax-4);
        photometryfaillast(faillast,2)=mean(photometrybehavior(i-11:i,colnummax-3))-photometrybehavior(j,colnummax-3);
        photometryfaillast(faillast,3)=mean(photometrybehavior(i-11:i,colnummax-2))-photometrybehavior(j,colnummax-2);
        photometryfaillast(faillast,4)=mean(photometrybehavior(i-11:i,colnummax-1))-photometrybehavior(j,colnummax-1);
        photometryfaillast(faillast,5)=mean(photometrybehavior(i-11:i,colnummax))-photometrybehavior(j,colnummax);

end
end
        
%         hello
        %find the fail cue onset
        if photometrybehavior(i,13)==2 && numel(photometrybehavior(:,1))>i+34 %&& photometrybehavior(lasttrial,13)==1
            
        failnew=failnew+1;


        %any room
        nextrewardroom=find(photometrybehavior(i:end,6)==0,1,'first')+i-1;
        nextrewardcontext=find(photometrybehavior(nextrewardroom:end,6)==1,1,'first')+nextrewardroom-1;
        
        
        
        speedfailall(failnew,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickfailall(failnew,1)=sum(photometrybehavior(i:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        
%         speedfailall(failnew,1)=mean(photometrybehavior(i+1:nextrewardroom,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickfailall(failnew,1)=sum(photometrybehavior(i:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        
        photometrytuningfailall(failnew,1)=mean(photometrybehavior(i+1:i+34,colnummax-4))-photometrybehavior(i,colnummax-4);     %photometrybehavior(i+18,colnummax-4)-photometrybehavior(i+5,colnummax-4);
        photometrytuningfailall(failnew,2)=mean(photometrybehavior(i+1:i+34,colnummax-3))-photometrybehavior(i,colnummax-3);     %photometrybehavior(i+18,colnummax-3)-photometrybehavior(i+5,colnummax-3);
        photometrytuningfailall(failnew,3)=mean(photometrybehavior(i+1:i+34,colnummax-2))-photometrybehavior(i,colnummax-2);     %photometrybehavior(i+18,colnummax-2)-photometrybehavior(i+5,colnummax-2);
        
        photometrytuningfailall(failnew,4)=mean(photometrybehavior(i+1:i+34,colnummax-1))-photometrybehavior(i,colnummax-1);     %photometrybehavior(i+18,colnummax-3)-photometrybehavior(i+5,colnummax-3);
        photometrytuningfailall(failnew,5)=mean(photometrybehavior(i+1:i+34,colnummax))-photometrybehavior(i,colnummax); 



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
        speedfailstop(failstop,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
%         speedfailstop(failstop,1)=mean(photometrybehavior(i+1:nextrewardroom,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        
        lickfailstop(failstop,1)=sum(photometrybehavior(i+1:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        
        photometrytuningfailstop(failstop,1)=mean(photometrybehavior(i+1:i+34,colnummax-4)-photometrybehavior(i,colnummax-4));     %photometrybehavior(i+18,colnummax-4)-photometrybehavior(i+5,colnummax-4);
        photometrytuningfailstop(failstop,2)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));     %photometrybehavior(i+18,colnummax-3)-photometrybehavior(i+5,colnummax-3);
        photometrytuningfailstop(failstop,3)=mean(photometrybehavior(i+1:i+34,colnummax-2)-photometrybehavior(i,colnummax-2));     %photometrybehavior(i+18,colnummax-2)-photometrybehavior(i+5,colnummax-2);
        
        photometrytuningfailstop(failstop,4)=mean(photometrybehavior(i+1:i+34,colnummax-1)-photometrybehavior(i,colnummax-1));     %photometrybehavior(i+18,colnummax-3)-photometrybehavior(i+5,colnummax-3);
        photometrytuningfailstop(failstop,5)=mean(photometrybehavior(i+1:i+34,colnummax)-photometrybehavior(i,colnummax)); 



        lastcontext=find(diff(photometrybehavior(1:i,6))==1,1,'last');
        photometrytuningfailoutend(failstop,1)=mean(photometrybehavior(i+34,colnummax-4))-mean(photometrybehavior(lastcontext,colnummax-4));
        photometrytuningfailoutend(failstop,2)=mean(photometrybehavior(i+34,colnummax-3))-mean(photometrybehavior(lastcontext,colnummax-3));
        photometrytuningfailoutend(failstop,3)=mean(photometrybehavior(i+34,colnummax-2))-mean(photometrybehavior(lastcontext,colnummax-2));
        photometrytuningfailoutend(failstop,4)=mean(photometrybehavior(i+34,colnummax-1))-mean(photometrybehavior(lastcontext,colnummax-1));
        photometrytuningfailoutend(failstop,5)=mean(photometrybehavior(i+34,colnummax))-mean(photometrybehavior(lastcontext,colnummax));

                nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        %find the 1sec before next context entry
        if isempty(nextcontext)==0
            

        j=find(photometrybehavior(:,1)<=photometrybehavior(nextcontext,1)-1,1,'last');

        nextfail=find(photometrybehavior(1:end,1)>photometrybehavior(nexttrial+1,1)-3,1,'first');
        
        
% stop
        speedfailnext(failstop,1)=mean(photometrybehavior(j:nextcontext,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickfailnext(failstop,1)=sum(photometrybehavior(j:nextcontext,18))/(photometrybehavior(nextcontext,1)-photometrybehavior(j,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningfailnext(failstop,1)=mean(photometrybehavior(j:nextcontext,colnummax-4))-photometrybehavior(i,colnummax-4);
        photometrytuningfailnext(failstop,2)=mean(photometrybehavior(j:nextcontext,colnummax-3))-photometrybehavior(i,colnummax-3);
        photometrytuningfailnext(failstop,3)=mean(photometrybehavior(j:nextcontext,colnummax-2))-photometrybehavior(i,colnummax-2);
        photometrytuningfailnext(failstop,4)=mean(photometrybehavior(j:nextcontext,colnummax-1))-photometrybehavior(i,colnummax-1);
        photometrytuningfailnext(failstop,5)=mean(photometrybehavior(j:nextcontext,colnummax))-photometrybehavior(i,colnummax);


        end
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
        
        
        nextrewardroom=find(photometrybehavior(i:end,6)==0,1,'first')+i-1;

        speedrewall(rewnew,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
%         speedrewall(rewnew,1)=mean(photometrybehavior(i+1:nextrewardroom,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        
        lickrewall(rewnew,1)=sum(photometrybehavior(i+1:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningrewall(rewnew,1)=mean(photometrybehavior(i+1:i+34,colnummax-4))-photometrybehavior(i,colnummax-4);
        photometrytuningrewall(rewnew,2)=mean(photometrybehavior(i+1:i+34,colnummax-3))-photometrybehavior(i,colnummax-3);
        photometrytuningrewall(rewnew,3)=mean(photometrybehavior(i+1:i+34,colnummax-2))-photometrybehavior(i,colnummax-2);
        photometrytuningrewall(rewnew,4)=mean(photometrybehavior(i+1:i+34,colnummax-1))-photometrybehavior(i,colnummax-1);
        photometrytuningrewall(rewnew,5)=mean(photometrybehavior(i+1:i+34,colnummax))-photometrybehavior(i,colnummax);


        if (photometrybehavior(nexttrial,1)-photometrybehavior(i,1))>5
%             hello
        rewstop=rewstop+1;
        speedrewstop(rewstop,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
%         speedrewstop(rewstop,1)=mean(photometrybehavior(i+1:nextrewardroom,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        
        lickrewstop(rewstop,1)=sum(photometrybehavior(i+1:i+34,18))/(photometrybehavior(i+34,1)-photometrybehavior(i,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningrewstop(rewstop,1)=mean(photometrybehavior(i+1:i+34,colnummax-4)-photometrybehavior(i,colnummax-4));
        photometrytuningrewstop(rewstop,2)=mean(photometrybehavior(i+1:i+34,colnummax-3)-photometrybehavior(i,colnummax-3));
        photometrytuningrewstop(rewstop,3)=mean(photometrybehavior(i+1:i+34,colnummax-2)-photometrybehavior(i,colnummax-2));
        photometrytuningrewstop(rewstop,4)=mean(photometrybehavior(i+1:i+34,colnummax-1)-photometrybehavior(i,colnummax-1));
        photometrytuningrewstop(rewstop,5)=mean(photometrybehavior(i+1:i+34,colnummax)-photometrybehavior(i,colnummax));

%quantify 1 seconds before next context entry

        nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        %find the 1sec before next context entry
        if isempty(nextcontext)==0
        j=find(photometrybehavior(:,1)<=photometrybehavior(nextcontext,1)-1,1,'last');
        nextreward=find(diff(photometrybehavior(i:end,9))==1,1,'first')+i;
        
        speedrewnext(rewstop,1)=mean(photometrybehavior(j:nextcontext,originalspeedcolumn)); %-photometrybehavior(i+5,originalspeedcolumn);
        lickrewnext(rewstop,1)=sum(photometrybehavior(j:nextcontext,18))/(photometrybehavior(nextcontext,1)-photometrybehavior(j,1)); %-photometrybehavior(i+5,lickcolumn);
        photometrytuningrewnext(rewstop,1)=mean(photometrybehavior(j:nextcontext,colnummax-4))-photometrybehavior(i,colnummax-4);
        photometrytuningrewnext(rewstop,2)=mean(photometrybehavior(j:nextcontext,colnummax-3))-photometrybehavior(i,colnummax-3);
        photometrytuningrewnext(rewstop,3)=mean(photometrybehavior(j:nextcontext,colnummax-2))-photometrybehavior(i,colnummax-2);
        photometrytuningrewnext(rewstop,4)=mean(photometrybehavior(j:nextcontext,colnummax-1))-photometrybehavior(i,colnummax-1);
        photometrytuningrewnext(rewstop,5)=mean(photometrybehavior(j:nextcontext,colnummax))-photometrybehavior(i,colnummax);
        end

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
        speedrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn));
        
        photometrytuningrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+11,colnummax-4))-mean(photometrybehavior(i,colnummax-4));
        photometrytuningrewout(rewoutnew,2)=mean(photometrybehavior(i+1:i+11,colnummax-3))-mean(photometrybehavior(i,colnummax-3));
        photometrytuningrewout(rewoutnew,3)=mean(photometrybehavior(i+1:i+11,colnummax-2))-mean(photometrybehavior(i,colnummax-2));
        photometrytuningrewout(rewoutnew,4)=mean(photometrybehavior(i+1:i+11,colnummax-1))-mean(photometrybehavior(i,colnummax-1));
        photometrytuningrewout(rewoutnew,5)=mean(photometrybehavior(i+1:i+11,colnummax))-mean(photometrybehavior(i,colnummax));

        lastcontext=find(diff(photometrybehavior(1:i,6))==1,1,'last');
        photometrytuningrewoutend(rewoutnew,1)=mean(photometrybehavior(i+34,colnummax-4))-mean(photometrybehavior(lastcontext,colnummax-4));
        photometrytuningrewoutend(rewoutnew,2)=mean(photometrybehavior(i+34,colnummax-3))-mean(photometrybehavior(lastcontext,colnummax-3));
        photometrytuningrewoutend(rewoutnew,3)=mean(photometrybehavior(i+34,colnummax-2))-mean(photometrybehavior(lastcontext,colnummax-2));
        photometrytuningrewoutend(rewoutnew,4)=mean(photometrybehavior(i+34,colnummax-1))-mean(photometrybehavior(lastcontext,colnummax-1));
        photometrytuningrewoutend(rewoutnew,5)=mean(photometrybehavior(i+34,colnummax))-mean(photometrybehavior(lastcontext,colnummax));


%         photometrytuningrewout(rewoutnew,1)=mean(photometrybehavior(i+1:i+34,colnummax-4))-mean(photometrybehavior(lastcontext,colnummax-4));
%         photometrytuningrewout(rewoutnew,2)=mean(photometrybehavior(i+1:i+34,colnummax-3))-mean(photometrybehavior(lastcontext,colnummax-3));
%         photometrytuningrewout(rewoutnew,3)=mean(photometrybehavior(i+1:i+34,colnummax-2))-mean(photometrybehavior(lastcontext,colnummax-2));
%         photometrytuningrewout(rewoutnew,4)=mean(photometrybehavior(i+1:i+34,colnummax-1))-mean(photometrybehavior(lastcontext,colnummax-1));
%         photometrytuningrewout(rewoutnew,5)=mean(photometrybehavior(i+1:i+34,colnummax))-mean(photometrybehavior(lastcontext,colnummax));
        
        photometrydiffrewout(rewoutnew,1)=mean(photometrybehavior(i-5:i,colnummax-4));
        photometrydiffrewout(rewoutnew,2)=mean(photometrybehavior(i+1:i+11,colnummax-4));
        photometrydiffrewout(rewoutnew,3)=mean(photometrybehavior(i-5:i,colnummax-3));
        photometrydiffrewout(rewoutnew,4)=mean(photometrybehavior(i+1:i+11,colnummax-3));
        photometrydiffrewout(rewoutnew,5)=mean(photometrybehavior(i-5:i,colnummax-2));
        photometrydiffrewout(rewoutnew,6)=mean(photometrybehavior(i+1:i+11,colnummax-2));
        photometrydiffrewout(rewoutnew,7)=mean(photometrybehavior(i-5:i,colnummax-1));
        photometrydiffrewout(rewoutnew,8)=mean(photometrybehavior(i+1:i+11,colnummax-1));
        photometrydiffrewout(rewoutnew,9)=mean(photometrybehavior(i-5:i,colnummax));
        photometrydiffrewout(rewoutnew,10)=mean(photometrybehavior(i+1:i+11,colnummax));
        
        
        lastreward=find(photometrybehavior(1:i-1,9)==1,1,'last');
        lastrewardtimesrew(rewoutnew)=photometrybehavior(i,1)-photometrybehavior(lastreward,1);
        
        nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        nextcontexttimesrew(rewoutnew)=photometrybehavior(nextcontext,1)-photometrybehavior(i,1);
        
        nextreward=find(diff(photometrybehavior(i:end,9))==1,1,'first')+i;
        nextrewardtimesrew(rewoutnew)=photometrybehavior(nextreward,1)-photometrybehavior(i,1);
        
        
        %find the 1sec before next context entry
        j=find(photometrybehavior(:,1)<=photometrybehavior(nextcontext,1)-1,1,'last');
        j=find(photometrybehavior(1:nextcontext,originalspeedcolumn)<1,1,'last');
        
        speedengagerew(rewoutnew,1)=mean(photometrybehavior(j+1:j+11,originalspeedcolumn));
        
        photometrytuningengagerew(rewoutnew,1)=mean(photometrybehavior(j-11:j+11,colnummax-4))-mean(photometrybehavior(i,colnummax-4));
        photometrytuningengagerew(rewoutnew,2)=mean(photometrybehavior(j-11:j+11,colnummax-3))-mean(photometrybehavior(i,colnummax-3));
        photometrytuningengagerew(rewoutnew,3)=mean(photometrybehavior(j-11:j+11,colnummax-2))-mean(photometrybehavior(i,colnummax-2));
        photometrytuningengagerew(rewoutnew,4)=mean(photometrybehavior(j-11:j+11,colnummax-1))-mean(photometrybehavior(i,colnummax-1));
        photometrytuningengagerew(rewoutnew,5)=mean(photometrybehavior(j-11:j+11,colnummax))-mean(photometrybehavior(i,colnummax));
        
        
%         photometrytuningengagerew(rewoutnew,1)=mean(photometrybehavior(j+1:j+11,colnummax-4))-mean(photometrybehavior(j-10,colnummax-4));
%         photometrytuningengagerew(rewoutnew,2)=mean(photometrybehavior(j+1:j+11,colnummax-3))-mean(photometrybehavior(j-10,colnummax-3));
%         photometrytuningengagerew(rewoutnew,3)=mean(photometrybehavior(j+1:j+11,colnummax-2))-mean(photometrybehavior(j-10,colnummax-2));
%         photometrytuningengagerew(rewoutnew,4)=mean(photometrybehavior(j+1:j+11,colnummax-1))-mean(photometrybehavior(j-10,colnummax-1));
%         photometrytuningengagerew(rewoutnew,5)=mean(photometrybehavior(j+1:j+11,colnummax))-mean(photometrybehavior(j-10,colnummax));
        
        photometrydiffengage(rewoutnew,1)=mean(photometrybehavior(j-10:j,colnummax-4));
        photometrydiffengage(rewoutnew,2)=mean(photometrybehavior(j+1:j+11,colnummax-4));
        photometrydiffengage(rewoutnew,3)=mean(photometrybehavior(j-10:j,colnummax-3));
        photometrydiffengage(rewoutnew,4)=mean(photometrybehavior(j+1:j+11,colnummax-3));
        photometrydiffengage(rewoutnew,5)=mean(photometrybehavior(j-10:j,colnummax-2));
        photometrydiffengage(rewoutnew,6)=mean(photometrybehavior(j+1:j+11,colnummax-2));
        photometrydiffengage(rewoutnew,7)=mean(photometrybehavior(j-10:j,colnummax-1));
        photometrydiffengage(rewoutnew,8)=mean(photometrybehavior(j+1:j+11,colnummax-1));
        photometrydiffengage(rewoutnew,9)=mean(photometrybehavior(j-10:j,colnummax));
        photometrydiffengage(rewoutnew,10)=mean(photometrybehavior(j+1:j+11,colnummax));
%         if lastrewardtimes(rewoutnew)>15
%             hello
%         end
        
    end
    
    %check when failures come out
    
        nextcontext=find(diff(photometrybehavior(i:end,6))==1,1,'first')+i;
        
    if (photometrybehavior(i,10)-photometrybehavior(i-1,10))==1 && any(photometrybehavior(1:i-1,9),1)==1 && ~isempty(find(diff(photometrybehavior(i:end,9))==1,1,'first')) && ~isempty(nextcontext)

        failoutnew=failoutnew+1;
        speedfailout(failoutnew,1)=mean(photometrybehavior(i+1:i+34,originalspeedcolumn));
        photometrytuningfailout(failoutnew,1)=mean(photometrybehavior(i+1:i+11,colnummax-4))-mean(photometrybehavior(i,colnummax-4));
        photometrytuningfailout(failoutnew,2)=mean(photometrybehavior(i+1:i+11,colnummax-3))-mean(photometrybehavior(i,colnummax-3));
        photometrytuningfailout(failoutnew,3)=mean(photometrybehavior(i+1:i+11,colnummax-2))-mean(photometrybehavior(i,colnummax-2));
        photometrytuningfailout(failoutnew,4)=mean(photometrybehavior(i+1:i+11,colnummax-1))-mean(photometrybehavior(i,colnummax-1));
        photometrytuningfailout(failoutnew,5)=mean(photometrybehavior(i+1:i+11,colnummax))-mean(photometrybehavior(i,colnummax));
        
        
%         
%         if isempty(nextcontext)
%             hello
%         end
%         
        j=find(photometrybehavior(1:nextcontext,originalspeedcolumn)<1,1,'last');
        speedengagefail(failoutnew,1)=mean(photometrybehavior(j+1:j+11,originalspeedcolumn));
        photometrytuningengagefail(failoutnew,1)=mean(photometrybehavior(j-11:j+11,colnummax-4))-mean(photometrybehavior(i,colnummax-4));
        photometrytuningengagefail(failoutnew,2)=mean(photometrybehavior(j-11:j+11,colnummax-3))-mean(photometrybehavior(i,colnummax-3));
        photometrytuningengagefail(failoutnew,3)=mean(photometrybehavior(j-11:j+11,colnummax-2))-mean(photometrybehavior(i,colnummax-2));
        photometrytuningengagefail(failoutnew,4)=mean(photometrybehavior(j-11:j+11,colnummax-1))-mean(photometrybehavior(i,colnummax-1));
        photometrytuningengagefail(failoutnew,5)=mean(photometrybehavior(j-11:j+11,colnummax))-mean(photometrybehavior(i,colnummax));
        
    end

end

speedrewfailall(newmouse,1:2)=[mean(speedrewall(:,1)) mean(speedfailall(:,1))];
lickrewfailall(newmouse,1:2)=[mean(lickrewall(:,1)) mean(lickfailall(:,1))];

speedrewfailstop(newmouse,1:2)=[mean(speedrewstop(:,1)) mean(speedfailstop(:,1))];
lickrewfailstop(newmouse,1:2)=[mean(lickrewstop(:,1)) mean(lickfailstop(:,1))];

speedrewfailout(newmouse,1:2)=[mean(speedrewout(:,1)) mean(speedfailout(:,1))];

speedrewfailengage(newmouse,1:2)=[mean(speedengagerew(:,1)) mean(speedengagefail(:,1))];


photometrytuningsrewallav(newmouse,1)=mean(photometrytuningrewall(:,1));
photometrytuningsrewallav(newmouse,2)=mean(photometrytuningrewall(:,2));
photometrytuningsrewallav(newmouse,3)=mean(photometrytuningrewall(:,3));
photometrytuningsrewallav(newmouse,4)=mean(photometrytuningrewall(:,4));
photometrytuningsrewallav(newmouse,5)=mean(photometrytuningrewall(:,5));

photometrytuningsrewstopav(newmouse,1)=mean(photometrytuningrewstop(:,1));
photometrytuningsrewstopav(newmouse,2)=mean(photometrytuningrewstop(:,2));
photometrytuningsrewstopav(newmouse,3)=mean(photometrytuningrewstop(:,3));
photometrytuningsrewstopav(newmouse,4)=mean(photometrytuningrewstop(:,4));
photometrytuningsrewstopav(newmouse,5)=mean(photometrytuningrewstop(:,5));

if habituation==0
photometrytuningsfailallav(newmouse,1)=mean(photometrytuningfailall(:,1));
photometrytuningsfailallav(newmouse,2)=mean(photometrytuningfailall(:,2));
photometrytuningsfailallav(newmouse,3)=mean(photometrytuningfailall(:,3));
photometrytuningsfailallav(newmouse,4)=mean(photometrytuningfailall(:,4));
photometrytuningsfailallav(newmouse,5)=mean(photometrytuningfailall(:,5));


photometrytuningsfailstopav(newmouse,1)=mean(photometrytuningfailstop(:,1));
photometrytuningsfailstopav(newmouse,2)=mean(photometrytuningfailstop(:,2));
photometrytuningsfailstopav(newmouse,3)=mean(photometrytuningfailstop(:,3));
photometrytuningsfailstopav(newmouse,4)=mean(photometrytuningfailstop(:,4));
photometrytuningsfailstopav(newmouse,5)=mean(photometrytuningfailstop(:,5));
end

photometrytuningsrewoutav(newmouse,1)=mean(photometrytuningrewout(:,1));
photometrytuningsrewoutav(newmouse,2)=mean(photometrytuningrewout(:,2));
photometrytuningsrewoutav(newmouse,3)=mean(photometrytuningrewout(:,3));
photometrytuningsrewoutav(newmouse,4)=mean(photometrytuningrewout(:,4));
photometrytuningsrewoutav(newmouse,5)=mean(photometrytuningrewout(:,5));

photometrytuningsfailoutav(newmouse,1)=mean(photometrytuningfailout(:,1));
photometrytuningsfailoutav(newmouse,2)=mean(photometrytuningfailout(:,2));
photometrytuningsfailoutav(newmouse,3)=mean(photometrytuningfailout(:,3));
photometrytuningsfailoutav(newmouse,4)=mean(photometrytuningfailout(:,4));
photometrytuningsfailoutav(newmouse,5)=mean(photometrytuningfailout(:,5));

% hello

photometrytuningsengagerewav(newmouse,1)=mean(photometrytuningengagerew(:,1));
photometrytuningsengagerewav(newmouse,2)=mean(photometrytuningengagerew(:,2));
photometrytuningsengagerewav(newmouse,3)=mean(photometrytuningengagerew(:,3));
photometrytuningsengagerewav(newmouse,4)=mean(photometrytuningengagerew(:,4));
photometrytuningsengagerewav(newmouse,5)=mean(photometrytuningengagerew(:,5));


photometrytuningsengagefailav(newmouse,1)=mean(photometrytuningengagefail(:,1));
photometrytuningsengagefailav(newmouse,2)=mean(photometrytuningengagefail(:,2));
photometrytuningsengagefailav(newmouse,3)=mean(photometrytuningengagefail(:,3));
photometrytuningsengagefailav(newmouse,4)=mean(photometrytuningengagefail(:,4));
photometrytuningsengagefailav(newmouse,5)=mean(photometrytuningengagefail(:,5));


speedrewfailnext(newmouse,1:2)=[mean(speedrewnext(:,1)) mean(speedfailnext(:,1))];
lickrewfailnext(newmouse,1:2)=[mean(lickrewnext(:,1)) mean(lickfailnext(:,1))];

photometrytuningrewnextav(newmouse,1)=mean(photometrytuningrewnext(:,1));
photometrytuningrewnextav(newmouse,2)=mean(photometrytuningrewnext(:,2));
photometrytuningrewnextav(newmouse,3)=mean(photometrytuningrewnext(:,3));
photometrytuningrewnextav(newmouse,4)=mean(photometrytuningrewnext(:,4));
photometrytuningrewnextav(newmouse,5)=mean(photometrytuningrewnext(:,5));

photometrytuningsfailnextav(newmouse,1)=mean(photometrytuningfailnext(:,1));
photometrytuningsfailnextav(newmouse,2)=mean(photometrytuningfailnext(:,2));
photometrytuningsfailnextav(newmouse,3)=mean(photometrytuningfailnext(:,3));
photometrytuningsfailnextav(newmouse,4)=mean(photometrytuningfailnext(:,4));
photometrytuningsfailnextav(newmouse,5)=mean(photometrytuningfailnext(:,5));


%check how many fails accumulate
if passiveday==0 && habituation==0
    
photometrytuningsrffr1(newmouse,2)=nanmean(photometryrffr1(:,2));

photometrytuningsrffr2(newmouse,1)=nanmean(photometryrffr2(:,1));
photometrytuningsrffr2(newmouse,2)=nanmean(photometryrffr2(:,2));
photometrytuningsrffr2(newmouse,3)=nanmean(photometryrffr2(:,3));
photometrytuningsrffr2(newmouse,4)=nanmean(photometryrffr2(:,4));
photometrytuningsrffr2(newmouse,5)=nanmean(photometryrffr2(:,5));

photometrytuningsrffr3(newmouse,1)=nanmean(photometryrffr3(:,1));
photometrytuningsrffr3(newmouse,2)=nanmean(photometryrffr3(:,2));
photometrytuningsrffr3(newmouse,3)=nanmean(photometryrffr3(:,3));
photometrytuningsrffr3(newmouse,4)=nanmean(photometryrffr3(:,4));
photometrytuningsrffr3(newmouse,5)=nanmean(photometryrffr3(:,5));

photometrytuningsrffr4(newmouse,1)=nanmean(photometryrffr4(:,1));
photometrytuningsrffr4(newmouse,2)=nanmean(photometryrffr4(:,2));
photometrytuningsrffr4(newmouse,3)=nanmean(photometryrffr4(:,3));
photometrytuningsrffr4(newmouse,4)=nanmean(photometryrffr4(:,4));
photometrytuningsrffr4(newmouse,5)=nanmean(photometryrffr4(:,5));

photometrytuningsrffrdiff(newmouse,1:5)=[photometrytuningsrffr4(newmouse,1:5)-photometrytuningsrffr2(newmouse,1:5)];


photometryrfr1av(newmouse,2)=nanmean(photometryrfr1(:,2));

photometryrfr2av(newmouse,1)=nanmean(photometryrfr2(:,1));
photometryrfr2av(newmouse,2)=nanmean(photometryrfr2(:,2));
photometryrfr2av(newmouse,3)=nanmean(photometryrfr2(:,3));
photometryrfr2av(newmouse,4)=nanmean(photometryrfr2(:,4));
photometryrfr2av(newmouse,5)=nanmean(photometryrfr2(:,5));

photometryrfr3av(newmouse,1)=nanmean(photometryrfr3(:,1));
photometryrfr3av(newmouse,2)=nanmean(photometryrfr3(:,2));
photometryrfr3av(newmouse,3)=nanmean(photometryrfr3(:,3));
photometryrfr3av(newmouse,4)=nanmean(photometryrfr3(:,4));
photometryrfr3av(newmouse,5)=nanmean(photometryrfr3(:,5));




%check history effect going into Fails
photometrytuningsrewtofail(newmouse,1)=nanmean(photometryrewtofail(:,1));
photometrytuningsrewtofail(newmouse,2)=nanmean(photometryrewtofail(:,2));
photometrytuningsrewtofail(newmouse,3)=nanmean(photometryrewtofail(:,3));
photometrytuningsrewtofail(newmouse,4)=nanmean(photometryrewtofail(:,4));
photometrytuningsrewtofail(newmouse,5)=nanmean(photometryrewtofail(:,5));

photometrytuningsfailtofail(newmouse,1)=nanmean(photometryfailtofail(:,1));
photometrytuningsfailtofail(newmouse,2)=nanmean(photometryfailtofail(:,2));
photometrytuningsfailtofail(newmouse,3)=nanmean(photometryfailtofail(:,3));
photometrytuningsfailtofail(newmouse,4)=nanmean(photometryfailtofail(:,4));
photometrytuningsfailtofail(newmouse,5)=nanmean(photometryfailtofail(:,5));

end

photometrytuningnextdifferenceav=photometrytuningsfailnextav-photometrytuningrewnextav

%average across mice the history effect

photometrytuningrewlastav(newmouse,1)=mean(photometryrewlast(:,1));
photometrytuningrewlastav(newmouse,2)=mean(photometryrewlast(:,2));
photometrytuningrewlastav(newmouse,3)=mean(photometryrewlast(:,3));
photometrytuningrewlastav(newmouse,4)=mean(photometryrewlast(:,4));
photometrytuningrewlastav(newmouse,5)=mean(photometryrewlast(:,5));

photometrytuningsfaillastav(newmouse,1)=mean(photometryfaillast(:,1));
photometrytuningsfaillastav(newmouse,2)=mean(photometryfaillast(:,2));
photometrytuningsfaillastav(newmouse,3)=mean(photometryfaillast(:,3));
photometrytuningsfaillastav(newmouse,4)=mean(photometryfaillast(:,4));
photometrytuningsfaillastav(newmouse,5)=mean(photometryfaillast(:,5));


photometrytuninglastdifferenceav=photometrytuningsfaillastav-photometrytuningrewlastav


%average across all rew and fail contexts mice enter


photometrytuningsrewallav(newmouse,1)=mean(photometrytuningrewall(:,1));
photometrytuningsrewallav(newmouse,2)=mean(photometrytuningrewall(:,2));
photometrytuningsrewallav(newmouse,3)=mean(photometrytuningrewall(:,3));
photometrytuningsrewallav(newmouse,4)=mean(photometrytuningrewall(:,4));
photometrytuningsrewallav(newmouse,5)=mean(photometrytuningrewall(:,5));

if habituation==0
photometrytuningsfailallav(newmouse,1)=mean(photometrytuningfailall(:,1));
photometrytuningsfailallav(newmouse,2)=mean(photometrytuningfailall(:,2));
photometrytuningsfailallav(newmouse,3)=mean(photometrytuningfailall(:,3));
photometrytuningsfailallav(newmouse,4)=mean(photometrytuningfailall(:,4));
photometrytuningsfailallav(newmouse,5)=mean(photometrytuningfailall(:,5));
end

%
photometrytuningrewoutendav(newmouse,1)=mean(photometrytuningrewoutend(:,1));
photometrytuningrewoutendav(newmouse,2)=mean(photometrytuningrewoutend(:,2));
photometrytuningrewoutendav(newmouse,3)=mean(photometrytuningrewoutend(:,3));
photometrytuningrewoutendav(newmouse,4)=mean(photometrytuningrewoutend(:,4));
photometrytuningrewoutendav(newmouse,5)=mean(photometrytuningrewoutend(:,5));

%
photometrytuningrfailoutendav(newmouse,1)=mean(photometrytuningfailoutend(:,1));
photometrytuningrfailoutendav(newmouse,2)=mean(photometrytuningfailoutend(:,2));
photometrytuningrfailoutendav(newmouse,3)=mean(photometrytuningfailoutend(:,3));
photometrytuningrfailoutendav(newmouse,4)=mean(photometrytuningfailoutend(:,4));
photometrytuningrfailoutendav(newmouse,5)=mean(photometrytuningfailoutend(:,5));


% stop

photometrydiffrewoutav(newmouse,1:10)=nanmean(photometrydiffrewout);
photometrydiffengageav(newmouse,1:10)=nanmean(photometrydiffengage);

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

if habituation==0
if photometryrfr2av(newmouse,:)==0
    photometryrfr2av(newmouse,:)=nan;
end

if photometryrfr3av(newmouse,:)==0
    photometryrfr3av(newmouse,:)=nan;
end
end

% if passiveday==1
% figure
% plot(TIMEitieach,mean(SPEEDitieach))
% figure
% plot(TIMEitieach,mean(OFCitieach))
% figure
% plot(TIMEitieach,mean(ACCitieach))
% figure
% plot(TIMEitieach,mean(AMitieach))
% end
end



end

photodiffrewfailall=photometrytuningsfailallav-photometrytuningsrewallav;
photodiffrewfailstop=photometrytuningsfailstopav-photometrytuningsrewstopav;

filename= ['Quantification']
save(filename)