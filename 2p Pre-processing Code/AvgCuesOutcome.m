clear all
clear all

load 'imagingbehavior.mat'
% load 'onlybehavior.mat'

colnum=20;
speedcolumn=5;

plottingsingleneurons=0;
plottingsingletrials=1;

habituation=0;
trainday=1;

if habituation==1
    imagingbehavior(:,13)=1;
end

mkdir neurontunings

cue2neuronrun=nan(1,40);
cue2neuronstop=nan(1,40);
cue2speedrun=nan(1,40);
cue2speedstop=nan(1,40);
reward2neuron=nan(1,40);
reward2speed=nan(1,40);
rewardrun2neuron=nan(1,40);
rewardrun2speed=nan(1,40);

cue1neuronrun=nan(1,40);
cue1neuronstop=nan(1,40);
cue1speedrun=nan(1,40);
cue1speedstop=nan(1,40);
reward1neuron=nan(1,40);
reward1speed=nan(1,40);
rewardrun1neuron=nan(1,40);
rewardrun1speed=nan(1,40);

xaxis=[-1.2:.3:3];
xaxisstop=[-2.7:.3:9];
xaxisrew=[-5.7:.3:6];
           xaxisrun=[-5.7:.3:6];
neuroncount=0;
for neuron=1:numel(Fnew(:,1))
    neuroncount=neuroncount+1;
   figure
   
        filename=strcat('neuron',num2str(neuron),'.tiff');
             
        strcat('/neurontunings/',filename)
   
   cues1stop=0;
   cues2stop=0;
   cues1run=0;
   cues2run=0;
   reward1=0;
   reward2=0;
   for i=1:numel(imagingbehavior(:,1))
       
       %%%context 1 stop or run
       if imagingbehavior(i,6)==1 && imagingbehavior(i-1,6)==0 
           endcontextime=imagingbehavior(find(imagingbehavior(i:end,6)==0,1)+i-1,1)-imagingbehavior(i,1)
       
           if ~isempty(endcontextime) && endcontextime>5 && imagingbehavior(i,13)==1 && numel(imagingbehavior(:,1))>=(i+29)
               cues1stop=cues1stop+1;
               cue1neuronstop(cues1stop,1:40)=imagingbehavior(i-10:i+29,colnum+1+neuroncount);

               cue1speedstop(cues1stop,1:40)=imagingbehavior(i-10:i+29,speedcolumn);
%                hello
           
           elseif ~isempty(endcontextime) && endcontextime<5 && imagingbehavior(i,13)==1 && numel(imagingbehavior(:,1))>=(i+29)
               cues1run=cues1run+1;
               cue1neuronrun(cues1run,1:40)=imagingbehavior(i-10:i+29,colnum+1+neuroncount);
               cue1speedrun(cues1run,1:40)=imagingbehavior(i-10:i+29,speedcolumn);
               
               
           end
           
       %%%context 2 stop or run
       
           if ~isempty(endcontextime) && endcontextime>5 && imagingbehavior(i,13)==2 && numel(imagingbehavior(:,1))>=(i+29)
           
           cues2stop=cues2stop+1;
           cue2neuronstop(cues2stop,1:40)=imagingbehavior(i-10:i+29,colnum+1+neuroncount);
           cue2speedstop(cues2stop,1:40)=imagingbehavior(i-10:i+29,speedcolumn);
           
           
           elseif ~isempty(endcontextime) && endcontextime<5 && imagingbehavior(i,13)==2 && numel(imagingbehavior(:,1))>=(i+29)
           
               cues2run=cues2run+1;
               cue2neuronrun(cues2run,1:40)=imagingbehavior(i-10:i+29,colnum+1+neuroncount);
               cue2speedrun(cues2run,1:40)=imagingbehavior(i-10:i+29,speedcolumn);
           end
           
       
       end
       
       %%%reward 1
       if imagingbehavior(i,9)==1 && imagingbehavior(i-1,9)==0 && imagingbehavior(i,13)==1 && numel(imagingbehavior(:,1))>=(i+19)
           
           reward1=reward1+1;
           reward1neuron(reward1,1:40)=imagingbehavior(i-20:i+19,colnum+1+neuroncount);
           reward1speed(reward1,1:40)=imagingbehavior(i-20:i+19,speedcolumn);
           reward1speedoriginal(reward1,1:40)=imagingbehavior(i-20:i+19,17);
           
           
           %%%run check
           endreward=find(imagingbehavior(i:end,9)==0,1)+i-1;
           startnext=find(imagingbehavior(endreward:end,6)==1,1)+endreward-1
           runstart=find(imagingbehavior(1:startnext-1,17)<2,1,'last')
           if numel(imagingbehavior(:,1))>=(runstart+19) && runstart>20
           rewardrun1speed(reward1,1:40)=imagingbehavior(runstart-20:runstart+19,speedcolumn);
           rewardrun1neuron(reward1,1:40)=imagingbehavior(runstart-20:runstart+19,colnum+1+neuroncount);
           rewardrun1speedoriginal(reward1,1:40)=imagingbehavior(runstart-20:runstart+19,17);
           end

           
       end
       
       if imagingbehavior(i,10)==1 && imagingbehavior(i-1,10)==0 && imagingbehavior(i,13)==2 && numel(imagingbehavior(:,1))>=(i+12)
           
           reward2=reward2+1;
           reward2neuron(reward2,1:40)=imagingbehavior(i-20:i+19,colnum+1+neuroncount);
           reward2speed(reward2,1:40)=imagingbehavior(i-20:i+19,speedcolumn);
           
           %%%run check
           endreward=find(imagingbehavior(i:end,10)==0,1)+i-1;
           startnext=find(imagingbehavior(endreward:end,6)==1,1)+endreward-1
           runstart=find(imagingbehavior(1:startnext-1,17)<2,1,'last')
           if numel(imagingbehavior(:,1))>=(runstart+19) && runstart>20
           rewardrun2speed(reward2,1:40)=imagingbehavior(runstart-20:runstart+19,speedcolumn);
           rewardrun2neuron(reward2,1:40)=imagingbehavior(runstart-20:runstart+19,colnum+1+neuroncount);
           end
           
