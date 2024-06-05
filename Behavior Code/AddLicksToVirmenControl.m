
clearvars -except mousemat mousenidaq mousepupil runbehavior runphotometry passiveday pupiltracking trainingday plotpupil nothingday saveplotting habituation plotting

mousename='mouse';

% hello

behaviormean=[];
signalworks=[1 1 1 1 1];

countnullmissed=0;
counthabcontextnoreward=0;
counthabcontextreward=0;
countc2norewardcompile=0;
countc2rewardcompile=0;
countc1norewardcompile=0;
countc1rewardcompile=0;
countc1compile=0;
countc2compile=0;
countreward=0;
countc1compile=0;
countc2compile=0;
countc1rewardcompile=0;
countc2rewardcompile=0;
countc1engagecompile=0;
countc2engagecompile=0;
countanycontext1=0;
countanycontext2=0;
countnullbehavior=0;
countstop=0;
contextx=0;
countc2c2=0;
countcontext1compile=0;
countcontext2compile=0;
countcontextcompile=0;
behavtobehavcorrelations=[];
rewpupilchange=[];
mini1compile=0;
mini2compile=0;
countc2compilelong=0;
next11=0;
next12=0;
next21=0;
next22=0;
miss11=0;
miss12=0;
miss21=0;
miss22=0;
lickless1=0;
lickless2=0;
newrunfail=0;
newrunrew=0;
successtrial=0;
newtbr=0;
after2fail=0;
after1fail=0;
after1rew=0;
afterany=0;
missed1fail=0;
missed2fail=0;

        context211=0;
        context121=0;
        context221=0;
        context122=0;
        context212=0;
        context112=0;
        context11=0;
        context21=0;
        context12=0;
        context22=0;
        countc1compilelong=0;
        countc1rewcompilelong=0;

    
timetonextcontextrewpermouse=[];
timetonextcontextpermouse=[];
pupilspeedlickpre=nan(1000,3);
context12timetoreward=nan(1000,2);
context12speedcompile=nan(1000,2);
context12rewlickcompile=nan(1000,2);
context12timeofstop=nan(1000,2);
context12engagetimecompile=nan(1000,2);
pupilspeedcorrelationscompile=nan(1000,2);
pupillickcorrelationscompile=nan(1000,2);

context12rewspeedcompile=nan(1000,2);
countc2rewardlongcompile=0;

context12antilickcompile=nan(1000,2);
    context12rewpupilchangecompile=nan(1000,2);
    context12rewspeedchangecompile=nan(1000,2);
    timetonextcontextrewcompile=nan(1000,2);
    timetonextcontextcompile=nan(1000,2);
    speedtonextcontextcompile=nan(1000,2);
    context12engagepupilcompile=nan(1000,2);
    context12engagespeedcompile=nan(1000,2);
    crosscorrpupilspeedengage=nan(1000,2);
    contextpupilchangecompile=nan(1000,2);
    context12rewpupilchange3compile=nan(1000,2);
    context12engagelickcompile=nan(1000,2);
    context12nextlickcompile=nan(1000,4);
    context12nextspeedcompile=nan(1000,4);
    timetonextcontext12rewardfear=nan(1000,4);
    
    C1startnospeed=nan(1,150);
    C1startnolick=nan(1,150);
    C1startnopupil=nan(1,150);
    C2startnospeed=nan(1,150);
    C2startnolick=nan(1,150);
    C2startnopupil=nan(1,150);
    C1stopspeed=nan(1,150);
    C1stoplick=nan(1,150);
    C1stoppupil=nan(1,150);
    C1minispeed=nan(1,150);
    C1missC1speed=nan(1,150);
    C1missC1lick=nan(1,150);
    C1missC1pupil=nan(1,150);
    
    C1minilick=nan(1,150);
    C1minipupil=nan(1,150);
    C2stoplick2=nan(1,150);
    C2stoppupil2=nan(1,150);
    C2minispeed=nan(1,150);
    C2minilick=nan(1,150);
    C2minipupil=nan(1,150);
    C1missC2speed=nan(1,150);
    C1missC2lick=nan(1,150);
    C1missC2pupil=nan(1,150);
    context11pupil=nan(1,150);
    
    C2missC1speed=nan(1,150);
    C2missC1lick=nan(1,150);
    C2missC1pupil=nan(1,150);
    C2missC2speed=nan(1,150);
    C2missC2lick=nan(1,150);
    C2missC2pupil=nan(1,150);
    
    C2stopspeed=nan(1,150);
    C2stoplick=nan(1,150);
    C2stoppupil=nan(1,150);
    C2stopspeed2=nan(1,150);
    C2stoplick2=nan(1,150);
    C2stoppupil2=nan(1,150);
    newplot=0;
    context211lick=nan(1,150);
    context211speed=nan(1,150);
    context211pupil=nan(1,150);
    context221lick=nan(1,150);
    context221speed=nan(1,150);
    context221pupil=nan(1,150);
    context121lick=nan(1,150);
    context121speed=nan(1,150);
    context121pupil=nan(1,150);
    
    C2rewardspeed=nan(1,150);
    C2rewardlick=nan(1,150);
    C2rewardpupil=nan(1,150);
    
    C2startrewspeed=nan(1,150);
    C2startrewlick=nan(1,150);
    C2startrewpupil=nan(1,150);
    
    C2engagespeed=nan(1,150);
    C2engagelick=nan(1,150);
    C2engagepupil=nan(1,150);
    
    
    context212lick=nan(1,150);
    context212speed=nan(1,150);
    context212pupil=nan(1,150);
    context122lick=nan(1,150);
    context122speed=nan(1,150);
    context122pupil=nan(1,150);
    context112lick=nan(1,150);
    context112speed=nan(1,150);
    context112pupil=nan(1,150);
    
    context11licktrace=nan(1,150);
    context11speedtrace=nan(1,150);
    context22licktrace=nan(1,150);
    context22speedtrace=nan(1,150);
    
