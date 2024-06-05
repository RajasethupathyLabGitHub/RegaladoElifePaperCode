%%%%
%make the graphs
%find the mean and sem for speed, lick, pupil, for context, reward, post, engage
%%%%

clear all
clear all

close all
close all


load 'onlybehavior.mat'


% hello

speedc1connoav=nan(1,150);
speedc2connoav=nan(1,150);
speedc1connoav=nan(1,150);
speedc2connoav=nan(1,150);

lickc1connoav=nan(1,150);
lickc2connoav=nan(1,150);
lickc1connoav=nan(1,150);
lickc2connoav=nan(1,150);

pupilc1connoav=nan(1,150);
pupilc2connoav=nan(1,150);
pupilc1connoav=nan(1,150);
pupilc2connoav=nan(1,150);

% C1missC2speed=nan(1,150);
% C1missC2lick=nan(1,150);
% C1missC2pupil=nan(1,150);

if passiveday==1
for row=1:numel(C1startpupil(:,1))
    C1startpupil(row,:)=C1startpupil(row,:)-C1startpupil(row,76);
end
 
for row=1:numel(C2startpupil(:,1)) 
    C2startpupil(row,:)=C2startpupil(row,:)-C2startpupil(row,76);
end
end

% for row=1:numel(C1rewardpupil(:,1))
%     C1rewardpupil(row,:)=C1rewardpupil(row,:)-C1rewardpupil(row,26);
% end
% 
% for row=1:numel(C2rewardpupil(:,1))
%     C2rewardpupil(row,:)=C2rewardpupil(row,:)-C2rewardpupil(row,26);
% end

for index=1:150
    speedc1conav(index,1)=nanmean(C1startspeed(:,index));
    speedc1conav(index,2)=nanstd(C1startspeed(:,index))/sqrt(length(C1startspeed(:,index)));
    speedc1rewav(index,1)=nanmean(C1rewardspeed(:,index));
    speedc1rewav(index,2)=nanstd(C1rewardspeed(:,index))/sqrt(length(C1rewardspeed(:,index)));
%     speedc1lickav(index,1)=nanmean(C1lesslickspeed(:,index));
%     speedc1lickav(index,2)=nanstd(C1lesslickspeed(:,index))/sqrt(length(C1lesslickspeed(:,index)));
    
    lickc1conav(index,1)=nanmean(C1startlick(:,index));
    lickc1conav(index,2)=nanstd(C1startlick(:,index))/sqrt(length(C1startlick(:,index)));
    lickc1rewav(index,1)=nanmean(C1rewardlick(:,index));
    lickc1rewav(index,2)=nanstd(C1rewardlick(:,index))/sqrt(length(C1rewardlick(:,index)));
%     lickc1lickav(index,1)=nanmean(C1lesslicklick(:,index));
%     lickc1lickav(index,2)=nanstd(C1lesslicklick(:,index))/sqrt(length(C1lesslicklick(:,index)));
    
    

        
        if habituation==0
    context211lickav(index,1)=nanmean(context211lick(:,index));
    context211lickav(index,2)=nanstd(context211lick(:,index))/sqrt(length(context211lick(:,index)));
    context121lickav(index,1)=nanmean(context121lick(:,index));
    context121lickav(index,2)=nanstd(context121lick(:,index))/sqrt(length(context121lick(:,index)));
    context221lickav(index,1)=nanmean(context221lick(:,index));
    context221lickav(index,2)=nanstd(context221lick(:,index))/sqrt(length(context221lick(:,index)));
    
    context211speedav(index,1)=nanmean(context211speed(:,index));
    context211speedav(index,2)=nanstd(context211speed(:,index))/sqrt(length(context211speed(:,index)));
    context121speedav(index,1)=nanmean(context121speed(:,index));
    context121speedav(index,2)=nanstd(context121speed(:,index))/sqrt(length(context121speed(:,index)));
    context221speedav(index,1)=nanmean(context221speed(:,index));
    context221speedav(index,2)=nanstd(context221speed(:,index))/sqrt(length(context221speed(:,index)));
    
    context211pupilav(index,1)=nanmean(context211pupil(:,index));
    context211pupilav(index,2)=nanstd(context211pupil(:,index))/sqrt(length(context211pupil(:,index)));
    context121pupilav(index,1)=nanmean(context121pupil(:,index));
    context121pupilav(index,2)=nanstd(context121pupil(:,index))/sqrt(length(context121pupil(:,index)));
    context221pupilav(index,1)=nanmean(context221pupil(:,index));
    context221pupilav(index,2)=nanstd(context221pupil(:,index))/sqrt(length(context221pupil(:,index)));

    
    %%%%
    
    context122lickav(index,1)=nanmean(context122lick(:,index));
    context122lickav(index,2)=nanstd(context122lick(:,index))/sqrt(length(context122lick(:,index)));
    context212lickav(index,1)=nanmean(context212lick(:,index));
    context212lickav(index,2)=nanstd(context212lick(:,index))/sqrt(length(context212lick(:,index)));
    context112lickav(index,1)=nanmean(context112lick(:,index));
    context112lickav(index,2)=nanstd(context112lick(:,index))/sqrt(length(context112lick(:,index)));
    
    context122speedav(index,1)=nanmean(context122speed(:,index));
    context122speedav(index,2)=nanstd(context122speed(:,index))/sqrt(length(context122speed(:,index)));
    context212speedav(index,1)=nanmean(context212speed(:,index));
    context212speedav(index,2)=nanstd(context212speed(:,index))/sqrt(length(context212speed(:,index)));
    context112speedav(index,1)=nanmean(context112speed(:,index));
    context112speedav(index,2)=nanstd(context112speed(:,index))/sqrt(length(context112speed(:,index)));
    
    context122pupilav(index,1)=nanmean(context122pupil(:,index));
    context122pupilav(index,2)=nanstd(context122pupil(:,index))/sqrt(length(context122pupil(:,index)));
    context212pupilav(index,1)=nanmean(context212pupil(:,index));
    context212pupilav(index,2)=nanstd(context212pupil(:,index))/sqrt(length(context212pupil(:,index)));
    context112pupilav(index,1)=nanmean(context112pupil(:,index));
    context112pupilav(index,2)=nanstd(context112pupil(:,index))/sqrt(length(context112pupil(:,index)));