%            hello
       end
       
       
       
   end
   
   for ii=1:40
           cue1neuronstopavg(1,ii)=nanmean(cue1neuronstop(:,ii));
           cue1neuronstopavg(2,ii)=nanstd(cue1neuronstop(:,ii))/sqrt(length(cue1neuronstop(:,ii)));
           cue1speedstopavg(1,ii)=nanmean(cue1speedstop(:,ii));
           cue1speedstopavg(2,ii)=nanstd(cue1speedstop(:,ii))/sqrt(length(cue1speedstop(:,ii)));
           reward1neuronavg(1,ii)=nanmean(reward1neuron(:,ii));
           reward1neuronavg(2,ii)=nanstd(reward1neuron(:,ii))/sqrt(length(reward1neuron(:,ii)));
           reward1speedavg(1,ii)=nanmean(reward1speed(:,ii));
           reward1speedavg(2,ii)=nanstd(reward1speed(:,ii))/sqrt(length(reward1speed(:,ii)));
           
           cue2neuronstopavg(1,ii)=nanmean(cue2neuronstop(:,ii));
           cue2neuronstopavg(2,ii)=nanstd(cue2neuronstop(:,ii))/sqrt(length(cue2neuronstop(:,ii)));
           cue2speedstopavg(1,ii)=nanmean(cue2speedstop(:,ii));
           cue2speedstopavg(2,ii)=nanstd(cue2speedstop(:,ii))/sqrt(length(cue2speedstop(:,ii)));
           reward2neuronavg(1,ii)=nanmean(reward2neuron(:,ii));
           reward2neuronavg(2,ii)=nanstd(reward2neuron(:,ii))/sqrt(length(reward2neuron(:,ii)));
           reward2speedavg(1,ii)=nanmean(reward2speed(:,ii));
           reward2speedavg(2,ii)=nanstd(reward2speed(:,ii))/sqrt(length(reward2speed(:,ii)));
   end
       
       
       
       for ii=1:40
           cue1neuronrunavg(1,ii)=nanmean(cue1neuronrun(:,ii));
           cue1neuronrunavg(2,ii)=nanstd(cue1neuronrun(:,ii))/sqrt(length(cue1neuronrun(:,ii)));
           reward1neuronavg(1,ii)=nanmean(reward1neuron(:,ii));
           reward1neuronavg(2,ii)=nanstd(reward1neuron(:,ii))/sqrt(length(reward1neuron(:,ii)));
           
           cue1speedrunavg(1,ii)=nanmean(cue1speedrun(:,ii));
           cue1speedrunavg(2,ii)=nanstd(cue1speedrun(:,ii))/sqrt(length(cue1speedrun(:,ii)));
           
           rewardrun1neuronavg(1,ii)=nanmean(rewardrun1neuron(:,ii));
           rewardrun1neuronavg(2,ii)=nanstd(rewardrun1neuron(:,ii))/sqrt(length(rewardrun1neuron(:,ii)));
           rewardrun1speedavg(1,ii)=nanmean(rewardrun1speed(:,ii));
           rewardrun1speedavg(2,ii)=nanstd(rewardrun1speed(:,ii))/sqrt(length(rewardrun1speed(:,ii)));
           
           cue2neuronrunavg(1,ii)=nanmean(cue2neuronrun(:,ii));
           cue2neuronrunavg(2,ii)=nanstd(cue2neuronrun(:,ii))/sqrt(length(cue2neuronrun(:,ii)));
           
           cue2speedrunavg(1,ii)=nanmean(cue2speedrun(:,ii));
           cue2speedrunavg(2,ii)=nanstd(cue2speedrun(:,ii))/sqrt(length(cue2speedrun(:,ii)));
           
           
           rewardrun2neuronavg(1,ii)=nanmean(rewardrun2neuron(:,ii));
           rewardrun2neuronavg(2,ii)=nanstd(rewardrun2neuron(:,ii))/sqrt(length(rewardrun2neuron(:,ii)));
           rewardrun2speedavg(1,ii)=nanmean(rewardrun2speed(:,ii));
           rewardrun2speedavg(2,ii)=nanstd(rewardrun2speed(:,ii))/sqrt(length(rewardrun2speed(:,ii)));
           
       end
       
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%Context 1%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       if plottingsingleneurons==1
       
           subplot(5,4,1)
           errorbar(xaxisstop,cue1neuronrunavg(1,:),cue1neuronrunavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           title('Context (Run)')
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-4 10])
            ylim([-0.75 0.75])
           hold on
           subplot(5,4,2)
           errorbar(xaxisstop,cue1neuronstopavg(1,:),cue1neuronstopavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           title('Context (Stop)')
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
           xlim([-4 10])
            ylim([-0.75 0.75])
           hold on
           subplot(5,4,3)
           errorbar(xaxisrew,reward1neuronavg(1,:),reward1neuronavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Reward')
           hold on
           subplot(5,4,4)
           errorbar(xaxisrun,rewardrun1neuronavg(1,:),rewardrun1neuronavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Run')
           hold on
           
           %%%%heatmap%%%%
            
           subplot(5,4,5)
           imagesc(cue1neuronrun)
           title('Context (Run)')
           hold on
           subplot(5,4,6)
           imagesc(cue1neuronstop)
           title('Context (Stop)')
           hold on
           subplot(5,4,7)
           imagesc(reward1neuron)
           title('Reward')
           hold on
           subplot(5,4,8)
           imagesc(rewardrun1neuron)
           title('Run')
           hold on
           
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%Context 2%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       
           subplot(5,4,9)
           errorbar(xaxisstop,cue2neuronrunavg(1,:),cue2neuronrunavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           title('Context (Run)')
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-4 10])
            ylim([-0.75 0.75])
           hold on
           subplot(5,4,10)
           errorbar(xaxisstop,cue2neuronstopavg(1,:),cue2neuronstopavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           title('Context (Stop)')
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-4 10])
            ylim([-0.75 0.75])
           hold on
           subplot(5,4,11)
           errorbar(xaxisrew,reward2neuronavg(1,:),reward2neuronavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Reward')
           hold on
           subplot(5,4,12)
           errorbar(xaxisrun,rewardrun2neuronavg(1,:),rewardrun2neuronavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Run')
           hold on
           
           
           %%%%heatmap
            
           subplot(5,4,13)
           imagesc(cue2neuronrun)
           title('Context (Run)')
           hold on
           subplot(5,4,14)
           imagesc(cue2neuronstop)
           title('Context (Stop)')
           hold on
           subplot(5,4,15)
           imagesc(reward2neuron)
           title('Reward')
           hold on
           subplot(5,4,16)
           imagesc(rewardrun2neuron)
           title('Reward')
           hold on
           
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%Context 1/2 BEHAVIOR%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           
           subplot(5,4,17)
           errorbar(xaxisstop,cue1speedrunavg(1,:),cue1speedrunavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           title('Context (Run)')
            xlim([-4 10])
            ylim([0 3])
           line([0 0],[-.25 3],'color',[0 0 0], 'LineWidth',.25)
           hold on
           subplot(5,4,18)
           errorbar(xaxisstop,cue1speedstopavg(1,:),cue1speedstopavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           title('Context (Stop)')
            ylim([0 3])
            xlim([-4 10])
           line([0 0],[-.25 10],'color',[0 0 0], 'LineWidth',.25)
           hold on
           subplot(5,4,19)
           errorbar(xaxisrew,reward1speedavg(1,:),reward1speedavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-.25 10],'color',[0 0 0], 'LineWidth',.25)
           title('Reward')
            xlim([-7 7])
            ylim([0 3])
           hold on
           subplot(5,4,20)
           errorbar(xaxisrun,rewardrun1speedavg(1,:),rewardrun1speedavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-0 3],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
           title('Run')
           hold on
           
           
           subplot(5,4,17)
           errorbar(xaxisstop,cue2speedrunavg(1,:),cue2speedrunavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           title('Context (Run)')
            xlim([-4 10])
            ylim([0 3])
           line([0 0],[-.25 3],'color',[0 0 0], 'LineWidth',.25)
           hold on
           subplot(5,4,18)
           errorbar(xaxisstop,cue2speedstopavg(1,:),cue2speedstopavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           title('Context (Stop)')
            ylim([0 3])
            xlim([-4 10])
           line([0 0],[-.25 10],'color',[0 0 0], 'LineWidth',.25)
           hold on
           subplot(5,4,19)
           errorbar(xaxisrew,reward2speedavg(1,:),reward2speedavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           line([0 0],[-.25 10],'color',[0 0 0], 'LineWidth',.25)
           title('Reward')
            xlim([-7 7])
            ylim([0 3])
           hold on
           subplot(5,4,20)
           errorbar(xaxisrun,rewardrun2speedavg(1,:),rewardrun2speedavg(2,:),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
           line([0 0],[-0 3],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([0 3])
           title('Run')
           hold on
           
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%PLOT%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       
           
           
            set(gcf, 'Position',  [0, 500, 500, 1000])
           
            fname = strcat(pwd,'/neurontunings/')

            saveas(gcf,fullfile(fname,filename))
            
           if neuron==3
                hello
           end
            
       end
            
           cue1neuronruncompiled(:,:,neuron)=cue1neuronrun;
           cue1neuronstopcompiled(:,:,neuron)=cue1neuronstop;
           reward1neuroncompiled(:,:,neuron)=reward1neuron;
           rewardrun1neuroncompiled(:,:,neuron)=rewardrun1neuron;
           
           cue2neuronruncompiled(:,:,neuron)=cue2neuronrun;
           cue2neuronstopcompiled(:,:,neuron)=cue2neuronstop;
           reward2neuroncompiled(:,:,neuron)=reward2neuron;
           rewardrun2neuroncompiled(:,:,neuron)=rewardrun2neuron;
           


            
            
            close all
            close all
   
end


mkdir populationtunings

if plottingsingletrials==1
for i=1:numel(cue1neuronstopcompiled(:,1,neuron))
    for ii=1:numel(cue1neuronstopcompiled(1,1,:))
        cue1neuronstemp(ii,:)=cue1neuronstopcompiled(i,:,ii);
        reward1neuronstemp(ii,:)=reward1neuroncompiled(i,:,ii);
        rewardrun1neuronstemp(ii,:)=rewardrun1neuroncompiled(i,:,ii);
    end
    
    
   for ii=1:40
           cue1neuronstopavg(1,ii)=nanmean(cue1neuronstemp(:,ii));
           cue1neuronstopavg(2,ii)=nanstd(cue1neuronstemp(:,ii))/sqrt(length(cue1neuronstemp(:,ii)));
           reward1neuronavg(1,ii)=nanmean(reward1neuronstemp(:,ii));
           reward1neuronavg(2,ii)=nanstd(reward1neuronstemp(:,ii))/sqrt(length(reward1neuronstemp(:,ii)));
           rewardrun1neuronavg(1,ii)=nanmean(rewardrun1neuronstemp(:,ii));
           rewardrun1neuronavg(2,ii)=nanstd(rewardrun1neuronstemp(:,ii))/sqrt(length(rewardrun1neuronstemp(:,ii)));
   end
   
           figure
           
           subplot(2,3,1)
           errorbar(xaxisstop,cue1neuronstopavg(1,:),cue1neuronstopavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           title('Context (Stop)')
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
           xlim([-4 10])
            ylim([-0.75 0.75])
           hold on
           subplot(2,3,2)
           errorbar(xaxisrew,reward1neuronavg(1,:),reward1neuronavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Reward')
           hold on
           subplot(2,3,3)
           errorbar(xaxisrun,rewardrun1neuronavg(1,:),rewardrun1neuronavg(2,:),'color',[0 0.4470 0.7410],'LineWidth',2)
           line([0 0],[-1 1],'color',[0 0 0], 'LineWidth',.25)
            xlim([-7 7])
            ylim([-0.75 0.75])
           title('Run')
           hold on
           
           %%%%heatmap%%%%
            
           subplot(2,3,4)
           imagesc(cue1neuronstemp)
           title('Context (Stop)')
           hold on
           subplot(2,3,5)
           imagesc(reward1neuronstemp)
           title('Reward')
           hold on
           subplot(2,3,6)
           imagesc(rewardrun1neuronstemp)
           title('Run')
           hold on
           
            set(gcf, 'Position',  [0, 500, 400, 400])
           
            fname = strcat(pwd,'/populationtunings/')
            
        filename=strcat('cue1trial',num2str(i),'.tiff');
             
        strcat('/populationtunings/',filename)

            saveas(gcf,fullfile(fname,filename))
            
            
           if i==5
                hello
           end
    
           close all
           close all
           
    
end
end

hello
