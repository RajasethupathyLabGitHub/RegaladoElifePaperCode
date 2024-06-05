%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%This is for getting the means and errors to plot%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% stop

% folderdirectory=[pwd,'\',foldername];
% 
% % clearvars -except signals passiveday trainingday plotting trialstructure runbehavior runphotometry engagementspeed minispeeds folderdirectory
% close all
% filename= [folderdirectory '\trialstructure.mat']
% save(filename)

%%%make average speed and lick%%%
close all
close all
close all
closeall=1;
plottingindividual=0;
plotreward=1;
plotfailure=1;


context1=1;
context2=2;

afterwhatrew=1;
afterwhatfail=1;

% load 'trialstructure.mat'

signals=5;

yaxis=[-1 1.5];
yaxisreward=[-1.5 1.5];
yaxisengage=[-1 1.5];
yaxiscontext=[-1.25 1.5];   %[-1.25 .75];
yaxisconrew=[-1.25 1.5];   %[-1.25 .75];
xlimcontext=[-2.5 2.5];
xlimreward=[-1.5 3.25];
xlimengage=[-2.25 1];
xlimpost=[0 5];

if passiveday==1
    yaxis=[-1 1.5]
end

% hello

%%%%pearsons and cross correlation caluclations
%%%%decision and motivation phase
countc1context=0;
countc2context=0;
countc1reward=0;
countc1noreward=0;
countc2reward=0;
countc2noreward=0;
countc1engage=0;
countc2engage=0;
countc1nextcontext=0;
countc2nextcontext=0;

countc1reengage=0;
countc2reengage=0;

speedpoolc1connoreward=nan(1,60);
speedpoolc2connoreward=nan(1,60);
speedpoolc1conrew=nan(1,60);
speedpoolc1reward=nan(1,60);
speedpoolc1engage=nan(1,60);
speedc1conrewav=nan(1,60);
speedc1conrewerr=nan(1,60);
speedc1connorewardav=nan(1,60);
speedc2connorewardav=nan(1,60);
speedc1connorewarderr=nan(1,60);
speedc2connorewarderr=nan(1,60);
speedpoolc2conrew=nan(1,60);
speedpoolc2reward=nan(1,60);
speedpoolc2post=nan(1,60);
speedpoolc2engage=nan(1,60);
speedpoolc1connext=nan(1,60);
speedpoolc2connext=nan(1,60);
lickpoolc2conrew=nan(1,60);
lickpoolc2reward=nan(1,60);
lickpoolc2post=nan(1,60);
lickpoolc2engage=nan(1,60);
lickpoolc1engage=nan(1,60);
lickpoolc1conrew=nan(1,60);
lickpoolc1reward=nan(1,60);
speedpoolc1missc1=nan(1,60);
speedpoolc1missc2=nan(1,60);
speedpoolc2missc2=nan(1,60);
speedpoolc2missc1=nan(1,60);
lickpoolc1missc1=nan(1,60);
lickpoolc1missc2=nan(1,60);
lickpoolc2missc2=nan(1,60);
lickpoolc2missc1=nan(1,60);
photometrypoolc1missc1=nan(1,60,5);
photometrypoolc1missc2=nan(1,60,5);
photometrypoolc2missc2=nan(1,60,5);

speedpoolc1post2=nan(1,60);
lickpoolc1post2=nan(1,60);
photometrypoolc1post2=nan(1,60,5);

speedpoolc1con=nan(1,60);
lickpoolc1con=nan(1,60);
speedpoolc1reengage=nan(1,60);
lickpoolc1reengage=nan(1,60);
speedpoolc2reengage=nan(1,60);
lickpoolc2reengage=nan(1,60);
photometrypoolc1reengage=nan(1,60,5);
photometrypoolc2reengage=nan(1,60,5);

lickpoolc1connoreward=nan(1,60);
lickpoolc2connoreward=nan(1,60);
lickc1connorewardav=nan(1,60);
lickc2connorewardav=nan(1,60);
lickc1connorewarderr=nan(1,60);
lickc2connorewarderr=nan(1,60);
lickpoolc1connext=nan(1,60);
lickpoolc2connext=nan(1,60);
photometrypoolc2conrew=nan(1,60,5);
photometrypoolc2reward=nan(1,60,5);
photometrypoolc2post=nan(1,60,5);
photometrypoolc2engage=nan(1,60,5);

speedpoolc2con=nan(1,60);
lickpoolc2con=nan(1,60);
photometrypoolc2con=nan(1,60,5);

photometrypoolc1con=nan(1,60,5);
photometrypoolc1conrew=nan(1,60,5);
photometrypoolc1reward=nan(1,60,5);
photometrypoolc1post2=nan(1,60,5);
photometrypoolc1engage=nan(1,60,5);
photometrypoolc2missc1=nan(1,60,5);

speedpoolc2post2=nan(1,60);
lickpoolc2post2=nan(1,60);
photometrypoolc2post2=nan(1,60,5);

speedpoolc2mini=nan(1,60);
lickpoolc2mini=nan(1,60);
photometrypoolc2mini=nan(1,60,5);

speedpoolc1post=nan(1,60);
lickpoolc1post=nan(1,60);
photometrypoolc1post=nan(1,60,5);

speedpoolc1mini=nan(1,60);
lickpoolc1mini=nan(1,60);
photometrypoolc1mini=nan(1,60,5);

photometrypoolc1connoreward=nan(1,60,5);
photometrypoolc2connoreward=nan(1,60,5);
photometryc1connorewardav=nan(5,60);
photometryc2connorewardav=nan(5,60);
photometryc1connorewarderr=nan(5,60);
photometryc2connorewarderr=nan(5,60);
photometrypoolc1connext=nan(1,60,5);
photometrypoolc2connext=nan(1,60,5);
mini1=0;
mini2=0;
next11=0;
next12=0;
next21=0;
next22=0;
miss11=0;
miss12=0;
miss21=0;
miss22=0;
previousreward=0;

for trial=3:numel(trialstructure(:))-2

     if trialstructure(trial).context==1 %&& trialstructure(trial+1).context==2 && trialstructure(trial+2).context==2  
         
         countc1context=countc1context+1;
         
         counttheseAM(countc1context)=trial;
          speedpoolc1con(countc1context,:)=trialstructure(trial).contextbehavior.speedtrace;
          lickpoolc1con(countc1context,:)=trialstructure(trial).contextbehavior.licktrace;
          for sig=1:signals
          photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
           photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
%            photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
          
%           if afterwhatrew~=afterwhatfail
%          photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
%           end
          
%           if context1==2 && context2==2 && afterwhatrew==2 && afterwhatfail==1
%           photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-1).contextbehavior.signals(sig).trace(26);
%           end
          
          if passiveday==1
          photometrypoolc1con(countc1context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
          end
          end
         
         if trialstructure(trial).stop==1 
              countc1reward=countc1reward+1;
                xaxisreward=trialstructure(trial).rewardbehavior.timetrace;
            xaxisengage=trialstructure(trial).engagebehavior.timetrace;
                xaxispost=trialstructure(trial).postbehavior.timetrace;
              if countc1reward==3
              savetrial=trial;
              end
              speedpoolc1conrew(countc1reward,:)=trialstructure(trial).contextbehavior.speedtrace;
              speedpoolc1reward(countc1reward,:)=trialstructure(trial).rewardbehavior.speedtrace;

              lickpoolc1conrew(countc1reward,:)=trialstructure(trial).contextbehavior.licktrace;
              lickpoolc1reward(countc1reward,:)=trialstructure(trial).rewardbehavior.licktrace;
              
              if trialstructure(trial).postbehavior.next==1
                  next11=next11+1;
              speedpoolc1post(next11,:)=trialstructure(trial).postbehavior.speedtrace;
              lickpoolc1post(next11,:)=trialstructure(trial).postbehavior.licktrace;
              elseif trialstructure(trial).postbehavior.next==2
                  next21=next21+1;
              speedpoolc1post2(next21,:)=trialstructure(trial).postbehavior.speedtrace;
              lickpoolc1post2(next21,:)=trialstructure(trial).postbehavior.licktrace;
              end
              
              if ~isempty(trialstructure(trial).engagebehavior.speedtrace)
                  for i=1:numel(trialstructure(trial).engagebehavior.time(:))
                  countc1engage=countc1engage+1;
              speedpoolc1engage(countc1engage,:)=trialstructure(trial).engagebehavior.speedtrace(i,:);
              lickpoolc1engage(countc1engage,:)=trialstructure(trial).engagebehavior.licktrace(i,:);
              for sig=1:signals
                    photometrypoolc1engage(countc1engage,:,sig)=trialstructure(trial).engagebehavior.signals(sig).trace(i,:);
              end
                  end
              end
          
         for sig=1:signals   
              photometrypoolc1conrew(countc1reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
              photometrypoolc1conrew(countc1reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              photometrypoolc1reward(countc1reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace;
              photometrypoolc1reward(countc1reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
%               photometrypoolc1reward(countc1reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);

              if passiveday==0
%               photometrypoolc1engage(countc1engage,:,sig)=photometrypoolc1engage(countc1engage,:,sig)-trialstructure(trial).contextbehavior.signals(sig).trace(26);
%               photometrypoolc1engage(countc1engage,:,sig)=photometrypoolc1engage(countc1engage,:,sig)-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
              end
              
          if context1==2 && context2==2 && afterwhatrew==2 && afterwhatfail==1
%               photometrypoolc1conrew(countc1reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-3).contextbehavior.signals(sig).trace(26);
%               photometrypoolc1reward(countc1reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial-3).contextbehavior.signals(sig).trace(26);
          end
              
              if passiveday==1
              photometrypoolc1conrew(countc1reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              end
              
              if trialstructure(trial).postbehavior.next==1
              photometrypoolc1post(next11,:,sig)=trialstructure(trial).postbehavior.signals(sig).trace-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
              elseif trialstructure(trial).postbehavior.next==2
              photometrypoolc1post2(next21,:,sig)=trialstructure(trial).postbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              end
              
         end
         
         mini=0;
         if ~isempty(trialstructure(trial).minibehavior) 
             for i=1:numel(trialstructure(trial).minibehavior.time(:))
                 mini1=mini1+1;
                 mini=mini+1;
                 speedpoolc1mini(mini1,:)=trialstructure(trial).minibehavior.speedtrace(i,:);
                 lickpoolc1mini(mini1,:)=trialstructure(trial).minibehavior.licktrace(i,:);
                 for sig=1:signals
                     photometrypoolc1mini(mini1,:,sig)=trialstructure(trial).minibehavior.signals(sig).trace(i,:);
                 end
             end
         end
         
                       if ~isempty(trialstructure(trial).reengagebehavior)
                  for i=1:numel(trialstructure(trial).reengagebehavior.time(:))
                  countc1reengage=countc1reengage+1;
              speedpoolc1reengage(countc1reengage,:)=trialstructure(trial).reengagebehavior.speedtrace(i,:);
              lickpoolc1reengage(countc1reengage,:)=trialstructure(trial).reengagebehavior.licktrace(i,:);
              for sig=1:signals
                    photometrypoolc1reengage(countc1reengage,:,sig)=trialstructure(trial).reengagebehavior.signals(sig).trace(i,:);
              end
                  end
              end
         
        elseif  trialstructure(trial).stop==0 
              countc1noreward=countc1noreward+1
              speedpoolc1connoreward(countc1noreward,:)=trialstructure(trial).contextbehavior.speedtrace;
              lickpoolc1connoreward(countc1noreward,:)=trialstructure(trial).contextbehavior.licktrace;
              
              if trialstructure(trial+1).context==1
                  miss11=miss11+1;
              speedpoolc1missc1(miss11,:)=trialstructure(trial+1).contextbehavior.speedtrace;
              lickpoolc1missc1(miss11,:)=trialstructure(trial+1).contextbehavior.licktrace;
              elseif trialstructure(trial+1).context==2
                  miss12=miss12+1;
              speedpoolc1missc2(miss12,:)=trialstructure(trial+1).contextbehavior.speedtrace;
              lickpoolc1missc2(miss12,:)=trialstructure(trial+1).contextbehavior.licktrace;
              end
            
              
              for sig=1:signals
              photometrypoolc1connoreward(countc1noreward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
              photometrypoolc1connoreward(countc1noreward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
                  if trialstructure(trial+1).context==1 
                  photometrypoolc1missc1(miss11,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
                  elseif trialstructure(trial+1).context==2
                  photometrypoolc1missc2(miss12,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
                  end
              end
              
              if ~isempty(trialstructure(trial).reengagebehavior)
                  for i=1:numel(trialstructure(trial).reengagebehavior.time(:))
                  countc1reengage=countc1reengage+1;
              speedpoolc1reengage(countc1reengage,:)=trialstructure(trial).reengagebehavior.speedtrace(i,:);
              lickpoolc1reengage(countc1reengage,:)=trialstructure(trial).reengagebehavior.licktrace(i,:);
              for sig=1:signals
                    photometrypoolc1reengage(countc1reengage,:,sig)=trialstructure(trial).reengagebehavior.signals(sig).trace(i,:);
              end
                  end
              end
          
        end
     
     elseif trialstructure(trial).context==2 %&& trialstructure(trial-1).context==1 && trialstructure(trial+1).context==2 
              
         countc2context=countc2context+1;
              speedpoolc2con(countc2context,:)=trialstructure(trial).contextbehavior.speedtrace;
              lickpoolc2con(countc2context,:)=trialstructure(trial).contextbehavior.licktrace;
              for sig=1:signals
              photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
               photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-1).contextbehavior.signals(sig).trace(26);
%                photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-2).rewardbehavior.signals(sig).trace(26);
              
              
%           if afterwhatrew~=afterwhatfail
%               photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
%           end
              
%           if context1==1 && context2==1 && afterwhatrew==2 && afterwhatfail==1
%           photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-1).contextbehavior.signals(sig).trace(26);
%           end
              
              if passiveday==1
                      photometrypoolc2con(countc2context,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
                  end
              end
          
         if trialstructure(trial).stop==1 
              countc2reward=countc2reward+1;
              
              speedpoolc2conrew(countc2reward,:)=trialstructure(trial).contextbehavior.speedtrace;
              speedpoolc2reward(countc2reward,:)=trialstructure(trial).rewardbehavior.speedtrace;

              lickpoolc2conrew(countc2reward,:)=trialstructure(trial).contextbehavior.licktrace;
              lickpoolc2reward(countc2reward,:)=trialstructure(trial).rewardbehavior.licktrace;
              
              
              if trialstructure(trial).postbehavior.next==1
                  next12=next12+1;
              speedpoolc2post(next12,:)=trialstructure(trial).postbehavior.speedtrace;
              lickpoolc2post(next12,:)=trialstructure(trial).postbehavior.licktrace;
              elseif trialstructure(trial).postbehavior.next==2
                  next22=next22+1;
              speedpoolc2post2(next22,:)=trialstructure(trial).postbehavior.speedtrace;
              lickpoolc2post2(next22,:)=trialstructure(trial).postbehavior.licktrace;
              end
              
              
              if ~isempty(trialstructure(trial).contextbehavior.speedtrace)
                  for i=1:numel(trialstructure(trial).engagebehavior.time(:))
                  countc2engage=countc2engage+1;
              speedpoolc2engage(countc2engage,:)=trialstructure(trial).engagebehavior.speedtrace(i,:);
              lickpoolc2engage(countc2engage,:)=trialstructure(trial).engagebehavior.licktrace(i,:);
                  for sig=1:signals
              photometrypoolc2engage(countc2engage,:,sig)=trialstructure(trial).engagebehavior.signals(sig).trace(i,:);
                  end
                  end
              end
              
          
         for sig=1:signals
              
%             if trialstructure(trial).contextbehavior.signals(sig).include==1
              photometrypoolc2conrew(countc2reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
              photometrypoolc2conrew(countc2reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              
              
              photometrypoolc2reward(countc2reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace;
              photometrypoolc2reward(countc2reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
%             photometrypoolc2reward(countc2reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              
              if passiveday==0
              photometrypoolc2engage(countc2engage,:,sig)=photometrypoolc2engage(countc2engage,:,sig)-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
              end
              
%           if context1==1 && context2==1 && afterwhatrew==2 && afterwhatfail==1
%               photometrypoolc2conrew(countc2reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial-1).contextbehavior.signals(sig).trace(26);
%               photometrypoolc2reward(countc2reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial-1).contextbehavior.signals(sig).trace(26);
%           end
%               photometrypoolc2reward(countc2reward,:,sig)=trialstructure(trial).rewardbehavior.signals(sig).trace-trialstructure(trial).rewardbehavior.signals(sig).trace(26);
              
              
              if passiveday==1
%               photometrypoolc2conrew(countc2reward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
              end
              
              if trialstructure(trial).postbehavior.next==1
              photometrypoolc2post(next12,:,sig)=trialstructure(trial).postbehavior.signals(sig).trace;
              elseif trialstructure(trial).postbehavior.next==2 %&& previousreward~=2
              photometrypoolc2post2(next22,:,sig)=trialstructure(trial).postbehavior.signals(sig).trace;
              end
              
%               photometrypoolc2rewspeedcorrelations(countc2reward,sig)=trialstructure(trial).rewardbehavior.signals(sig).speedcorrelations;
%               photometrypoolc2rewlickcorrelations(countc2reward,sig)=trialstructure(trial).rewardbehavior.signals(sig).lickcorrelations;
%               
%               photometrypoolc2engagespeedcorrelations(countc2reward,sig)=trialstructure(trial).engagebehavior.signals(sig).speedcorrelations;
%               photometrypoolc2engagelickcorrelations(countc2reward,sig)=trialstructure(trial).engagebehavior.signals(sig).lickcorrelations;
%               end
         end
         
         mini=0;
         if ~isempty(trialstructure(trial).minibehavior) %&& mean(trialstructure(trial).minibehavior.speedtrace(28:end))<0.5
             for i=1:numel(trialstructure(trial).minibehavior.time(:))
                 mini2=mini2+1;
                 mini=mini+1;
                 speedpoolc2mini(mini2,:)=trialstructure(trial).minibehavior.speedtrace(i,:);
                 lickpoolc2mini(mini2,:)=trialstructure(trial).minibehavior.licktrace(i,:);
                 for sig=1:signals
                     
%               if trialstructure(trial).contextbehavior.signals(sig).include==1
                     photometrypoolc2mini(mini2,:,sig)=trialstructure(trial).minibehavior.signals(sig).trace(i,:);
%               end
                 end
             end
         end
         
              if ~isempty(trialstructure(trial).reengagebehavior)
                  for i=1:numel(trialstructure(trial).reengagebehavior.time(:))
                  countc2reengage=countc2reengage+1;
              speedpoolc2reengage(countc2reengage,:)=trialstructure(trial).reengagebehavior.speedtrace(i,:);
              lickpoolc2reengage(countc2reengage,:)=trialstructure(trial).reengagebehavior.licktrace(i,:);
              for sig=1:signals
                    photometrypoolc2reengage(countc2reengage,:,sig)=trialstructure(trial).reengagebehavior.signals(sig).trace(i,:);
              end
                  end
              end
         
        elseif trialstructure(trial).stop==0
              countc2noreward=countc2noreward+1
              speedpoolc2connoreward(countc2noreward,:)=trialstructure(trial).contextbehavior.speedtrace;
              lickpoolc2connoreward(countc2noreward,:)=trialstructure(trial).contextbehavior.licktrace;
              
            if trialstructure(trial+1).context==1
                  miss21=miss21+1;
              speedpoolc2missc1(miss21,:)=trialstructure(trial+1).contextbehavior.speedtrace;
              lickpoolc2missc1(miss21,:)=trialstructure(trial+1).contextbehavior.licktrace;
              elseif trialstructure(trial+1).context==2
                  miss22=miss22+1;
              speedpoolc2missc2(miss22,:)=trialstructure(trial+1).contextbehavior.speedtrace;
              lickpoolc2missc2(miss22,:)=trialstructure(trial+1).contextbehavior.licktrace;
            end
              
                            
              for sig=1:signals
                  
              photometrypoolc2connoreward(countc2noreward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace;
              photometrypoolc2connoreward(countc2noreward,:,sig)=trialstructure(trial).contextbehavior.signals(sig).trace-trialstructure(trial).contextbehavior.signals(sig).trace(26);
                            if trialstructure(trial+1).context==1
                            photometrypoolc2missc1(miss21,:,sig)=trialstructure(trial+1).contextbehavior.signals(sig).trace;
                            elseif trialstructure(trial+1).context==2 %&& previousreward~=2
                            photometrypoolc2missc2(miss22,:,sig)=trialstructure(trial+1).contextbehavior.signals(sig).trace;
                            end
              end
              
              if ~isempty(trialstructure(trial).reengagebehavior) && mean(trialstructure(trial).reengagebehavior.speedtrace(26:end))>=1.4
                  for i=1:numel(trialstructure(trial).reengagebehavior.time(:))
                  countc2reengage=countc2reengage+1;
              speedpoolc2reengage(countc2reengage,:)=trialstructure(trial).reengagebehavior.speedtrace(i,:);
              lickpoolc2reengage(countc2reengage,:)=trialstructure(trial).reengagebehavior.licktrace(i,:);
              for sig=1:signals
                    photometrypoolc2reengage(countc2reengage,:,sig)=trialstructure(trial).reengagebehavior.signals(sig).trace(i,:);
              end
                  end
              end
              
         end      
     end
     
     
     if trialstructure(trial).stop==1 && trialstructure(trial).context==1
         previousreward=1;
     elseif trialstructure(trial).stop==1 && trialstructure(trial).context==2
         previousreward=2;
     end
         

end

%%% for plotting individual trials

xaxiscontext=trialstructure(3).contextbehavior.timetrace;

% xaxispost=trialstructure(3).postbehavior.timetrace;

if plottingindividual==1
    for trial=2:numel(trialstructure(:))-1
        if trialstructure(trial).context==1
            figure
            
            %%behavior
            speedtrace=trialstructure(trial).contextbehavior.speedtrace;
            speedtrace=zscore(speedtrace)-5;
            licktrace=trialstructure(trial).contextbehavior.licktrace;
            plot(xaxiscontext,speedtrace, 'color',[0 0.4470 0.7410],'LineWidth',2)
            hold on
            plot(xaxiscontext,licktrace-13, 'color',[0 0.4470 0.7410],'LineWidth',2)
            hold on
            
            %%photometry
                photometryOFC=trialstructure(trial).contextbehavior.signals(1).trace
                photometryACC=trialstructure(trial).contextbehavior.signals(2).trace
                photometryAM=trialstructure(trial).contextbehavior.signals(3).trace
                
            plot(xaxiscontext,photometryOFC, 'color',[0 0 0],'LineWidth',2)
            hold on
            plot(xaxiscontext,photometryACC, 'color',[0.6350 0.0780 0.1840],'LineWidth',2)
            hold on
            plot(xaxiscontext,photometryAM, 'color',[0.4660 0.6740 0.1880],'LineWidth',2)
            hold on
            
            line([0 0], [-8 4],'color',[0 0 0])
            
            xlim([-2 3])
    
            set(gcf, 'Position',  [0, 500, 200, 500])

            if trialstructure(trial).stop==1 
                title('Reward (Stop)')
            elseif trialstructure(trial).stop==0 
                title('Reward (Run)')
            end

    
        elseif trialstructure(trial).context==2
            
                        figure
            
            %%behavior
            speedtrace=trialstructure(trial).contextbehavior.speedtrace;
            speedtrace=zscore(speedtrace)-5;
            licktrace=trialstructure(trial).contextbehavior.licktrace;speedtrace
            plot(xaxiscontext,speedtrace, 'color',[0.9290 0.6940 0.1250],'LineWidth',2)
            hold on
            plot(xaxiscontext,licktrace-13, 'color',[0.9290 0.6940 0.1250],'LineWidth',2)
            hold on
            
            %%photometry
                photometryOFC=trialstructure(trial).contextbehavior.signals(1).trace
                photometryACC=trialstructure(trial).contextbehavior.signals(2).trace
                photometryAM=trialstructure(trial).contextbehavior.signals(3).trace
                
            plot(xaxiscontext,photometryOFC, 'color',[0 0 0],'LineWidth',2)
            hold on
            plot(xaxiscontext,photometryACC, 'color',[0.6350 0.0780 0.1840],'LineWidth',2)
            hold on
            plot(xaxiscontext,photometryAM, 'color',[0.4660 0.6740 0.1880],'LineWidth',2)
            hold on
            
            line([0 0], [-8 4],'color',[0 0 0])
            
            xlim([-2 3])
    
            set(gcf, 'Position',  [500, 500, 200, 500])
            
            if trialstructure(trial).stop==1 
                title('Nothing (Stop)')
            elseif trialstructure(trial).stop==0 
                title('Nothing (Run)')
            end
            
        end
        
        if trial==100
            hello
        end

    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Find average of speed%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for index=1:60
    speedc1conav(index)=mean(speedpoolc1con(:,index));
    speedc1conerr(index)=std(speedpoolc1con(:,index))/sqrt(length(speedpoolc1con(:,index)));
    speedc1conrewav(index)=mean(speedpoolc1conrew(:,index));
    speedc1conrewerr(index)=std(speedpoolc1conrew(:,index))/sqrt(length(speedpoolc1conrew(:,index)));
    speedc1connextav(index)=mean(speedpoolc1connext(:,index));
    speedc1connexterr(index)=std(speedpoolc1connext(:,index))/sqrt(length(speedpoolc1connext(:,index)));
    speedc1rewav(index)=mean(speedpoolc1reward(:,index));
    speedc1rewerr(index)=std(speedpoolc1reward(:,index))/sqrt(length(speedpoolc1reward(:,index)));
    speedc1postav(index)=mean(speedpoolc1post(:,index));
    speedc1posterr(index)=std(speedpoolc1post(:,index))/sqrt(length(speedpoolc1post(:,index)));
    speedc1postav2(index)=mean(speedpoolc1post2(:,index));
    speedc1posterr2(index)=std(speedpoolc1post2(:,index))/sqrt(length(speedpoolc1post2(:,index)));
    speedc1engageav(index)=mean(speedpoolc1engage(:,index));
    speedc1engageerr(index)=std(speedpoolc1engage(:,index))/sqrt(length(speedpoolc1engage(:,index)));
    speedc1reengageav(index)=mean(speedpoolc1reengage(:,index));
    speedc1reengageerr(index)=std(speedpoolc1reengage(:,index))/sqrt(length(speedpoolc1reengage(:,index)));
    speedc1miniav(index)=mean(speedpoolc1mini(:,index));
    speedc1minierr(index)=std(speedpoolc1mini(:,index))/sqrt(length(speedpoolc1mini(:,index)));
    
    lickc1conav(index)=mean(lickpoolc1con(:,index));
    lickc1conerr(index)=std(lickpoolc1con(:,index))/sqrt(length(lickpoolc1con(:,index)));
    lickc1conrewav(index)=mean(lickpoolc1conrew(:,index));
    lickc1conrewerr(index)=std(lickpoolc1conrew(:,index))/sqrt(length(lickpoolc1conrew(:,index)));
    lickc1connextav(index)=mean(lickpoolc1connext(:,index));
    lickc1connexterr(index)=std(lickpoolc1connext(:,index))/sqrt(length(lickpoolc1connext(:,index)));
    lickc1rewav(index)=mean(lickpoolc1reward(:,index));
    lickc1rewerr(index)=std(lickpoolc1reward(:,index))/sqrt(length(lickpoolc1reward(:,index)));
    lickc1postav(index)=mean(lickpoolc1post(:,index));
    lickc1posterr(index)=std(lickpoolc1post(:,index))/sqrt(length(lickpoolc1post(:,index)));
    lickc1postav2(index)=mean(lickpoolc1post2(:,index));
    lickc1posterr2(index)=std(lickpoolc1post2(:,index))/sqrt(length(lickpoolc1post2(:,index)));
    lickc1engageav(index)=mean(lickpoolc1engage(:,index));
    lickc1engageerr(index)=std(lickpoolc1engage(:,index))/sqrt(length(lickpoolc1engage(:,index)));
    lickc1reengageav(index)=mean(lickpoolc1reengage(:,index));
    lickc1reengageerr(index)=std(lickpoolc1reengage(:,index))/sqrt(length(lickpoolc1reengage(:,index)));
    lickc1miniav(index)=mean(lickpoolc1mini(:,index));
    lickc1minierr(index)=std(lickpoolc1mini(:,index))/sqrt(length(lickpoolc1mini(:,index)));
    
    if passiveday==0 
        
    speedc1connorewardav(index)=mean(speedpoolc1connoreward(:,index));
    speedc1connorewarderr(index)=std(speedpoolc1connoreward(:,index))/sqrt(length(speedpoolc1connoreward(:,index)));
    lickc1connorewardav(index)=mean(lickpoolc1connoreward(:,index));
    lickc1connorewarderr(index)=std(lickpoolc1connoreward(:,index))/sqrt(length(lickpoolc1connoreward(:,index)));
    end
    
    if trainingday==1
    
    speedc2conav(index)=mean(speedpoolc2con(:,index));
    speedc2conerr(index)=std(speedpoolc2con(:,index))/sqrt(length(speedpoolc2con(:,index)));
    speedc2conrewav(index)=mean(speedpoolc2conrew(:,index));
    speedc2conrewerr(index)=std(speedpoolc2conrew(:,index))/sqrt(length(speedpoolc2conrew(:,index)));
    speedc2connextav(index)=mean(speedpoolc2connext(:,index));
    speedc2connexterr(index)=std(speedpoolc2connext(:,index))/sqrt(length(speedpoolc2connext(:,index)));
    speedc2rewav(index)=mean(speedpoolc2reward(:,index));
    speedc2rewerr(index)=std(speedpoolc2reward(:,index))/sqrt(length(speedpoolc2reward(:,index)));
    speedc2postav(index)=mean(speedpoolc2post(:,index));
    speedc2posterr(index)=std(speedpoolc2post(:,index))/sqrt(length(speedpoolc2post(:,index)));
    speedc2postav2(index)=mean(speedpoolc2post2(:,index));
    speedc2posterr2(index)=std(speedpoolc2post2(:,index))/sqrt(length(speedpoolc2post2(:,index)));
    speedc2engageav(index)=mean(speedpoolc2engage(:,index));
    speedc2engageerr(index)=std(speedpoolc2engage(:,index))/sqrt(length(speedpoolc2engage(:,index)));
    speedc2reengageav(index)=mean(speedpoolc2reengage(:,index));
    speedc2reengageerr(index)=std(speedpoolc2reengage(:,index))/sqrt(length(speedpoolc2reengage(:,index)));
    speedc2miniav(index)=mean(speedpoolc2mini(:,index));
    speedc2minierr(index)=std(speedpoolc2mini(:,index))/sqrt(length(speedpoolc2mini(:,index)));
    
    
    lickc2conav(index)=mean(lickpoolc2con(:,index));
    lickc2conerr(index)=std(lickpoolc2con(:,index))/sqrt(length(lickpoolc2con(:,index)));
    lickc2conrewav(index)=mean(lickpoolc2conrew(:,index));
    lickc2conrewerr(index)=std(lickpoolc2conrew(:,index))/sqrt(length(lickpoolc2conrew(:,index)));
    lickc2connextav(index)=mean(lickpoolc2connext(:,index));
    lickc2connexterr(index)=std(lickpoolc2connext(:,index))/sqrt(length(lickpoolc2connext(:,index)));
    lickc2rewav(index)=mean(lickpoolc2reward(:,index));
    lickc2rewerr(index)=std(lickpoolc2reward(:,index))/sqrt(length(lickpoolc2reward(:,index)));
    lickc2postav(index)=mean(lickpoolc2post(:,index));
    lickc2posterr(index)=std(lickpoolc2post(:,index))/sqrt(length(lickpoolc2post(:,index)));
    lickc2postav2(index)=mean(lickpoolc2post2(:,index));
    lickc2posterr2(index)=std(lickpoolc2post2(:,index))/sqrt(length(lickpoolc2post2(:,index)));
    lickc2engageav(index)=mean(lickpoolc2engage(:,index));
    lickc2engageerr(index)=std(lickpoolc2engage(:,index))/sqrt(length(lickpoolc2engage(:,index)));
    lickc2reengageav(index)=mean(lickpoolc2reengage(:,index));
    lickc2reengageerr(index)=std(lickpoolc2reengage(:,index))/sqrt(length(lickpoolc2reengage(:,index)));
    lickc2miniav(index)=mean(lickpoolc2mini(:,index));
    lickc2minierr(index)=std(lickpoolc2mini(:,index))/sqrt(length(lickpoolc2mini(:,index)));
    
    if passiveday==0
    speedc2connorewardav(index)=mean(speedpoolc2connoreward(:,index));
    speedc2connorewarderr(index)=std(speedpoolc2connoreward(:,index))/sqrt(length(speedpoolc2connoreward(:,index)));
    speedc1missc1av(index)=mean(speedpoolc1missc1(:,index));
    speedc1missc1err(index)=std(speedpoolc1missc1(:,index))/sqrt(length(speedpoolc1missc1(:,index)));
    speedc1missc2av(index)=mean(speedpoolc1missc2(:,index));
    speedc1missc2err(index)=std(speedpoolc1missc2(:,index))/sqrt(length(speedpoolc1missc2(:,index)));
    speedc2missc1av(index)=mean(speedpoolc2missc1(:,index));
    speedc2missc1err(index)=std(speedpoolc2missc1(:,index))/sqrt(length(speedpoolc2missc1(:,index)));
    speedc2missc2av(index)=mean(speedpoolc2missc2(:,index));
    speedc2missc2err(index)=std(speedpoolc2missc2(:,index))/sqrt(length(speedpoolc2missc2(:,index)));
    
    lickc2connorewardav(index)=mean(lickpoolc2connoreward(:,index));
    lickc2connorewarderr(index)=std(lickpoolc2connoreward(:,index))/sqrt(length(lickpoolc2connoreward(:,index)));
    
    lickc1missc1av(index)=mean(lickpoolc1missc1(:,index));
    lickc1missc1err(index)=std(lickpoolc1missc1(:,index))/sqrt(length(lickpoolc1missc1(:,index)));
    lickc1missc2av(index)=mean(lickpoolc1missc2(:,index));
    lickc1missc2err(index)=std(lickpoolc1missc2(:,index))/sqrt(length(lickpoolc1missc2(:,index)));
    lickc2missc1av(index)=mean(lickpoolc2missc1(:,index));
    lickc2missc1err(index)=std(lickpoolc2missc1(:,index))/sqrt(length(lickpoolc2missc1(:,index)));
    lickc2missc2av(index)=mean(lickpoolc2missc2(:,index));
    lickc2missc2err(index)=std(lickpoolc2missc2(:,index))/sqrt(length(lickpoolc2missc2(:,index)));
    
    end
    
    end
end


for sig=1:signals
for index=1:60
    photometryc1conav(sig,index)=nanmean(photometrypoolc1con(:,index,sig));
    photometryc1conerr(sig,index)=nanstd(photometrypoolc1con(:,index,sig))/sqrt(length(photometrypoolc1con(:,index,sig)));
    photometryc1conrewav(sig,index)=nanmean(photometrypoolc1conrew(:,index,sig));
    photometryc1conrewerr(sig,index)=nanstd(photometrypoolc1conrew(:,index,sig))/sqrt(length(photometrypoolc1conrew(:,index,sig)));
    photometryc1connextav(sig,index)=nanmean(photometrypoolc1connext(:,index,sig));
    photometryc1connexterr(sig,index)=nanstd(photometrypoolc1connext(:,index,sig))/sqrt(length(photometrypoolc1connext(:,index,sig)));
    photometryc1rewav(sig,index)=nanmean(photometrypoolc1reward(:,index,sig));
    photometryc1rewerr(sig,index)=nanstd(photometrypoolc1reward(:,index,sig))/sqrt(length(photometrypoolc1reward(:,index,sig)));
    photometryc1postav(sig,index)=nanmean(photometrypoolc1post(:,index,sig));
    photometryc1posterr(sig,index)=nanstd(photometrypoolc1post(:,index,sig))/sqrt(length(photometrypoolc1post(:,index,sig)));
    photometryc1postav2(sig,index)=nanmean(photometrypoolc1post2(:,index,sig));
    photometryc1posterr2(sig,index)=nanstd(photometrypoolc1post2(:,index,sig))/sqrt(length(photometrypoolc1post2(:,index,sig)));
    photometryc1engageav(sig,index)=nanmean(photometrypoolc1engage(:,index,sig));
    photometryc1engageerr(sig,index)=nanstd(photometrypoolc1engage(:,index,sig))/sqrt(length(photometrypoolc1engage(:,index,sig)));
    photometryc1reengageav(sig,index)=nanmean(photometrypoolc1reengage(:,index,sig));
    photometryc1reengageerr(sig,index)=nanstd(photometrypoolc1reengage(:,index,sig))/sqrt(length(photometrypoolc1reengage(:,index,sig)));
    
    photometryc1miniav(sig,index)=nanmean(photometrypoolc1mini(:,index,sig));
    photometryc1minierr(sig,index)=nanstd(photometrypoolc1mini(:,index,sig))/sqrt(length(photometrypoolc1mini(:,index,sig)));
    
    
    
    if passiveday==0
        
    photometryc1connorewardav(sig,index)=nanmean(photometrypoolc1connoreward(:,index,sig));
    photometryc1connorewarderr(sig,index)=nanstd(photometrypoolc1connoreward(:,index,sig))/sqrt(length(photometrypoolc1connoreward(:,index,sig)));
    end
    
    if trainingday==1
    photometryc2conav(sig,index)=nanmean(photometrypoolc2con(:,index,sig));
    photometryc2conerr(sig,index)=nanstd(photometrypoolc2con(:,index,sig))/sqrt(length(photometrypoolc2con(:,index,sig)));
    if passiveday==0
    photometryc2connorewardav(sig,index)=nanmean(photometrypoolc2connoreward(:,index,sig));
    photometryc2connorewarderr(sig,index)=nanstd(photometrypoolc2connoreward(:,index,sig))/sqrt(length(photometrypoolc2connoreward(:,index,sig)));
    photometryc1missc1av(sig,index)=nanmean(photometrypoolc1missc1(:,index,sig));
    photometryc1missc1err(sig,index)=nanstd(photometrypoolc1missc1(:,index,sig))/sqrt(length(photometrypoolc1missc1(:,index,sig)));
    photometryc1missc2av(sig,index)=nanmean(photometrypoolc1missc2(:,index,sig));
    photometryc1missc2err(sig,index)=nanstd(photometrypoolc1missc2(:,index,sig))/sqrt(length(photometrypoolc1missc2(:,index,sig)));
    
    photometryc2missc1av(sig,index)=nanmean(photometrypoolc2missc1(:,index,sig));
    photometryc2missc1err(sig,index)=nanstd(photometrypoolc2missc1(:,index,sig))/sqrt(length(photometrypoolc2missc1(:,index,sig)));
    
    photometryc2missc2av(sig,index)=nanmean(photometrypoolc2missc2(:,index,sig));
    photometryc2missc2err(sig,index)=nanstd(photometrypoolc2missc2(:,index,sig))/sqrt(length(photometrypoolc2missc2(:,index,sig)));
    end
    photometryc2conrewav(sig,index)=nanmean(photometrypoolc2conrew(:,index,sig));
    photometryc2conrewerr(sig,index)=nanstd(photometrypoolc2conrew(:,index,sig))/sqrt(length(photometrypoolc2conrew(:,index,sig)));
    photometryc2connextav(sig,index)=nanmean(photometrypoolc2connext(:,index,sig));
    photometryc2connexterr(sig,index)=nanstd(photometrypoolc2connext(:,index,sig))/sqrt(length(photometrypoolc2connext(:,index,sig)));
    photometryc2rewav(sig,index)=nanmean(photometrypoolc2reward(:,index,sig));
    photometryc2rewerr(sig,index)=nanstd(photometrypoolc2reward(:,index,sig))/sqrt(length(photometrypoolc2reward(:,index,sig)));
    photometryc2postav(sig,index)=nanmean(photometrypoolc2post(:,index,sig));
    photometryc2posterr(sig,index)=nanstd(photometrypoolc2post(:,index,sig))/sqrt(length(photometrypoolc2post(:,index,sig)));
    photometryc2postav2(sig,index)=nanmean(photometrypoolc2post2(:,index,sig));
    photometryc2posterr2(sig,index)=nanstd(photometrypoolc2post2(:,index,sig))/sqrt(length(photometrypoolc2post2(:,index,sig)));
    photometryc2engageav(sig,index)=nanmean(photometrypoolc2engage(:,index,sig));
    photometryc2engageerr(sig,index)=nanstd(photometrypoolc2engage(:,index,sig))/sqrt(length(photometrypoolc2engage(:,index,sig)));
    photometryc2reengageav(sig,index)=nanmean(photometrypoolc2reengage(:,index,sig));
    photometryc2reengageerr(sig,index)=nanstd(photometrypoolc2reengage(:,index,sig))/sqrt(length(photometrypoolc2reengage(:,index,sig)));
    photometryc2miniav(sig,index)=nanmean(photometrypoolc2mini(:,index,sig));
    photometryc2minierr(sig,index)=nanstd(photometrypoolc2mini(:,index,sig))/sqrt(length(photometrypoolc2mini(:,index,sig)));
    
    end
    
end
end


%%%calculate false starts
% if countfalse>0
% countfalse=0;
% countcorrect=0;
% for trial=2:numel(trialstructure(:))-1
%     
%      if isstruct(trialstructure(trial).disengage) && trialstructure(trial).disengage.correct==0
%           countfalse=countfalse+1;
%           falsespeed(countfalse,:)=trialstructure(trial).disengage.speedtrace;
%           falselick(countfalse,:)=trialstructure(trial).disengage.licktrace;
%           for sig=1:signals
%           falsesignals(countfalse,:,sig)=trialstructure(trial).disengage.signals(sig).trace;
%           end
%           
%      elseif isstruct(trialstructure(trial).disengage) && trialstructure(trial).disengage.correct==1
%          countcorrect=countcorrect+1;
%           correctspeed(countcorrect,:)=trialstructure(trial).disengage.speedtrace;
%           correctlick(countcorrect,:)=trialstructure(trial).disengage.licktrace;
%           for sig=1:signals
%           correctsignals(countcorrect,:,sig)=trialstructure(trial).disengage.signals(sig).trace;
%           end
%      end
%           
% end
% 
% for sig=1:signals
%     for index=1:60
%     speedfalsestartav(index)=mean(falsespeed(:,index));
%     speedfalsestarterr(index)=std(falsespeed(:,index))/sqrt(length(falsespeed(:,index)));
%     lickfalsestartav(index)=mean(falselick(:,index));
%     lickfalsestarterr(index)=std(falselick(:,index))/sqrt(length(falselick(:,index)));
%     speedcorrectstartav(index)=mean(correctspeed(:,index));
%     speedcorrectstarterr(index)=std(correctspeed(:,index))/sqrt(length(correctspeed(:,index)));
%     lickcorrectstartav(index)=mean(correctlick(:,index));
%     lickcorrectstarterr(index)=std(correctlick(:,index))/sqrt(length(correctlick(:,index)));
%     
%     photometryfalsestartav(sig,index)=mean(falsesignals(:,index,sig));
%     photometryfalsestarterr(sig,index)=std(falsesignals(:,index,sig))/sqrt(length(falsesignals(:,index,sig)));
%     photometrycorrectstartav(sig,index)=mean(correctsignals(:,index,sig));
%     photometrycorrectstarterr(sig,index)=std(correctsignals(:,index,sig))/sqrt(length(correctsignals(:,index,sig)));
%     
%     
%     end
% end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%This is for plotting%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if plotting==1

xaxiscontext=trialstructure(2).contextbehavior.timetrace;
xaxis=trialstructure(2).contextbehavior.timetrace;
xaxisstop=xaxiscontext;
xaxismini=trialstructure(2).contextbehavior.timetrace

%%%plot speed trials%%%

figure

if trainingday==1
    bluebehavior=[0 0.4470 0.7410];
    yellowbehavior=[0.9290 0.6940 0.1250];
    bluespeed=[0 0.4470 0.7410];
    yellowspeed=[0.9290 0.6940 0.1250];
else
    bluebehavior=[0 0 0];
    yellowbehavior=[0 0 0];
    bluespeed=[1 0 0];
    yellowspeed=[1 0 0];
end

if context1==context2 && context1==1
    bluebehavior=[0 0.4470 0.7410];
    yellowbehavior=[0.3010 0.7450 0.9330];
    bluespeed=bluebehavior;
    yellowspeed=yellowbehavior;
    bluephoto=bluebehavior;
    yellowphoto=yellowbehavior;
end

if context1==context2 && context1==2
    bluebehavior=[0.3010 0.7450 0.9330];
    yellowbehavior=[0.9290 0.6940 0.1250];
    bluespeed=bluebehavior;
    yellowspeed=yellowbehavior;
    bluephoto=bluebehavior;
    yellowphoto=yellowbehavior;
end



if plotreward==1
    subplot(2,7,1)
    %plot(trialstructure(i).contextbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
%     errorbar(xaxiscontext,speedc1conrewav,speedc1conrewerr,'color',[0 0.4470 0.7410],'LineWidth',2)
    errorbar(xaxiscontext,speedc1conav,speedc1conerr,'color',bluespeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.3],'String',sprintf('%.2f',countc1context),'FitBoxToText','on');
    hold on
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Speed')
    hold on
    
        subplot(2,7,2)
    %plot(trialstructure(i).contextbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
%     errorbar(xaxiscontext,speedc1conrewav,speedc1conrewerr,'color',[0 0.4470 0.7410],'LineWidth',2)
    errorbar(xaxiscontext,speedc1connorewardav,speedc1connorewarderr,'color',bluespeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.3],'String',sprintf('%.2f',countc1context),'FitBoxToText','on');
    hold on
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Speed')
    hold on
    
        subplot(2,7,3)
    %plot(trialstructure(i).contextbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxiscontext,speedc1conrewav,speedc1conrewerr,'color',bluespeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.3],'String',sprintf('%.2f',countc1context),'FitBoxToText','on');
    hold on
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Speed')
    hold on
    
    subplot(2,7,4)
    %plot(trialstructure(i).rewardbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxisreward,speedc1rewav,speedc1rewerr,'color',bluespeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimreward])
    title('Reward: Speed')
    hold on
    
%     subplot(2,7,4)
%     %plot(trialstructure(i).postbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
%     errorbar(xaxismini,speedc1miniav,speedc1minierr,'color',bluespeed,'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([-2 2])
%     title('Mini: Speed')
%     hold on
    
    subplot(2,7,5)
    %plot(trialstructure(i).engagebehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxisengage,speedc1engageav,speedc1engageerr,'color',bluespeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimengage])
    title('Engage: Speed')
    hold on
    
    subplot(2,7,6)
    %plot(trialstructure(i).postbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxispost,speedc1postav,speedc1posterr,'color',bluespeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    title('After Reward: Speed')
    hold on
    
    

end
    
    
if trainingday==1 && plotfailure==1
    
    subplot(2,7,7)
    %plot(trialstructure(i).postbehavior.speedtrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxispost,speedc2postav,speedc2posterr,'color',bluespeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    title('After Fear: Speed')
    hold on
    
    
    subplot(2,7,1)
    %plot(trialstructure(i).contextbehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
%     errorbar(xaxiscontext,speedc2conrewav,speedc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,speedc2conav,speedc2conerr,'color',yellowspeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.2],'String',sprintf('%.2f',countc2context),'FitBoxToText','on');
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
    
        subplot(2,7,2)
    %plot(trialstructure(i).contextbehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
%     errorbar(xaxiscontext,speedc2conrewav,speedc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,speedc2connorewardav,speedc2connorewarderr,'color',yellowspeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.2],'String',sprintf('%.2f',countc2context),'FitBoxToText','on');
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
    
    hold on
    
    subplot(2,7,3)
    errorbar(xaxiscontext,speedc2conrewav,speedc2conrewerr,'color',yellowspeed,'LineWidth',2)
    annotation('textbox',[0.07 0.7 0.3 0.2],'String',sprintf('%.2f',countc2context),'FitBoxToText','on');
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
    
    
    subplot(2,7,4)
    %plot(trialstructure(i).rewardbehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
    errorbar(xaxisreward,speedc2rewav,speedc2rewerr,'color',yellowspeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimreward])
    hold on
    

    subplot(2,7,5)
    %plot(trialstructure(i).engagebehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
    errorbar(xaxisengage,speedc2engageav,speedc2engageerr,'color',yellowspeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimengage])
    hold on
    subplot(2,7,6)
   % plot(trialstructure(i).postbehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
    errorbar(xaxispost,speedc1postav2,speedc1posterr2,'color',yellowspeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    hold on
    
    subplot(2,7,7)
   % plot(trialstructure(i).postbehavior.speedtrace,'color',[0.9290 0.6940 0.1250],'LineWidth',0.25)
    errorbar(xaxispost,speedc2postav2,speedc2posterr2,'color',yellowspeed,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    hold on
    
end
%%%plot speed avg and sem%%%

if plotreward==1
    
    subplot(2,7,8)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxiscontext,lickc1conav,lickc1conerr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Lick')
    hold on
        subplot(2,7,9)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxiscontext,lickc1connorewardav,lickc1connorewarderr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Lick')
    hold on
    
    subplot(2,7,10)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxiscontext,lickc1conrewav,lickc1conrewerr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    title('Context Begin: Lick')
    hold on
    
    subplot(2,7,11)
    %plot(trialstructure(i).rewardbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxisreward,lickc1rewav,lickc1rewerr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimreward])
    title('Reward: Lick')
    hold on
    subplot(2,7,12)
    %plot(trialstructure(i).engagebehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxisengage,lickc1engageav,lickc1engageerr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimengage])
    title('Engage: Lick')
    hold on
    subplot(2,7,13)
    %plot(trialstructure(i).postbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxispost,lickc1postav,lickc1posterr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    title('After Reward: Lick')
    hold on
end
    
    if trainingday==1 && plotfailure==1
        
        
    subplot(2,7,14)
    %plot(trialstructure(i).postbehavior.licktrace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxispost,lickc2postav,lickc2posterr,'color',bluebehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    title('After Fear: Lick')
    hold on
    
    %else 
    subplot(2,7,8)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,lickc2conrewav,lickc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,lickc2conav,lickc2conerr,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
        subplot(2,7,9)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,lickc2conrewav,lickc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,lickc2connorewardav,lickc2connorewarderr,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
    
    subplot(2,7,10)
    %plot(trialstructure(i).contextbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,lickc2conrewav,lickc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,lickc2conrewav,lickc2conrewerr,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimcontext])
    hold on
    
    subplot(2,7,11)
    %plot(trialstructure(i).rewardbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxisreward,lickc2rewav,lickc2rewerr,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimreward])
    hold on
    subplot(2,7,12)
    %plot(trialstructure(i).engagebehavior.licktrace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxisengage,lickc2engageav,lickc2engageerr,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([xlimengage])
    hold on
    subplot(2,7,13)
    %plot(trialstructure(i).postbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxispost,lickc1postav2,lickc1posterr2,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    hold on
    
    subplot(2,7,14)
    %plot(trialstructure(i).postbehavior.licktrace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxispost,lickc2postav2,lickc2posterr2,'color',yellowbehavior,'LineWidth',2)
    line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
    ylim([0 10])
    xlim([-0 5])
    hold on
    
  %  end
    end
set(gcf, 'Position',  [250, 750, 1000, 300])
saveas(gcf,'speedlickbehaviorphases.eps','epsc')

%end

if trainingday==1 && plotreward==plotfailure
    bluephoto=[0 0.4470 0.7410];
    yellowphoto=[0.9290 0.6940 0.1250];
elseif trainingday==0 || plotreward~=plotfailure
%     bluephoto=[0 0 0];
%     yellowphoto=[0 0 0];
    bluephoto=[0 0.4470 0.7410];
    yellowphoto=[0.9290 0.6940 0.1250];
end

if context1==context2
    bluephoto=bluebehavior;
    yellowphoto=yellowbehavior;
end



figure
for sig=1:signals
%for i=2:numel(trialstructure(:))
        
if plotreward==1
   % if trialstructure(i).context==1
    subplot(5,7,1+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
%     errorbar(xaxiscontext,photometryc1conrewav(sig,:),photometryc1conrewerr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
    errorbar(xaxiscontext,photometryc1conav(sig,:),photometryc1conerr(sig,:),'color',bluephoto,'LineWidth',2)
    x=photometrypoolc1con(:,1,sig);
    x2=photometrypoolc2con(:,1,sig);
    annotation('textbox',[0.01 0.9/sig 0.1 0.1],'String',sprintf('%.2f',length(x(~isnan(x)))),'FitBoxToText','on');
    annotation('textbox',[0.07 0.9/sig 0.1 0.1],'String',sprintf('%.2f',length(x2(~isnan(x2)))),'FitBoxToText','on');
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxiscontext)
    xlim([xlimcontext])
    title('Context Begin: Signal')
    hold on
    
        subplot(5,7,2+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
%     errorbar(xaxiscontext,photometryc1conrewav(sig,:),photometryc1conrewerr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
    errorbar(xaxiscontext,photometryc1connorewardav(sig,:),photometryc1connorewarderr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxiscontext)
    xlim([xlimcontext])
    title('Context Begin: Signal')
    hold on
    
        subplot(5,7,3+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0 0.4470 0.7410],'LineWidth',0.25)
    errorbar(xaxiscontext,photometryc1conrewav(sig,:),photometryc1conrewerr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisconrew)
    xlim([xlimcontext])
    title('Context Begin: Signal')
    hold on
    
    
    subplot(5,7,4+((sig-1)*7))
    %plot(trialstructure(i).rewardbehavior.signals(sig).trace,'color',[0 0.4470 0.7410])
    errorbar(xaxisreward,photometryc1rewav(sig,:),photometryc1rewerr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisreward)
    xlim([xlimreward])
    title('Reward: Signal')
    hold on
    
%     subplot(5,7,4+((sig-1)*7))
%     %plot(trialstructure(i).engagebehavior.signals(sig).trace,'color',[0 0.4470 0.7410])
%     errorbar(xaxismini,photometryc1miniav(sig,:),photometryc1minierr(sig,:),'color',bluephoto,'LineWidth',2)
%     line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
%     ylim(yaxis)
%     xlim([-2 2])
%     title('Mini: Signal')
%     hold on
    
    subplot(5,7,5+((sig-1)*7))
    %plot(trialstructure(i).engagebehavior.signals(sig).trace,'color',[0 0.4470 0.7410])
    errorbar(xaxisengage,photometryc1engageav(sig,:),photometryc1engageerr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisengage)
    xlim([xlimengage])
    title('Engage: Signal')
    hold on
    
    subplot(5,7,6+((sig-1)*7))
    %plot(trialstructure(i).postbehavior.signals(sig).trace,'color',[0 0.4470 0.7410])
    errorbar(xaxispost,photometryc1postav(sig,:),photometryc1posterr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxis)
    xlim([-0 5])
    title('After Reward: Signal')
    hold on
    
end
    
    if trainingday==1 && plotfailure==1
        
    subplot(5,7,7+((sig-1)*7))
    %plot(trialstructure(i).postbehavior.signals(sig).trace,'color',[0 0.4470 0.7410])
    errorbar(xaxispost,photometryc2postav(sig,:),photometryc2posterr(sig,:),'color',bluephoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxis)
    xlim([-0 5])
    title('After Fear: Signal')
    hold on
    
    
 %   else 
    subplot(5,7,1+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,photometryc2conav(sig,:),photometryc2conerr(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxiscontext)
    xlim([xlimcontext])
    hold on
    
    subplot(5,7,2+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,photometryc2connorewardav(sig,:),photometryc2connorewarderr(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxiscontext)
    xlim([xlimcontext])
    hold on
    
    subplot(5,7,3+((sig-1)*7))
    %plot(trialstructure(i).contextbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisconrew)
    xlim([xlimcontext])
    hold on
    
    subplot(5,7,4+((sig-1)*7))
    %plot(trialstructure(i).rewardbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxisreward,photometryc2rewav(sig,:),photometryc2rewerr(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    line([3 3],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisreward)
    xlim([xlimreward])
    hold on
    
%     subplot(5,7,4+((sig-1)*7))
%     %plot(trialstructure(i).engagebehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
%     errorbar(xaxismini,photometryc2miniav(sig,:),photometryc2minierr(sig,:),'color',yellowphoto,'LineWidth',2)
%     line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
%     ylim(yaxis)
%     xlim([-2 2])
%     hold on
    
    subplot(5,7,5+((sig-1)*7))
    %plot(trialstructure(i).engagebehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxisengage,photometryc2engageav(sig,:),photometryc2engageerr(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxisengage)
    xlim([xlimengage])
    hold on
    
    subplot(5,7,6+((sig-1)*7))
    %plot(trialstructure(i).postbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxispost,photometryc1postav2(sig,:),photometryc1posterr2(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxis)
    xlim([-0 5])
    hold on
    
    subplot(5,7,7+((sig-1)*7))
    %plot(trialstructure(i).postbehavior.signals(sig).trace,'color',[0.9290 0.6940 0.1250])
    errorbar(xaxispost,photometryc2postav2(sig,:),photometryc2posterr2(sig,:),'color',yellowphoto,'LineWidth',2)
    line([0 0],[-2 3],'color',[0 0 0], 'LineWidth',.25)
    ylim(yaxis)
    xlim([-0 5])
    hold on
  %  end
    end
  %  end
    
end

set(gcf, 'Position',  [1000, 10, 1000, 1000])
saveas(gcf,'photometrycontextdifferences.eps','epsc')




% 
% 
% %%%plot speed trials%%%
% figure
% for sig=[1,2,3] %1:signals %[1,3]   %
%     if sig==1
%         color=[0.2 0 0]
%     elseif sig==2
%         color=[0.4940, 0.1840, 0.5560]
%     elseif sig==3
%         color=[0.4660, 0.6740, 0.1880]
%     elseif sig==4
%         color=[1, 0, 0]
%     elseif sig==5
%         color=[0.4940, 0.1840, 0.5560]
%     end
%         
%         
%     subplot(2,6,1)
%     errorbar(xaxiscontext,photometryc1conav(sig,:),photometryc1conerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('All Context: Signals')
%     hold on
%         subplot(2,6,2)
%     errorbar(xaxiscontext,photometryc1connorewardav(sig,:),photometryc1connorewarderr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('Miss Context: Signals')
%     hold on
%         subplot(2,6,3)
%     errorbar(xaxiscontext,photometryc1conrewav(sig,:),photometryc1conrewerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('Stop Context: Signals')
%     hold on
%     subplot(2,6,4)
%     errorbar(xaxisreward,photometryc1rewav(sig,:),photometryc1rewerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxisreward])
%     xlim([xlimreward])
%     title('Reward: Signals')
%     hold on
%     subplot(2,6,5)
%     errorbar(xaxisstop,photometryc1postav(sig,:),photometryc1posterr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-2 2])
%     title('Context Stop: Signals')
%     hold on
%     subplot(2,6,6)
%     errorbar(xaxis,photometryc1engageav(sig,:),photometryc1engageerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxisengage])
%     xlim([xlimengage])
%     title('Engage: Signals')
%     hold on
%      
%     if trainingday==1
%     subplot(2,6,7)
%     errorbar(xaxiscontext,photometryc2conav(sig,:),photometryc2conerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('All Context: Signals')
%     hold on
%         subplot(2,6,8)
%     errorbar(xaxiscontext,photometryc2connorewardav(sig,:),photometryc2connorewarderr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('Miss Context: Signals')
%     hold on
%     subplot(2,6,9)
%     errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxiscontext])
%     xlim([xlimcontext])
%     title('Stop Context: Signals')
%     hold on
%     subplot(2,6,10)
%     errorbar(xaxisreward,photometryc2rewav(sig,:),photometryc2rewerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxisreward])
%     xlim([xlimreward])
%     title('Reward: Signals')
%     hold on
%     subplot(2,6,11)
%     errorbar(xaxisstop,photometryc2miniav(sig,:),photometryc2posterr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-2 2])
%     title('Context Stop: Signals')
%     hold on
%     subplot(2,6,12)
%     errorbar(xaxis,photometryc2engageav(sig,:),photometryc2engageerr(sig,:),'color',color,'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxisengage])
%     xlim([xlimengage])
%     title('Engage: Signals')
%     hold on
%     end
% end
% set(gcf, 'Position',  [500, 750, 1000, 300])
% % set(gcf, 'Position',  [750, 750, 500, 300])
% saveas(gcf,'photometrydifferences.eps','epsc')
% 
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%Reward or no Reward%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure
% 
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc1conav,speedc1conerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     title('All: Speed')
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc1conrewav,speedc1conrewerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     title('Reward/No: Speed')
%     hold on
%     
%     subplot(2,3,3)
%     errorbar(xaxiscontext,speedc2conrewav,speedc2conrewerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     title('Reward/No: Speed')
%     hold on
%     
%     
% if trainingday==1
%     
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc2conav,speedc2conerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc1connorewardav,speedc1connorewarderr,'color',[0.2 0 0],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     title('Reward/No: Speed')
%     
%     hold on
%     
%     subplot(2,3,3)
%     errorbar(xaxiscontext,speedc2connorewardav,speedc2connorewarderr,'color',[0.2 0 0],'LineWidth',2)
%     ylim([0 3])
%     xlim([-0.5 3.5])
%     
%     hold on
% end
% 
% 
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc1conav,lickc1conerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('All: Lick')
%     hold on
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc1conrewav,lickc1conrewerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('Reward/No: Lick')
%     
%     hold on
%     
%     
%     subplot(2,3,6)
%     errorbar(xaxiscontext,lickc2conrewav , lickc2conrewerr ,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('Reward/No: Lick')
%      hold on
%     
% 
%     
%     if trainingday==1
%         
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc2conav,lickc2conerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     hold on
%     
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc1connorewardav,lickc1connorewarderr,'color',[0.2 0 0],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('Reward/No: Lick')
%     
%     hold on
%     
%      
%     subplot(2,3,6)
%     errorbar(xaxiscontext,lickc2connorewardav,lickc2connorewarderr,'color',[0.2 0 0],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10]) 
%     xlim([-0.5 3.5])
%     hold on
%     end
% set(gcf, 'Position',  [750, 750, 500, 300])
%     
% saveas(gcf,'behaviorallgotmissed.eps','epsc')
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
% figure
% for sig=1:signals
%     
%     
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1conav(sig,:),photometryc1conerr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-0.5 3.5])
%     title('All: Signal')
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1conrewav(sig,:),photometryc1conrewerr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-0.5 3.5])
%     title('Reward/No: Signal')
%     hold on
%     
%     
%     subplot(5,3,3+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2conrewav(sig,:),photometryc2conrewerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-0.5 3.5])
%     title('Reward/No: Signal')
%     hold on
%     
%     
%     
%     if trainingday==1
%         
%         
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2conav(sig,:),photometryc2conerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-0.5 3.5])
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1connorewardav(sig,:),photometryc1connorewarderr(sig,:),'color',[0.2 0 0],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%    ylim([yaxis])
%     xlim([-0.5 3.5])
%     hold on
%     
%     
%     subplot(5,3,3+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2connorewardav(sig,:),photometryc2connorewarderr(sig,:),'color',[0.2 0 0],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     xlim([-0.5 3.5])
%     hold on
%     end
%     
% end
% set(gcf, 'Position',  [1500, 1500, 500, 1000])
% 
% saveas(gcf,'photometryallgotmissed.eps','epsc')
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%Reward or no Reward%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if passiveday==0
% figure
% 
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc1missc1av,speedc1missc1err,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     title('Context Miss C1: Speed')
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc2missc1av,speedc2missc1err,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     title('Context Miss C2: Speed')
%     hold on
% 
%     
%     
% if trainingday==1
%     
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc1missc2av,speedc1missc2err,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     ylim([0 3])
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc2missc2av,speedc2missc2err,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3])
%     
%     hold on
% 
% end
% 
% 
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc1missc1av,lickc1missc1err,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     title('Context Begin: Lick')
%     hold on
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc2missc1av,lickc2missc1err,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     title('Context Reward: Lick')
%     
%     hold on
%     
%     
% 
%     
%     if trainingday==1
%         
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc1missc2av,lickc1missc2err,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     hold on
%     
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc2missc2av,lickc2missc2err,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     title('Context No Reward: Lick')
%     
%     hold on
% 
%     end
% set(gcf, 'Position',  [750, 750, 750, 300])
%     
% saveas(gcf,'behaviormissnext.eps','epsc')
% 
% 
% figure
% for sig=1:signals
%     
%     
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1missc1av(sig,:),photometryc1missc1err(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     title('Context Begin: Signal')
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2missc1av(sig,:),photometryc2missc1err(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%   ylim([yaxis])
%     title('Context Begin: Signal')
%     hold on
%     
%     
%     
%     
%     
%     if trainingday==1
%         
%         
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1missc2av(sig,:),photometryc1missc2err(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([yaxis])
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2missc2av(sig,:),photometryc2missc2err(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%    ylim([yaxis])
%     title('Context Begin: Signal')
%     hold on
%     
%     
% end
% set(gcf, 'Position',  [1500, 1500, 750, 1000])
% end
% saveas(gcf,'photometrymissnext.eps','epsc')
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%Reward or no Reward%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure
% 
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc1connorewardav,speedc1connorewarderr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3.5])
%     xlim([-0.5 3.5])
%     title('All: Speed')
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc1reengageav,speedc1reengageerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3.5])
%     xlim([-1.5 1.5])
%     title('Reengage C1: Speed')
%     hold on
%     
%     if trainingday==1
%         
%     subplot(2,3,1)
%     errorbar(xaxiscontext,speedc2connorewardav,speedc2connorewarderr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3.5])
%     xlim([-0.5 3.5])
%     title('All: Speed')
%     hold on
%     
%     subplot(2,3,2)
%     errorbar(xaxiscontext,speedc2reengageav,speedc2reengageerr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 3.5])
%     xlim([-1.5 1.5])
%     title('Reengage C2: Speed')
%     hold on
%     end
%     
% 
% 
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc1connorewardav,lickc1connorewarderr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('All: Lick')
%     hold on
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc1reengageav,lickc1reengageerr,'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-1.5 1.5])
%     title('Reengage C1: Lick')
%     
%     hold on
%     
%     if trainingday==1
%     subplot(2,3,4)
%     errorbar(xaxiscontext,lickc2connorewardav,lickc2connorewarderr,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-0.5 3.5])
%     title('All: Lick')
%     hold on
%     
%     subplot(2,3,5)
%     errorbar(xaxiscontext,lickc2reengageav , lickc2reengageerr ,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[0 10],'color',[0 0 0], 'LineWidth',.25)
%     ylim([0 10])
%     xlim([-1.5 1.5])
%     title('Reengage C2: Lick')
%      hold on
%     end
%      
% set(gcf, 'Position',  [750, 750, 500, 300])
%     
% saveas(gcf,'behaviorreengage.eps','epsc')
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
% figure
% for sig=1:signals
%     
%     
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1connorewardav(sig,:),photometryc1connorewarderr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([-1.5 1.5])
%     title('All: Signal')
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc1reengageav(sig,:),photometryc1reengageerr(sig,:),'color',[0 0.4470 0.7410],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([-1.5 1.5])
%     title('Reengage: Signal')
%     hold on
%     
%     if trainingday==1
%     
%     subplot(5,3,1+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2connorewardav(sig,:),photometryc2connorewarderr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([-1.5 1.5])
%     title('Reengage: Signal')
%     hold on
%     
%     subplot(5,3,2+((sig-1)*3))
%     errorbar(xaxiscontext,photometryc2reengageav(sig,:),photometryc2reengageerr(sig,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
%     line([0 0],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     line([3 3],[-2 2],'color',[0 0 0], 'LineWidth',.25)
%     ylim([-1 1])
%     xlim([-1.5 1.5])
%     title('Reengage: Signal')
%     hold on
%     
%     end
%     
%     
end
% set(gcf, 'Position',  [1500, 1500, 500, 1000])
% 
% saveas(gcf,'photometryallreenngage.eps','epsc')