%%%%

    context11lickav(index,1)=nanmean(context11licktrace(:,index));
    context11lickav(index,2)=nanstd(context11licktrace(:,index))/sqrt(length(context11licktrace(:,index)));
    context11speedav(index,1)=nanmean(context11speedtrace(:,index));
    context11speedav(index,2)=nanstd(context11speedtrace(:,index))/sqrt(length(context11speedtrace(:,index)));
    context11pupilav(index,1)=nanmean(context11pupil(:,index));
    context11pupilav(index,2)=nanstd(context11pupil(:,index))/sqrt(length(context11pupil(:,index)));

    context21lickav(index,1)=nanmean(context21licktrace(:,index));
    context21lickav(index,2)=nanstd(context21licktrace(:,index))/sqrt(length(context21licktrace(:,index)));
    context21speedav(index,1)=nanmean(context21speedtrace(:,index));
    context21speedav(index,2)=nanstd(context21speedtrace(:,index))/sqrt(length(context21speedtrace(:,index)));
    context21pupilav(index,1)=nanmean(context21pupil(:,index));
    context21pupilav(index,2)=nanstd(context21pupil(:,index))/sqrt(length(context21pupil(:,index)));


    context12lickav(index,1)=nanmean(context12licktrace(:,index));
    context12lickav(index,2)=nanstd(context12licktrace(:,index))/sqrt(length(context12licktrace(:,index)));
    context12speedav(index,1)=nanmean(context12speedtrace(:,index));
    context12speedav(index,2)=nanstd(context12speedtrace(:,index))/sqrt(length(context12speedtrace(:,index)));
    context12pupilav(index,1)=nanmean(context12pupil(:,index));
    context12pupilav(index,2)=nanstd(context12pupil(:,index))/sqrt(length(context12pupil(:,index)));

    context22lickav(index,1)=nanmean(context22licktrace(:,index));
    context22lickav(index,2)=nanstd(context22licktrace(:,index))/sqrt(length(context22licktrace(:,index)));
    context22speedav(index,1)=nanmean(context22speedtrace(:,index));
    context22speedav(index,2)=nanstd(context22speedtrace(:,index))/sqrt(length(context22speedtrace(:,index)));
    context22pupilav(index,1)=nanmean(context22pupil(:,index));
    context22pupilav(index,2)=nanstd(context22pupil(:,index))/sqrt(length(context22pupil(:,index)));
    
        end
    
    %%%%
    
    pupilc1conav(index,1)=nanmean(C1startpupil(:,index));
    pupilc1conav(index,2)=nanstd(C1startpupil(:,index))/sqrt(length(C1startpupil(:,index)));
    pupilc1rewav(index,1)=nanmean(C1rewardpupil(:,index));
    pupilc1rewav(index,2)=nanstd(C1rewardpupil(:,index))/sqrt(length(C1rewardpupil(:,index)));
%     pupilc1lickav(index,1)=nanmean(C1lesslickpupil(:,index));
%     pupilc1lickav(index,2)=nanstd(C1lesslickpupil(:,index))/sqrt(length(C1lesslickpupil(:,index)));
    
    if passiveday==0
    speedc1conrewav(index,1)=nanmean(C1startrewspeed(:,index));
    speedc1conrewav(index,2)=nanstd(C1startrewspeed(:,index))/sqrt(length(C1startrewspeed(:,index)));
    lickc1conrewav(index,1)=nanmean(C1startrewlick(:,index));
    lickc1conrewav(index,2)=nanstd(C1startrewlick(:,index))/sqrt(length(C1startrewlick(:,index)));
    pupilc1conrewav(index,1)=nanmean(C1startrewpupil(:,index));
    pupilc1conrewav(index,2)=nanstd(C1startrewpupil(:,index))/sqrt(length(C1startrewpupil(:,index)));
    
    speedc1connoav(index,1)=nanmean(C1startnospeed(:,index));
    speedc1connoav(index,2)=nanstd(C1startnospeed(:,index))/sqrt(length(C1startnospeed(:,index)));
    lickc1connoav(index,1)=nanmean(C1startnolick(:,index));
    lickc1connoav(index,2)=nanstd(C1startnolick(:,index))/sqrt(length(C1startnolick(:,index)));
    pupilc1connoav(index,1)=nanmean(C1startnopupil(:,index));
    pupilc1connoav(index,2)=nanstd(C1startnopupil(:,index))/sqrt(length(C1startnopupil(:,index)));
    
    end
    
    if trainingday==1
    

    speedc2conav(index,1)=nanmean(C2startspeed(:,index));
    speedc2conav(index,2)=nanstd(C2startspeed(:,index))/sqrt(length(C2startspeed(:,index)));
    speedc2rewav(index,1)=nanmean(C2rewardspeed(:,index));
    speedc2rewav(index,2)=nanstd(C2rewardspeed(:,index))/sqrt(length(C2rewardspeed(:,index)));