%----------For Mouse B Training (past 10/23)----
% timecolumn=2;
% xcolumn=3;
% ycolumn=4;
% cue1column=6;
% cue2column=7;
% cue3column=8;
% watercolumn=9;
% sucrosecolumn=10;
% acidcolumn=11;
% outcomecolumn=15;
% speedcolumn=14;
% lickcolumn=17;
% trialcolumn=19;
% contextx=20;
% photometryindex=24;
%----------For habituation Mouse B/NewCohort VT----
timecolumn=1;
trialtimecolumn=2;
ycolumn=3;
xcolumn=4;
speedcolumn=5;
visualcolumn=6;
tonecolumn=7;
odorcolumn=8;
watercolumn=9;
sucrosecolumn=10;
acidcolumn=10;
puffon=11;
cuesequence=12;
trialtypes=13;
trialcolumn=14;
originalspeedcolumn=17;
%----------For New Cohort Training (past 10/23)----
% timecolumn=1;
% xcolumn=2;
% ycolumn=3;
% cue1column=5;
% cue2column=6;
% cue3column=7;
% watercolumn=8;
% sucrosecolumn=9;
% acidcolumn=10;
% outcomecolumn=11;
% contextnumcolumn=15;
% speedcolumn=16;
% lickcolumn=17;
% trialcolumn=`8;
% photometryindex=21;

%----------For New Cohort Training (past 10/23)----

% timecolumn=1;
% xcolumn=2;
% ycolumn=3;
% cue1column=5;
% cue2column=6;
% cue3column=7;
% watercolumn=8;
% sucrosecolumn=9;
% acidcolumn=10;
% outcomecolumn=11;
% contextnumcolumn=15;
% speedcolumn=16;
% lickcolumn=17;

%use filenames that we'll loop through
filenames_MAT = mousemat;
filenames_NIDAQ = mousenidaq;

%duration to take lick data
lickBinDur = 500;
lickfactor = 1000 / lickBinDur;

%points to take around for averaging (units of linBinDur)
window_size = 8; %samples = ms 

%amnt of time after room entrance to take lick data for summary plots
secondsToTake = 30; %can do short time here for full cues days
valFinal = 10; %this is for calculating the final room lick rate, which we should probably just not collect


%if plotting raw lick data
manydaycount = 0;

for ii=1:length(filenames_MAT)
    %load the files iteratively, do analysis, then redo on next file.
    manydaycount = manydaycount + 1;
    countcontextcompile = countcontextcompile+30;
    countcontext1compile = (100 * (ii-1));
    countcontext2compile = (100 * (ii-1));
    dataMAT = load(filenames_MAT{ii});
    nidaqdata = fopen(filenames_NIDAQ{ii},'r'); %Open file for reading
    [dataNIDAQ,countmilk] = fread(nidaqdata,[5,inf],'double');
    fclose(nidaqdata);
    t = dataNIDAQ(1,:); %first row is time
    ch = dataNIDAQ(2:5,:); %each channel is a row
    
    %find lick events(Look through time row (ch1) and find peaks that have
    %an prominance of atleast 0.4., are 50 units aparts and a height of
    %3.9. 
    [lickPks,lickLocs] = findpeaks(diff(ch(1,:)),'MinPeakProminence',.4,'MinPeakDistance',50,'MinPeakHeight',3.5);

     figure; plot(ch(1,:),'-m'); %Time is plotted in maroon(-m)
     hold on
     plot(lickLocs(1,:),lickPks(1,:),'*','markersize',4) %(lickLOc(time of lick), LickPeak (intesity of peak)) are in blue
         
    %LickVect marks the location of the licks with ones
    lickVect = zeros(1,length(ch(1,:)));
    lickVect(lickLocs) = 1; 
    
    [imgPks,imgLocs]=findpeaks(diff(ch(2,:)),'MinPeakProminence',.4,'MinPeakDistance',30);
    
%      figure; plot(ch(2,:),'-m'); %Time is plotted in maroon(-m)
%      hold on
%      plot(imgLocs(1,:),imgPks(1,:),'*','markersize',4)
%      
      binranges = 0:lickBinDur:length(lickVect);    %Start @ 0, step by 500 and stop at the # of col in lickVect
      bincounts = histc(lickLocs,binranges);
%      figure; bar(binranges,bincounts*lickfactor,'histc'); title('lick counts 1s bins')
%      xlabel('milliseconds')
%      ylabel('lick rate (Hz)')
    
%     %moving average
%     figure
     avgRate=tsmovavg(bincounts,'s',window_size,2);
% %     plot(binranges,avgRate*lickfactor,'b')
%     hold on
%     vline(airPuffLocs*1000,'--g') %convert airpuff locations to milliseconds
%     
    %room stuff:
    %set first room = 1; this should be more flexible in future
    dataMAT.exper.M(1,4)=1;
    
    roomInfo=dataMAT.exper.M(:,4);
    roomStarts=find(dataMAT.exper.M(:,4)>0);
    roomIDs=dataMAT.exper.M(roomStarts,end-1); %for files before 9.25.2017, this should be (roomStarts,6)
    roomTimes=dataMAT.exper.M(roomStarts,1);
    roomTimesMilliseconds=roomTimes*1000; %these are pretty precise, so multiply by 1000 for ms, now comparable to
    allRoomData=[roomIDs,roomTimes,roomTimesMilliseconds]; %room number, roomEnterTime in seconds
     
    for j=1:length(dataMAT.exper.M(:,3))
    if dataMAT.exper.M(j,3)>0 & dataMAT.exper.M(j,3)<100
        dataMAT.exper.M(j,3)=dataMAT.exper.M(j,3)-20;
    end
    if dataMAT.exper.M(j,3)>100 & dataMAT.exper.M(j,3)<200
        dataMAT.exper.M(j,3)=dataMAT.exper.M(j,3)-120;
    end
    if dataMAT.exper.M(j,3)>200 & dataMAT.exper.M(j,3)<300
        dataMAT.exper.M(j,3)=dataMAT.exper.M(j,3)-220;
    end
end
    
    posTimes=dataMAT.exper.M(roomStarts,3);
    allPosData=[roomIDs,posTimes];
%     vline(roomTimesMilliseconds,'-r')
    
    %now allRoomData has all the room data..ID, times, and times in ms
    %you could plot everything now but you'd have 45 unique rooms (vertical
    %lines over lick rate)  
    
         avgRate(2,:)=binranges/1000; %the second row of avgRate will be the time in virmen seconds
     avgRate(1,:)=avgRate(1,:)*lickfactor;
     lickLocsSeconds=lickLocs./1000;
     imgLocsSeconds=imgLocs./1000;
    
     
     %%%%%%%post processing
     
     
dataMAT=load(filenames_MAT{ii});
behavior=dataMAT.exper.M;
behavior(:,end+1)=0;
rooms=max(behavior(:,end-1));




% % %LICKS FROM ARDUINO TO SHEET%%

%%%%for data before 7/11
% [framePks,frameLocs]=findpeaks(diff(ch(3,:)),'MinPeakProminence',.4,'MinPeakDistance',30)
% if numel(frameLocs)==2
%     timeatend=behavior(find(behavior(:,4)>0,1, 'last')+1, timecolumn)
%     timelastexposure=dataNIDAQ(1, (find(ch(3,:)>2,1, 'last')))
%     differencetime=timelastexposure-timeatend
% elseif numel(frameLocs)==1
% turnfirstexposure = dataNIDAQ(1,frameLocs(end));
% timeat50 = behavior(50,timecolumn);
% differencetime = turnfirstexposure - timeat50
% end
%%%

%%%%for data on/after 7/11
turnfirstexposure=dataNIDAQ(1,find(dataNIDAQ(4,:)>1,1,'first'));
timeat50=behavior(50,timecolumn);
differencetime=turnfirstexposure-timeat50;
%%%



lickLocsSeconds(1,:) = lickLocsSeconds(1,:) - differencetime;
imgLocsSeconds(1,:) = imgLocsSeconds(1,:) - differencetime;


%%%%%%%%%%%

    %Mark when the licks occur in the behavior in a new column
[size_row, size_col] = size(behavior);
confirm_lick = zeros(size_row,1);

time = behavior(:,timecolumn);
lickLocsSeconds_vertical = transpose(lickLocsSeconds);

lickcolumn=numel(behavior(1,:))+1;

for j = 1:length(lickLocsSeconds_vertical)
    for i = 2:length(time)
        if lickLocsSeconds_vertical(j) <= time(i) && lickLocsSeconds_vertical(j) >= time(i-1)
            confirm_lick(i) = 1;
        end
    end
end
behavior(:,lickcolumn)=confirm_lick; 



%%%%%%%%%%%%%%%%%%%%%%%%  ANALYSIS OF LICKS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

number_licks=nan(200,3);
lick_counter=0;
% successtrial=nan(200,3);
trial_missed_null=0;
trial_missed=0;
trial_correct=0;
lickrate_reward_on=nan(200,1);
lickrate_null=nan(200,3);
anticipatory_lickrate=nan(200,1);
antilickrate=0;

% %Clustering
% diff = 0;
% cluster = 0;
% lick_counter = 1;
% ck_once = 0;

% water = behavior(:,8);
% sucrose = behavior(:,9);
% acid = behavior(:,10);
% cluster_marker = NaN(size_row, 1);
% lick = find(confirm_lick == 1);
% lick_counter_cluster=0;

%newspeed=zscore(behavior(:,speedcolumn))-min(zscore(behavior(:,speedcolumn)));
%behavior(:,speedcolumn)=newspeed;

behavior(behavior(:,5)<0,5)=0;
lickrate=[];
%%%Calulate and add lickrates?
count=0;
for a=50:numel(behavior(1:end,1))
count=count+1;
b=find(behavior(:,1)<behavior(a,1)-1,1,'last');
lickrate(a,1)=sum(behavior(b:a,end))/(behavior(a,1)-behavior(b,1));
end

behavior(:,end+1)=lickrate;

lickcolumn=numel(behavior(1,:));


%behavior(:,end+1)=lickrate(:,1);
%Normalize speed and signals

speedsignal=[];
speedsignal=behavior(:,5)';
originalspeedsignal=behavior(:,5)';
threshold=nanmean(speedsignal)+7*nanstd(speedsignal)
for i=1:numel(speedsignal)
    if speedsignal(i)>threshold
%         speedsignal(i)=0;
    end
end



speedsignal=speedsignal(~isnan(speedsignal));
speedsignal=zscore(speedsignal);
lowest=min(zscore(speedsignal));
speedsignal=speedsignal-lowest;
max(speedsignal)
behavior(1:numel(speedsignal),5)=speedsignal;
behavior(1:numel(originalspeedsignal),originalspeedcolumn)=originalspeedsignal;

differencetime;


behavior(1:end,end+1)=0;
pupilcolumn=20;



engagethreshold=mean(behavior(find(behavior(:,originalspeedcolumn)==2),5))
engagethresholdcompile(ii)=mean(behavior(find(behavior(:,originalspeedcolumn)==1),5))
if  engagethresholdcompile(ii)>1.5
%    hello
end
%%%Determine what x value is for null, whether in training or no, in order to calculate stops in future

    stopthreshold=1;
    
    
    trialnumber=1;
%     for i=3:numel(behavior(:,1))
%         behavior(i-2,14)=trialnumber;
%         if behavior(i-1,4)-behavior(i,4)==-40 || behavior(i-1,4)-behavior(i,4)==40 || behavior(i-1,6)-behavior(i,6)==1
%             trialnumber=trialnumber+1;
%         end
%     end

%%%%check if nidaq stopped running at some point
if runbehavior==1
newbehavior=[];

timegap(ii,1)=behavior(end,1)-dataNIDAQ(1,end)

for i=1:numel(behavior(:,1))
    if behavior(i,1)<=dataNIDAQ(1,end)
        newbehavior(i,:)=behavior(i,:);
    end
    
end
behavior=newbehavior;

timegap(ii,2)=behavior(end,1)-dataNIDAQ(1,end)
end

%%%%engagement column create%%%%
engagementcolumn=numel(behavior(1,:))+1;
counttimes=0;
behavior(:,engagementcolumn)=0;

for i=1:numel(behavior(:,1))
            
    if behavior(i,17)<1
        counttimes=counttimes+1;
        timer(counttimes)=behavior(i,1);
    end
        if behavior(i,17)>=1 && timer(end)-timer(1)>=1
            endofrun=find(behavior(i:end,17)<1,1,'first')+i-1;
            startofnextrun=find(behavior(endofrun:end,17)>=1,1,'first')+endofrun-1;
            
            
            if ~isempty(endofrun) && ~isempty(startofnextrun)
            if behavior(endofrun,1)-behavior(i,1)>=1
                behavior(i,engagementcolumn)=1;
                counttimes=0;
                timer=0;
            end
            
            checkrew=behavior(i:endofrun,13)==1;
            checkfail=behavior(i:endofrun,13)==2;
            checkcues=behavior(i:endofrun,6)==1;
            checkfailrun=checkfail+checkcues;
            checkrewrun=checkrew+checkcues;
            
            
    currenttrial=behavior(i,14);
    previousreward=find(behavior(1:i,9)==1,1,'last');
    
    if ~isempty(previousreward) && currenttrial>1 && behavior(previousreward,14)==currenttrial-1 %&& behavior(startofnextrun,1)-behavior(endofrun,1)>=2
        
            %check for engagements that lead to running out OR runnings >1s
            %in context
            if behavior(i,13)==2 && checkcues(1)==0 && any(checkcues)==1  %any(checkfailrun == 2) && checkfailrun(1)==1 %|| checkfailrun(1)==2 && behavior(endofrun,1)-behavior(i,1)>1
                
                newrunfail=newrunfail+1;
                runtimesfail(newrunfail)=behavior(endofrun,1)-behavior(i,1);
                
            %plot the successfultrials (ie run out fail to reward)
                            if runtimesfail(newrunfail)>5 && checkfail(1)==1 && checkrewrun(end)==2
                            successtrial=successtrial+1;
%                             run('PlotSuccess')
                            end
                            
%                 if runtimesfail(newrunfail)<2
%                     hello
%                 end
            end
            if behavior(i,13)==1 && checkcues(1)==0 && any(checkcues)==1 %&& any(checkrewrun == 2) && checkrewrun(1)==1 %|| checkrewrun(1)==2 && behavior(endofrun,1)-behavior(i,1)>1
                newrunrew=newrunrew+1;
                runtimesrew(newrunrew)=behavior(endofrun,1)-behavior(i,1);
                
            end
            
    end
                
            end
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%check times between rewards%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diff(behavior(:,9))
timebetweenrewards=diff(behavior(find(diff(behavior(:,9))==1),1));
checkfail1=0;
checkfail2=0;
checkreward1=0;
checkreward2=0;
rewardwon=[0 0];
rewardwonreward=[0 0];
rewardwonfail=[0 0];
failwon=[0 0];
failwonreward=[0 0];
failwonfail=[0 0];
missedfail(ii,:)=[0 0 0 0];

trialnumbers=unique(behavior(:,14))

for i=1:trialnumbers(end)-1
    
    a=behavior(:,14)==trialnumbers(i);
    b=behavior(:,6)==1;
    
    trialcuestartpos(i)=find(and(a,b),1,'first');
    
    trialcueendpos(i)=find(and(a,b),1,'last');

    trialcuestarttype(i)=behavior(trialcuestartpos(i),13);
    trialcuestarttimes(i)=behavior(trialcuestartpos(i),1);
    trialcueendtimes(i)=behavior(trialcueendpos(i),1);
    
    if trialcueendtimes(i)-trialcuestarttimes(i)>5
    trialoutcome(i)=1;
    else
        trialoutcome(i)=0;
    end
    
    
    
    if i>4
        %check reward after 2 fails
        if trialcuestarttype(i)==1 && trialcuestarttype(i-1)==2 && trialcuestarttype(i-2)==2
            after2fail=after2fail+1;
            time221(after2fail)=trialcuestarttimes(i)-trialcueendtimes(i-3);
        end
        %check reward after 1 fail
        if trialcuestarttype(i)==1 && trialcuestarttype(i-1)==2 && trialcuestarttype(i-2)==1
            after1fail=after1fail+1;
            time121(after1fail)=trialcuestarttimes(i)-trialcueendtimes(i-2);
        end
        %check reward after 1 reward
        if trialcuestarttype(i)==1 && trialcuestarttype(i-1)==1 && trialcuestarttype(i-2)==2
            after1rew=after1rew+1;
            time211(after1rew)=trialcuestarttimes(i)-trialcueendtimes(i-1);
        end
        %check timebetween any context
            afterany=afterany+1;
            timeany(afterany)=trialcuestarttimes(i)-trialcueendtimes(i-1);
        
        
        %received reward (current trial)
            if trialcueendtimes(i)-trialcuestarttimes(i)>5 && trialcuestarttype(i)==1
                %missed failure (prev trial)
                if trialcueendtimes(i-1)-trialcuestarttimes(i-1)<5 && trialcuestarttype(i-1)==2
                    %received reward (prev prev trial)
                    if trialcueendtimes(i-2)-trialcuestarttimes(i-2)>5 && trialcuestarttype(i-2)==1
                    missed1fail=missed1fail+1;
                    end
                    %missed failure on prev prev trial
                    if trialcueendtimes(i-2)-trialcuestarttimes(i-2)<5 && trialcuestarttype(i-2)==2
                    %received reward (prev prev trial)
                        if trialcueendtimes(i-3)-trialcuestarttimes(i-3)>5 &&trialcuestarttype(i-3)==1
                        missed2fail=missed2fail+1;
                        end
                    end
                end
            end
            
            %in failure after a failure
            if trialcuestarttype(i)==2 && trialcuestarttype(i-1)==2
                missedfail(ii,1)=missedfail(ii,1)+1;
                %missed both
                if trialcueendtimes(i)-trialcuestarttimes(i)<5 && trialcueendtimes(i-1)-trialcuestarttimes(i-1)<5
                missedfail(ii,2)=missedfail(ii,2)+1;
                %missed one
                elseif trialcueendtimes(i)-trialcuestarttimes(i)>5 && trialcueendtimes(i-1)-trialcuestarttimes(i-1)<5
                missedfail(ii,3)=missedfail(ii,3)+1;
                %missed one
                elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 && trialcueendtimes(i-1)-trialcuestarttimes(i-1)>5
                missedfail(ii,3)=missedfail(ii,3)+1;
                %missed none
                elseif trialcueendtimes(i)-trialcuestarttimes(i)>5 && trialcueendtimes(i-1)-trialcuestarttimes(i-1)>5
                missedfail(ii,4)=missedfail(ii,4)+1;
                end
                
            end
            
             
                        %plot MANY unsuccessful trials (ie get fail and reward)
    if i>10
    if trialoutcome(i-10:i)==1
%         run('PlotUnSuccess')
%         hello
    end
    end
            
    end
       
    
%%%Just basic Run/Stop DI calculations

%check rewards all
if trialcuestarttype(i)==1
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        rewardwon(1)=rewardwon(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        rewardwon(2)=rewardwon(2)+1;
    end
end
%check reward after reward
if i>1 && trialcuestarttype(i)==1 && trialcuestarttype(i-1)==1
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        rewardwonreward(1)=rewardwonreward(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        rewardwonreward(2)=rewardwonreward(2)+1;
    end
end
%check reward after fail
if i>1 && trialcuestarttype(i)==1 && trialcuestarttype(i-1)==2
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        rewardwonfail(1)=rewardwonfail(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        rewardwonfail(2)=rewardwonfail(2)+1;
    end
end

%check fails all
if trialcuestarttype(i)==2
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        failwon(1)=failwon(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        failwon(2)=failwon(2)+1;
    end
end
%check fails after reward
if i>1 && trialcuestarttype(i)==2 && trialcuestarttype(i-1)==1
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        failwonreward(1)=failwonreward(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        failwonreward(2)=failwonreward(2)+1;
    end
end
%check fails after fail
if i>1 && trialcuestarttype(i)==2 && trialcuestarttype(i-1)==2
    if trialcueendtimes(i)-trialcuestarttimes(i)>5 
        failwonfail(1)=failwonfail(1)+1;
    elseif trialcueendtimes(i)-trialcuestarttimes(i)<5 
        failwonfail(2)=failwonfail(2)+1;
    end
end
    

end
    
%runstop DI for all
ct=rewardwon(1)+failwon(2);
it=rewardwon(2)+failwon(1);
all=ct+it;
runstopDIall(ii,1)=(ct-it)/all;
%runstopDI for after reward
ct=rewardwonreward(1)+failwonreward(2);
it=rewardwonreward(2)+failwonreward(1);
all=ct+it;
runstopDIall(ii,2)=(ct-it)/all;
%runstopDI for after fail
ct=rewardwonfail(1)+failwonfail(2);
it=rewardwonfail(2)+failwonfail(1);
all=ct+it;
runstopDIall(ii,3)=(ct-it)/all;

% runfailall(ii,1)=(failwon(2)/(failwon(1)+failwon(2)))*100;
% runfailall(ii,2)=(failwonreward(2)/(failwonreward(1)+failwonreward(2)))*100;
% runfailall(ii,3)=(failwonfail(2)/(failwonfail(1)+failwonfail(2)))*100;

runfailall(ii,1)=(missedfail(ii,2 )/missedfail(ii,1))*100;
runfailall(ii,2)=(missedfail(ii,3)/missedfail(ii,1))*100;
runfailall(ii,3)=(missedfail(ii,4)/missedfail(ii,1))*100;


if runbehavior==1
run('BehaviorAnalysisControlOld')
elseif runphotometry==1
run('PhotometryAlign')
run('PhotometryStructureControl')
end

% if pupiltracking==1
% behaviormean(1:3,ii)=[nanmean(behavior(:,originalspeedcolumn)) nanmean(behavior(:,lickcolumn)) nanmean(pupil_diam(1:end-1))]
% end

end



if runbehavior==1
filename= 'onlybehavior.mat'
save(filename)
run('BehaviorPlotControl')
% run('BehaviorHeatmapPlots')
% elseif runphotometry==1
% run('PhotometryStructurePlotControl')
% run('BehaviorPhotoCorrelations')
end

figure
subplot(1,2,1)
edges=[0:1:10]
histogram(runtimesrew,edges,'Normalization','probability')
line([mean(runtimesrew) mean(runtimesrew)],[0 0.5],'color',[0 0 0], 'LineWidth',.25)
title('Run Times (Reward)')
subplot(1,2,2)
edges=[0:1:10]
histogram(runtimesfail,edges,'Normalization','probability')
line([mean(runtimesfail) mean(runtimesfail)],[0 0.5],'color',[0 0 0], 'LineWidth',.25)
title('Run Times (Failure)')
saveas(gcf,'RunTimes.png')

figure
subplot(1,3,1)
edges=[1:4:100]
histogram(timeany,edges,'Normalization','probability')
line([mean(time211) mean(time211)],[0 0.5],'color',[0 0 0], 'LineWidth',.25)
title('Time Between Reward (1->1)')
subplot(1,3,2)
edges=[1:4:100]
histogram(time121,edges,'Normalization','probability')
line([mean(time121) mean(time121)],[0 0.5],'color',[0 0 0], 'LineWidth',.25)
title('Time Between Reward (1->2->1)')
subplot(1,3,3)
edges=[1:4:100]
histogram(time221,edges,'Normalization','probability')
line([mean(time221) mean(time221)],[0 0.5],'color',[0 0 0], 'LineWidth',.25)
title('Time Between Reward (1->2->2->1)')
set(gcf, 'Position',  [250, 750, 1000, 300])
saveas(gcf,'TimeBtwRew.png')

propmiss=[missed1fail/after1fail missed2fail/after2fail]