%     speedc2lickav(index,1)=nanmean(C2lesslickspeed(:,index));
%     speedc2lickav(index,2)=nanstd(C2lesslickspeed(:,index))/sqrt(length(C2lesslickspeed(:,index)));
    
    
    lickc2conav(index,1)=nanmean(C2startlick(:,index));
    lickc2conav(index,2)=nanstd(C2startlick(:,index))/sqrt(length(C2startlick(:,index)));
    lickc2rewav(index,1)=nanmean(C2rewardlick(:,index));
    lickc2rewav(index,2)=nanstd(C2rewardlick(:,index))/sqrt(length(C2rewardlick(:,index)));
%     lickc2lickav(index,1)=nanmean(C2lesslicklick(:,index));
%     lickc2lickav(index,2)=nanstd(C2lesslicklick(:,index))/sqrt(length(C2lesslicklick(:,index)));
    
    
    pupilc2conav(index,1)=nanmean(C2startpupil(:,index));
    pupilc2conav(index,2)=nanstd(C2startpupil(:,index))/sqrt(length(C2startpupil(:,index)));
    pupilc2rewav(index,1)=nanmean(C2rewardpupil(:,index));
    pupilc2rewav(index,2)=nanstd(C2rewardpupil(:,index))/sqrt(length(C2rewardpupil(:,index)));
%     pupilc2lickav(index,1)=nanmean(C2lesslickpupil(:,index));
%     pupilc2lickav(index,2)=nanstd(C2lesslickpupil(:,index))/sqrt(length(C2lesslickpupil(:,index)));
    
    if passiveday==0
    speedc2conrewav(index,1)=nanmean(C2startrewspeed(:,index));
    speedc2conrewav(index,2)=nanstd(C2startrewspeed(:,index))/sqrt(length(C2startrewspeed(:,index)));
    speedc2connoav(index,1)=nanmean(C2startnospeed(:,index));
    speedc2connoav(index,2)=nanstd(C2startnospeed(:,index))/sqrt(length(C2startnospeed(:,index)));
    lickc2conrewav(index,1)=nanmean(C2startrewlick(:,index));
    lickc2conrewav(index,2)=nanstd(C2startrewlick(:,index))/sqrt(length(C2startrewlick(:,index)));
    lickc2connoav(index,1)=nanmean(C2startnolick(:,index));
    lickc2connoav(index,2)=nanstd(C2startnolick(:,index))/sqrt(length(C2startnolick(:,index)));
    pupilc2conrewav(index,1)=nanmean(C2startrewpupil(:,index));
    pupilc2conrewav(index,2)=nanstd(C2startrewpupil(:,index))/sqrt(length(C2startrewpupil(:,index)));
    pupilc2connoav(index,1)=nanmean(C2startnopupil(:,index));
    pupilc2connoav(index,2)=nanstd(C2startnopupil(:,index))/sqrt(length(C2startnopupil(:,index)));
    end
    
    end
end


for index=1:150
    speedc1stopav(index,1)=nanmean(C1stopspeed(:,index));
    speedc1stopav(index,2)=nanstd(C1stopspeed(:,index))/sqrt(length(C1stopspeed(:,index)));
    speedc1engageav(index,1)=nanmean(C1engagespeed(:,index));
    speedc1engageav(index,2)=nanstd(C1engagespeed(:,index))/sqrt(length(C1engagespeed(:,index)));
    
    lickc1stopav(index,1)=nanmean(C1stoplick(:,index));
    lickc1stopav(index,2)=nanstd(C1stoplick(:,index))/sqrt(length(C1stoplick(:,index)));
    lickc1engageav(index,1)=nanmean(C1engagelick(:,index));
    lickc1engageav(index,2)=nanstd(C1engagelick(:,index))/sqrt(length(C1engagelick(:,index)));
    
    pupilc1stopav(index,1)=nanmean(C1stoppupil(:,index));
    pupilc1stopav(index,2)=nanstd(C1stoppupil(:,index))/sqrt(length(C1stoppupil(:,index)));
    pupilc1engageav(index,1)=nanmean(C1engagepupil(:,index));
    pupilc1engageav(index,2)=nanstd(C1engagepupil(:,index))/sqrt(length(C1engagepupil(:,index)));
    
    if trainingday==1
        
    speedc1stopav2(index,1)=nanmean(C1stopspeed2(:,index));
    speedc1stopav2(index,2)=nanstd(C1stopspeed2(:,index))/sqrt(length(C1stopspeed2(:,index)));
    lickc1stopav2(index,1)=nanmean(C1stoplick2(:,index));
    lickc1stopav2(index,2)=nanstd(C1stoplick2(:,index))/sqrt(length(C1stoplick2(:,index)));
    pupilc1stopav2(index,1)=nanmean(C1stoppupil2(:,index));
    pupilc1stopav2(index,2)=nanstd(C1stoppupil2(:,index))/sqrt(length(C1stoppupil2(:,index)));
    

    speedc2stopav(index,1)=nanmean(C2stopspeed(:,index));
    speedc2stopav(index,2)=nanstd(C2stopspeed(:,index))/sqrt(length(C2stopspeed(:,index)));
    speedc2stopav2(index,1)=nanmean(C2stopspeed2(:,index));
    speedc2stopav2(index,2)=nanstd(C2stopspeed2(:,index))/sqrt(length(C2stopspeed2(:,index)));
    speedc2engageav(index,1)=nanmean(C2engagespeed(:,index));
    speedc2engageav(index,2)=nanstd(C2engagespeed(:,index))/sqrt(length(C2engagespeed(:,index)));
    
    lickc2stopav(index,1)=nanmean(C2stoplick(:,index));
    lickc2stopav(index,2)=nanstd(C2stoplick(:,index))/sqrt(length(C2stoplick(:,index)));
    lickc2stopav2(index,1)=nanmean(C2stoplick2(:,index));
    lickc2stopav2(index,2)=nanstd(C2stoplick2(:,index))/sqrt(length(C2stoplick2(:,index)));
    lickc2engageav(index,1)=nanmean(C2engagelick(:,index));
    lickc2engageav(index,2)=nanstd(C2engagelick(:,index))/sqrt(length(C2engagelick(:,index)));
    
    pupilc2stopav(index,1)=nanmean(C2stoppupil(:,index));
    pupilc2stopav(index,2)=nanstd(C2stoppupil(:,index))/sqrt(length(C2stoppupil(:,index)));
    pupilc2stopav2(index,1)=nanmean(C2stoppupil2(:,index));
    pupilc2stopav2(index,2)=nanstd(C2stoppupil2(:,index))/sqrt(length(C2stoppupil2(:,index)));
    pupilc2engageav(index,1)=nanmean(C2engagepupil(:,index));
    pupilc2engageav(index,2)=nanstd(C2engagepupil(:,index))/sqrt(length(C2engagepupil(:,index)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Missed to Next      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if passiveday==0
for index=1:150
    speedc1missc1av(index,1)=nanmean(C1missC1speed(:,index));
    speedc1missc1av(index,2)=nanstd(C1missC1speed(:,index))/sqrt(length(C1missC1speed(:,index)));
    
    lickc1missc1av(index,1)=nanmean(C1missC1lick(:,index));
    lickc1missc1av(index,2)=nanstd(C1missC1lick(:,index))/sqrt(length(C1missC1lick(:,index)));
    
    pupilc1missc1av(index,1)=nanmean(C1missC1pupil(:,index));
    pupilc1missc1av(index,2)=nanstd(C1missC1pupil(:,index))/sqrt(length(C1missC1pupil(:,index)));
    
    if trainingday==1
    

    speedc1missc2av(index,1)=nanmean(C1missC2speed(:,index));
    speedc1missc2av(index,2)=nanstd(C1missC2speed(:,index))/sqrt(length(C1missC2speed(:,index)));
    speedc2missc1av(index,1)=nanmean(C2missC1speed(:,index));
    speedc2missc1av(index,2)=nanstd(C2missC1speed(:,index))/sqrt(length(C2missC1speed(:,index)));
    speedc2missc2av(index,1)=nanmean(C2missC2speed(:,index));
    speedc2missc2av(index,2)=nanstd(C2missC2speed(:,index))/sqrt(length(C2missC2speed(:,index)));
    
    lickc1missc2av(index,1)=nanmean(C1missC2lick(:,index));
    lickc1missc2av(index,2)=nanstd(C1missC2lick(:,index))/sqrt(length(C1missC2lick(:,index)));
    lickc2missc1av(index,1)=nanmean(C2missC1lick(:,index));
    lickc2missc1av(index,2)=nanstd(C2missC1lick(:,index))/sqrt(length(C2missC1lick(:,index)));
    lickc2missc2av(index,1)=nanmean(C2missC2lick(:,index));
    lickc2missc2av(index,2)=nanstd(C2missC2lick(:,index))/sqrt(length(C2missC2lick(:,index)));
    
    pupilc1missc2av(index,1)=nanmean(C1missC2pupil(:,index));
    pupilc1missc2av(index,2)=nanstd(C1missC2pupil(:,index))/sqrt(length(C1missC2pupil(:,index)));
    pupilc2missc1av(index,1)=nanmean(C2missC1pupil(:,index));
    pupilc2missc1av(index,2)=nanstd(C2missC1pupil(:,index))/sqrt(length(C2missC1pupil(:,index)));
    pupilc2missc2av(index,1)=nanmean(C2missC2pupil(:,index));
    pupilc2missc2av(index,2)=nanstd(C2missC2pupil(:,index))/sqrt(length(C2missC2pupil(:,index)));
    
    
    
    end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   MINIs      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



for index=1:150
    speedc1miniav(index,1)=nanmean(C1minispeed(:,index));
    speedc1miniav(index,2)=nanstd(C1minispeed(:,index))/sqrt(length(C1minispeed(:,index)));
    
    lickc1miniav(index,1)=nanmean(C1minilick(:,index));
    lickc1miniav(index,2)=nanstd(C1minilick(:,index))/sqrt(length(C1minilick(:,index)));
    
    pupilc1miniav(index,1)=nanmean(C1minipupil(:,index));
    pupilc1miniav(index,2)=nanstd(C1minipupil(:,index))/sqrt(length(C1minipupil(:,index)));
    
    if trainingday==1
    

    speedc2miniav(index,1)=nanmean(C2minispeed(:,index));
    speedc2miniav(index,2)=nanstd(C2minispeed(:,index))/sqrt(length(C2minispeed(:,index)));  
    lickc2miniav(index,1)=nanmean(C2minilick(:,index));
    lickc2miniav(index,2)=nanstd(C2minilick(:,index))/sqrt(length(C2minilick(:,index)));
    
    pupilc2miniav(index,1)=nanmean(C2minipupil(:,index));
    pupilc2miniav(index,2)=nanstd(C2minipupil(:,index))/sqrt(length(C2minipupil(:,index)));
    end
end


%%%%
%make the graphs
%find the mean and sem for speed, lick, pupil, for context, reward, post, engage
%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot speed, lick rate, pupil for all contexts and reward periods%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xaxis=C1rewardtime(1,:);
conxaxis=C1starttime(1,:);

figure
    subplot(3,2,1)
    
%     hello
    errorbar(conxaxis,speedc1conav(:,1),speedc1conav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Speed)')
    hold on
    
    subplot(3,2,2)
    errorbar(xaxis,speedc1rewav(:,1),speedc1rewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('Outcome (Speed)')
    hold on
    

    
if trainingday==1
    subplot(3,2,1)
    errorbar(conxaxis,speedc2conav(:,1),speedc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,2)
    errorbar(xaxis,speedc2rewav(:,1),speedc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
    

end

xaxis
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,3)
    errorbar(conxaxis,lickc1conav(:,1),lickc1conav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Lick)')
    hold on
    
    subplot(3,2,4)
    errorbar(xaxis,lickc1rewav(:,1),lickc1rewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('Outcome (Lick)')
    hold on
   
    
if trainingday==1
    
    subplot(3,2,3)
    errorbar(conxaxis,lickc2conav(:,1),lickc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,4)
    errorbar(xaxis,lickc2rewav(:,1),lickc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,5)
    errorbar(conxaxis,pupilc1conav(:,1),pupilc1conav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Pupil)')
    hold on
    
    subplot(3,2,6)
    errorbar(xaxis,pupilc1rewav(:,1),pupilc1rewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('Outcome (Pupil)')
    hold on
    
if trainingday==1
    
    subplot(3,2,5)
    errorbar(conxaxis,pupilc2conav(:,1),pupilc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,6)
    errorbar(xaxis,pupilc2rewav(:,1),pupilc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
end

if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'ContextRewardBehavior.png')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot speed, lick rate, pupil for all contexts and reward periods%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xaxis=C1minitime(2,:);
xaxisengage=C1engagetime(1,:);

figure
    subplot(3,2,1)
    errorbar(xaxis,speedc1miniav(:,1),speedc1miniav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('Mini Engage (Speed)')
    hold on
    
    
    subplot(3,2,2)
    errorbar(xaxisengage,speedc1engageav(:,1),speedc1engageav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxisengage(1) xaxisengage(end)])
    title('Engage (Speed)')
    hold on

    
if trainingday==1
    subplot(3,2,1)
    errorbar(xaxis,speedc2miniav(:,1),speedc2miniav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
    subplot(3,2,2)
    errorbar(xaxisengage,speedc2engageav(:,1),speedc2engageav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxisengage(1) xaxisengage(end)])
    hold on
    

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,3)
    errorbar(xaxis,lickc1miniav(:,1),lickc1miniav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('Mini Engage (Lick)')
    hold on
    
    subplot(3,2,4)
    errorbar(xaxisengage,lickc1engageav(:,1),lickc1engageav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxisengage(1) xaxisengage(end)])
    title('Engage (Lick)')
    hold on
   
    
if trainingday==1
    
    subplot(3,2,3)
    errorbar(xaxis,lickc2miniav(:,1),lickc2miniav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
    subplot(3,2,4)
    errorbar(xaxisengage,lickc2engageav(:,1),lickc2engageav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxisengage(1) xaxisengage(end)])
    hold on
    
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,5)
    errorbar(xaxis,pupilc1miniav(:,1),pupilc1miniav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('Mini Engage (Pupil)')
    hold on
    
    subplot(3,2,6)
    errorbar(xaxisengage,pupilc1engageav(:,1),pupilc1engageav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxisengage(1) xaxisengage(end)])
    title('Engage (Pupil)')
    hold on
    
if trainingday==1
    
    subplot(3,2,5)
    errorbar(xaxis,pupilc2miniav(:,1),pupilc2miniav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
    subplot(3,2,6)
    errorbar(xaxisengage,pupilc2engageav(:,1),pupilc2engageav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxisengage(1) xaxisengage(end)])
    hold on
    
end
set(gcf, 'Position',  [500, 250, 375, 375])

if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'EngageBehavior.png')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xaxis=C1starttime(1,:);

figure
    
    subplot(3,2,1)
    errorbar(xaxis,speedc1stopav(:,1),speedc1stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('After Rew (Speed)')
    hold on
    subplot(3,2,2)
    errorbar(xaxis,speedc2stopav(:,1),speedc2stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('After Fear (Speed)')
    hold on
    
    
if trainingday==1
    
    subplot(3,2,1)
    errorbar(xaxis,speedc1stopav2(:,1),speedc1stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,2)
    errorbar(xaxis,speedc2stopav2(:,1),speedc2stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    subplot(3,2,3)
    errorbar(xaxis,lickc1stopav(:,1),lickc1stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('After Rew (Lick)')
    hold on
    subplot(3,2,4)
    errorbar(xaxis,lickc2stopav(:,1),lickc2stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('After Fear (Lick)')
    hold on
    
    
if trainingday==1
    
    subplot(3,2,3)
    errorbar(xaxis,lickc1stopav2(:,1),lickc1stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,4)
    errorbar(xaxis,lickc2stopav2(:,1),lickc2stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    subplot(3,2,5)
    errorbar(xaxis,pupilc1stopav(:,1),pupilc1stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('After Rew (Pupil)')
    hold on
    subplot(3,2,6)
    errorbar(xaxis,pupilc2stopav(:,1),pupilc2stopav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('After Fear (Pupil)')
    hold on
    
    
if trainingday==1
    
    
    subplot(3,2,5)
    errorbar(xaxis,pupilc1stopav2(:,1),pupilc1stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,6)
    errorbar(xaxis,pupilc2stopav2(:,1),pupilc2stopav2(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
end
    
if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'NextContextBehavior.png')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot speed, lick rate, pupil for all contexts and reward periods%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xaxis=C1lesslicktime(2,:);
% 
% figure
%     subplot(3,2,1)
%     errorbar(xaxis,speedc1lickav(:,1),speedc1lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([xaxis(1) xaxis(end)])
%     title('Lick Decrease (Speed)')
%     hold on
%     
% 
%     
% if trainingday==1
%     subplot(3,2,1)
%     errorbar(xaxis,speedc2lickav(:,1),speedc2lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     ylim([0 3])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
%     
% 
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%plot lick rates%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     subplot(3,2,3)
%     errorbar(xaxis,lickc1lickav(:,1),lickc1lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([xaxis(1) xaxis(end)])
%     title('Lick Decrease (Lick)')
%     hold on
%    
%     
% if trainingday==1
%     
%     subplot(3,2,3)
%     errorbar(xaxis,lickc2lickav(:,1),lickc2lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
%     
%     
% end
%     
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%plot pupil%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     subplot(3,2,5)
%     errorbar(xaxis,pupilc1lickav(:,1),pupilc1lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 2])
%     xlim([xaxis(1) xaxis(end)])
%     title('Lick Decrease (Pupil)')
%     hold on
%     
% if trainingday==1
%     
%     subplot(3,2,5)
%     errorbar(xaxis,pupilc2lickav(:,1),pupilc2lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 2])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
%     
%     
% end
% set(gcf, 'Position',  [500, 250, 375, 375])
% 
% if saveplotting==1
% set(gcf, 'Position',  [500, 250, 375, 375])
% saveas(gcf,'LickDecrease.png')
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot speed, lick rate, pupil for all contexts and reward periods%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xaxis=C1rewardtime(1,:);
conxaxis=C1starttime(1,:);

figure
    subplot(3,2,1)
    errorbar(conxaxis,speedc1conrewav(:,1),speedc1conrewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('C1 Stop/No Stop (Speed)')
    hold on
    
    
    subplot(3,2,1)
    errorbar(conxaxis,speedc1connoav(:,1),speedc1connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    

    
if trainingday==1
    subplot(3,2,2)
    errorbar(conxaxis,speedc2conrewav(:,1),speedc2conrewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('C2 Stop/No Stop (Speed)')
    hold on
    
    subplot(3,2,2)
    errorbar(conxaxis,speedc2connoav(:,1),speedc2connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    

end

xaxis
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,3)
    errorbar(conxaxis,lickc1conrewav(:,1),lickc1conrewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('C1 Stop/No Stop (Lick)')
    hold on
    
    subplot(3,2,3)
    errorbar(conxaxis,lickc1connoav(:,1),lickc1connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
   
    
if trainingday==1
    
    subplot(3,2,4)
    errorbar(conxaxis,lickc2conrewav(:,1),lickc2conrewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('C2 Stop/No Stop (Lick)')
    hold on
    
    subplot(3,2,4)
    errorbar(conxaxis,lickc2connoav(:,1),lickc2connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,5)
    errorbar(conxaxis,pupilc1conrewav(:,1),pupilc1conrewav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    title('C1 Stop/No Stop (Pupil)')
    hold on
    
    subplot(3,2,5)
    errorbar(conxaxis,pupilc1connoav(:,1),pupilc1connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
if trainingday==1
    
    subplot(3,2,6)
    errorbar(conxaxis,pupilc2conrewav(:,1),pupilc2conrewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    title('C2 Stop/No Stop (Pupil)')
    hold on
    
    subplot(3,2,6)
    errorbar(conxaxis,pupilc2connoav(:,1),pupilc2connoav(:,2),'color',[0 0 0],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
end

if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'StopOrNoStopBehavior.png')
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot speed, lick rate, pupil for next context after missed trial%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xaxis=C1starttime(1,:);

figure
    
    subplot(3,2,1)
    errorbar(xaxis,speedc1missc1av(:,1),speedc1missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('After M Rew (Speed)')
    hold on
    subplot(3,2,2)
    errorbar(xaxis,speedc2missc1av(:,1),speedc2missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    title('After M Fear (Speed)')
    hold on
    
    
if trainingday==1
    
    subplot(3,2,1)
    errorbar(xaxis,speedc1missc2av(:,1),speedc1missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,2)
    errorbar(xaxis,speedc2missc2av(:,1),speedc2missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    ylim([0 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    subplot(3,2,3)
    errorbar(xaxis,lickc1missc1av(:,1),lickc1missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('After M Rew (Lick)')
    hold on
    subplot(3,2,4)
    errorbar(xaxis,lickc2missc1av(:,1),lickc2missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('After M Fear (Lick)')
    hold on
    
    
if trainingday==1
    
    subplot(3,2,3)
    errorbar(xaxis,lickc1missc2av(:,1),lickc1missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,4)
    errorbar(xaxis,lickc2missc2av(:,1),lickc2missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    subplot(3,2,5)
    errorbar(xaxis,pupilc1missc1av(:,1),pupilc1missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('After Rew (Pupil)')
    hold on
    subplot(3,2,6)
    errorbar(xaxis,pupilc2missc1av(:,1),pupilc2missc1av(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    title('After Fear (Pupil)')
    hold on
    
    
if trainingday==1
    
    
    subplot(3,2,5)
    errorbar(xaxis,pupilc1missc2av(:,1),pupilc1missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
    subplot(3,2,6)
    errorbar(xaxis,pupilc2missc2av(:,1),pupilc2missc2av(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1 1])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
end
    
if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'MissNextContextBehavior.png')
end



        

        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%STRUCTURE LEARNING????????????????????%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xaxis=C1rewardtime(1,:);
conxaxis=C1starttime(1,:);


if trainingday==1
    
figure
    subplot(6,3,1)
    errorbar(conxaxis,context211speedav(:,1),context211speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('211 (Speed)')
    hold on
    
    subplot(6,3,2)
    errorbar(conxaxis,context121speedav(:,1),context121speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('121 (Speed)')
    hold on
    
    subplot(6,3,3)
    errorbar(conxaxis,context221speedav(:,1),context221speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('221 (Speed)')
    hold on
    
    %%%%%%%%%%%
        subplot(6,3,4)
    errorbar(conxaxis,context211lickav(:,1),context211lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('211 (Lick)')
    hold on
    
    subplot(6,3,5)
    errorbar(conxaxis,context121lickav(:,1),context121lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('121 (Lick)')
    hold on
    
    subplot(6,3,6)
    errorbar(conxaxis,context221lickav(:,1),context221lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('221 (Lick)')
    hold on
    
        %%%%%%%%%%%%

            subplot(6,3,7)
    errorbar(conxaxis,context211pupilav(:,1),context211pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('211 (Pupil)')
    hold on
    
    subplot(6,3,8)
    errorbar(conxaxis,context121pupilav(:,1),context121pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('121 (Pupil)')
    hold on
    
    subplot(6,3,9)
    errorbar(conxaxis,context221pupilav(:,1),context221pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('221 (Pupil)')
    hold on
        
        
        
        
        
        
    subplot(6,3,10)
    errorbar(conxaxis,context122speedav(:,1),context122speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('122 (Speed)')
    hold on
    
    subplot(6,3,11)
    errorbar(conxaxis,context212speedav(:,1),context212speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('212 (Speed)')
    hold on
    
    subplot(6,3,12)
    errorbar(conxaxis,context112speedav(:,1),context112speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('112 (Speed)')
    hold on
    
    %%%%%%%%%%%
        subplot(6,3,13)
    errorbar(conxaxis,context122lickav(:,1),context122lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('122 (Lick)')
    hold on
    
    subplot(6,3,14)
    errorbar(conxaxis,context212lickav(:,1),context212lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('212 (Lick)')
    hold on
    
    subplot(6,3,15)
    errorbar(conxaxis,context112lickav(:,1),context112lickav(:,2),'k','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('112 (Lick)')
    hold on
    
    %%%%%%%%%%%
        subplot(6,3,16)
    errorbar(conxaxis,context122pupilav(:,1),context122pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('122 (Pupil)')
    hold on
    
    subplot(6,3,17)
    errorbar(conxaxis,context212pupilav(:,1),context212pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('212 (Pupil)')
    hold on
    
    subplot(6,3,18)
    errorbar(conxaxis,context112pupilav(:,1),context112pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-1 1],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('112 (Pupil)')
    hold on

if saveplotting==1
set(gcf, 'Position',  [500, 250, 500, 750])
saveas(gcf,'Structure.png')
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
    subplot(2,2,1)
    errorbar(conxaxis,context11speedav(:,1),context11speedav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Reward (Speed)')
    hold on
    
    subplot(2,2,2)
    errorbar(conxaxis,context21speedav(:,1),context21speedav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Failure (Speed)')
    hold on
    
    subplot(2,2,3)
    errorbar(conxaxis,context11lickav(:,1),context11lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Reward (Lick)')
    hold on
    
    subplot(2,2,4)
    errorbar(conxaxis,context21lickav(:,1),context21lickav(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Failure (Lick)')
    hold on
    
    if trainingday==1
        subplot(2,2,1)
    errorbar(conxaxis,context12speedav(:,1),context12speedav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Reward (Speed)')
    hold on
    
    subplot(2,2,2)
    errorbar(conxaxis,context22speedav(:,1),context22speedav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Failure (Speed)')
    hold on
    
    subplot(2,2,3)
    errorbar(conxaxis,context12lickav(:,1),context12lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Reward (Lick)')
    hold on
    
    subplot(2,2,4)
    errorbar(conxaxis,context22lickav(:,1),context22lickav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('After Failure (Lick)')
    hold on
    
    end
    
    
saveas(gcf,'AfterRewAfterFailure.png')


figure
    subplot(3,2,1)
    
%     hello
    errorbar(conxaxis,context11speedav(:,1),context11speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Speed)')
    hold on
    
    subplot(3,2,2)
    errorbar(xaxis,speedc1rewav(:,1),speedc1rewav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([xaxis(1) xaxis(end)])
    title('Reward (Speed)')
    hold on
    

    
if trainingday==1
%     subplot(3,2,1)
%     errorbar(conxaxis,speedc2conav(:,1),speedc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     ylim([0 3])
%     xlim([conxaxis(1) conxaxis(end)])
%     hold on
%     
%     subplot(3,2,2)
%     errorbar(xaxis,speedc2rewav(:,1),speedc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     ylim([0 3])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
    

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,3)
    errorbar(conxaxis,context11lickav(:,1),context11lickav(:,2),'k','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Lick)')
    hold on
    
    subplot(3,2,4)
    errorbar(xaxis,lickc1rewav(:,1),lickc1rewav(:,2),'k','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    title('Reward (Lick)')
    hold on
   
    
if trainingday==1
    
%     subplot(3,2,3)
%     errorbar(conxaxis,lickc2conav(:,1),lickc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([conxaxis(1) conxaxis(end)])
%     hold on
%     
%     subplot(3,2,4)
%     errorbar(xaxis,lickc2rewav(:,1),lickc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
    
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,2,5)
    errorbar(conxaxis,context11pupilav(:,1),context11pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    title('Context (Pupil)')
    hold on
    
    subplot(3,2,6)
    errorbar(xaxis,pupilc1rewav(:,1),pupilc1rewav(:,2),'k','LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([xaxis(1) xaxis(end)])
    title('Reward (Pupil)')
    hold on
    
if trainingday==1
    
%     subplot(3,2,5)
%     errorbar(conxaxis,pupilc2conav(:,1),pupilc2conav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([conxaxis(1) conxaxis(end)])
%     hold on
    
%     subplot(3,2,6)
%     errorbar(xaxis,pupilc2rewav(:,1),pupilc2rewav(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([xaxis(1) xaxis(end)])
%     hold on
end

if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'OnlyRewardContext.png')
end



figure
%     subplot(3,2,1)
    
%     hello
%     errorbar(conxaxis,speedc1conav(:,1),speedc1conav(:,2),'k','LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([conxaxis(1) conxaxis(end)])
%     title('Context (Speed)')
%     hold on
%     
%     subplot(3,2,2)
%     errorbar(xaxis,speedc1rewav(:,1),speedc1rewav(:,2),'k','LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([xaxis(1) xaxis(end)])
%     title('Reward (Speed)')
%     hold on
    

    
if trainingday==1
    subplot(3,2,1)
    errorbar(conxaxis,context12speedav(:,1),context12speedav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,2)
    errorbar(xaxis,speedc2rewav(:,1),speedc2rewav(:,2),'r','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([-0.5 3])
    xlim([xaxis(1) xaxis(end)])
    hold on
    

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot lick rates%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     subplot(3,2,3)
%     errorbar(conxaxis,lickc1conav(:,1),lickc1conav(:,2),'k','LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([conxaxis(1) conxaxis(end)])
%     title('Context (Lick)')
%     hold on
%     
%     subplot(3,2,4)
%     errorbar(xaxis,lickc1rewav(:,1),lickc1rewav(:,2),'k','LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([xaxis(1) xaxis(end)])
%     title('Reward (Lick)')
%     hold on
   
    
if trainingday==1
    
    subplot(3,2,3)
    errorbar(conxaxis,context12lickav(:,1),context12lickav(:,2),'k','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,4)
    errorbar(xaxis,lickc2rewav(:,1),lickc2rewav(:,2),'k','LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xaxis(1) xaxis(end)])
    hold on
    
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%plot pupil%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     subplot(3,2,5)
%     errorbar(conxaxis,pupilc1conav(:,1),pupilc1conav(:,2),'k','LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([conxaxis(1) conxaxis(end)])
%     title('Context (Pupil)')
%     hold on
%     
%     subplot(3,2,6)
%     errorbar(xaxis,pupilc1rewav(:,1),pupilc1rewav(:,2),'k','LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([xaxis(1) xaxis(end)])
%     title('Reward (Pupil)')
%     hold on
    
if trainingday==1
    
    subplot(3,2,5)
    errorbar(conxaxis,context12pupilav(:,1),context12pupilav(:,2),'k','LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([conxaxis(1) conxaxis(end)])
    hold on
    
    subplot(3,2,6)
    errorbar(xaxis,pupilc2rewav(:,1),pupilc2rewav(:,2),'k','LineWidth',2)
    line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
    ylim([-1.25 1.25])
    xlim([xaxis(1) xaxis(end)])
    hold on
end

if saveplotting==1
set(gcf, 'Position',  [500, 250, 375, 375])
saveas(gcf,'OnlyFailureContext.png')
end
