%make a script to plot context tunings for all, after rew, after fail

    
    if neuroncontexts==1
        %plot rewards (all) and all splits
        figure
        
        subplot(6,4,1)
    averr=calculateAverage(rew1neuroncon,0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('All')
    
        subplot(6,4,2)
    averr=calculateAverage(rew1neuroncon(rew1split==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,3)
    averr=calculateAverage(rew1neuroncon(rew1split==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,4)
    averr=calculateAverage(rew1neuroncon(rew1split==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot rewards (stop) and all splits
        subplot(6,4,5)
    averr=calculateAverage(rew1neuroncon(rew1behav==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stops)')
    
        subplot(6,4,6)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==1,rew1split==1),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,7)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==1,rew1split==2),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,8)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==1,rew1split==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot rewards (run) and all splits
        subplot(6,4,9)
    averr=calculateAverage(rew1neuroncon(rew1behav==0,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run)')
    
        subplot(6,4,10)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==0,rew1split==1),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,11)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==0,rew1split==2),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,12)
    averr=calculateAverage(rew1neuroncon(and(rew1behav==0,rew1split==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot Fails (all) and all splits
        subplot(6,4,13)
    averr=calculateAverage(fail1neuroncon,0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(6,4,14)
    averr=calculateAverage(fail1neuroncon(fail1split==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,15)
    averr=calculateAverage(fail1neuroncon(fail1split==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,16)
    averr=calculateAverage(fail1neuroncon(fail1split==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 R')
    
    
    %plot Fails (stop) and all splits
        subplot(6,4,17)
    averr=calculateAverage(fail1neuroncon(fail1behav==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop)')
    
        subplot(6,4,18)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==1,fail1split==1),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,19)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==1,fail1split==2),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,20)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==1,fail1split==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 R')
    
    %plot Fails (stop) and all splits
        subplot(6,4,21)
    averr=calculateAverage(fail1neuroncon(fail1behav==0,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run)')
    
        subplot(6,4,22)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==0,fail1split==1),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,23)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==0,fail1split==2),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,24)
    averr=calculateAverage(fail1neuroncon(and(fail1behav==0,fail1split==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('After 2 R')
    
    
    
    
set(gcf, 'Position',  [0, 500, 500, 2000])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroncontexts/')

saveas(gcf,fullfile(fname,filename))




%heatmap

        figure
        
        subplot(6,4,1)
    imagesc(rew1neuroncon);
caxis(coloraxis)
colorbar
colormap winter
    title('All')
    
        subplot(6,4,2)
    imagesc(rew1neuroncon(rew1split==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,3)
    imagesc(rew1neuroncon(rew1split==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,4)
    imagesc(rew1neuroncon(rew1split==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot rewards (stop) and all splits
        subplot(6,4,5)
    imagesc(rew1neuroncon(rew1behav==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stops)')
    
        subplot(6,4,6)
    imagesc(rew1neuroncon(and(rew1behav==1,rew1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,7)
    imagesc(rew1neuroncon(and(rew1behav==1,rew1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,8)
    imagesc(rew1neuroncon(and(rew1behav==1,rew1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot rewards (run) and all splits
        subplot(6,4,9)
    imagesc(rew1neuroncon(rew1behav==0,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run)')
    
        subplot(6,4,10)
    imagesc(rew1neuroncon(and(rew1behav==0,rew1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,11)
    imagesc(rew1neuroncon(and(rew1behav==0,rew1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,12)
    imagesc(rew1neuroncon(and(rew1behav==0,rew1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot Fails (all) and all splits
        subplot(6,4,13)
    imagesc(fail1neuroncon);
caxis(coloraxis)
colorbar
colormap winter
    title('F (All)')
    
        subplot(6,4,14)
    imagesc(fail1neuroncon(fail1split==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,15)
    imagesc(fail1neuroncon(fail1split==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,16)
    imagesc(fail1neuroncon(fail1split==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    
    %plot Fails (stop) and all splits
        subplot(6,4,17)
    imagesc(fail1neuroncon(fail1behav==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop)')
    
        subplot(6,4,18)
    imagesc(fail1neuroncon(and(fail1behav==1,fail1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,19)
    imagesc(fail1neuroncon(and(fail1behav==1,fail1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,20)
    imagesc(fail1neuroncon(and(fail1behav==1,fail1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    %plot Fails (stop) and all splits
        subplot(6,4,21)
    imagesc(fail1neuroncon(fail1behav==0,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run)')
    
        subplot(6,4,22)
    imagesc(fail1neuroncon(and(fail1behav==0,fail1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,23)
    imagesc(fail1neuroncon(and(fail1behav==0,fail1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,24)
    imagesc(fail1neuroncon(and(fail1behav==0,fail1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    
    
    
set(gcf, 'Position',  [0, 500, 1000, 2000])

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroncontexts/')

saveas(gcf,fullfile(fname,filename))

    end

    if neuronpre==1
        %plot rewards (all) and all splits
        figure
        
        subplot(6,4,1)
    averr=calculateAverage(rew1neuronpre,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
        subplot(6,4,2)
    averr=calculateAverage(rew1neuronpre(rew1split==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,3)
    averr=calculateAverage(rew1neuronpre(rew1split==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,4)
    averr=calculateAverage(rew1neuronpre(rew1split==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot rewards (stop) and all splits
        subplot(6,4,5)
    averr=calculateAverage(rew1neuronpre(rew1behav==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (Stops)')
    
        subplot(6,4,6)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==1,rew1split==1),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,7)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==1,rew1split==2),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,8)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==1,rew1split==3),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot rewards (run) and all splits
        subplot(6,4,9)
    averr=calculateAverage(rew1neuronpre(rew1behav==0,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (Run)')
    
        subplot(6,4,10)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==0,rew1split==1),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,11)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==0,rew1split==2),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,12)
    averr=calculateAverage(rew1neuronpre(and(rew1behav==0,rew1split==3),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 F')
    
    %plot Fails (all) and all splits
        subplot(6,4,13)
    averr=calculateAverage(fail1neuronpre,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(6,4,14)
    averr=calculateAverage(fail1neuronpre(fail1split==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,15)
    averr=calculateAverage(fail1neuronpre(fail1split==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,16)
    averr=calculateAverage(fail1neuronpre(fail1split==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 R')
    
    
    %plot Fails (stop) and all splits
        subplot(6,4,17)
    averr=calculateAverage(fail1neuronpre(fail1behav==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (Stop)')
    
        subplot(6,4,18)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==1,fail1split==1),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,19)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==1,fail1split==2),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,20)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==1,fail1split==3),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 R')
    
    %plot Fails (stop) and all splits
        subplot(6,4,21)
    averr=calculateAverage(fail1neuronpre(fail1behav==0,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (Run)')
    
        subplot(6,4,22)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==0,fail1split==1),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 F')
    
        subplot(6,4,23)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==0,fail1split==2),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 1 R')
    
        subplot(6,4,24)
    averr=calculateAverage(fail1neuronpre(and(fail1behav==0,fail1split==3),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('After 2 R')
    
    
    
    
set(gcf, 'Position',  [0, 500, 500, 2000])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronpre/')

saveas(gcf,fullfile(fname,filename))




%heatmap

        figure
        
        subplot(6,4,1)
    imagesc(rew1neuronpre);
caxis(coloraxis)
colorbar
colormap winter
    title('All')
    
        subplot(6,4,2)
    imagesc(rew1neuronpre(rew1split==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,3)
    imagesc(rew1neuronpre(rew1split==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,4)
    imagesc(rew1neuronpre(rew1split==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot rewards (stop) and all splits
        subplot(6,4,5)
    imagesc(rew1neuronpre(rew1behav==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stops)')
    
        subplot(6,4,6)
    imagesc(rew1neuronpre(and(rew1behav==1,rew1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,7)
    imagesc(rew1neuronpre(and(rew1behav==1,rew1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,8)
    imagesc(rew1neuronpre(and(rew1behav==1,rew1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot rewards (run) and all splits
        subplot(6,4,9)
    imagesc(rew1neuronpre(rew1behav==0,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run)')
    
        subplot(6,4,10)
    imagesc(rew1neuronpre(and(rew1behav==0,rew1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,11)
    imagesc(rew1neuronpre(and(rew1behav==0,rew1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,12)
    imagesc(rew1neuronpre(and(rew1behav==0,rew1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 F')
    
    %plot Fails (all) and all splits
        subplot(6,4,13)
    imagesc(fail1neuronpre);
caxis(coloraxis)
colorbar
colormap winter
    title('F (All)')
    
        subplot(6,4,14)
    imagesc(fail1neuronpre(fail1split==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,15)
    imagesc(fail1neuronpre(fail1split==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,16)
    imagesc(fail1neuronpre(fail1split==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    
    %plot Fails (stop) and all splits
        subplot(6,4,17)
    imagesc(fail1neuronpre(fail1behav==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop)')
    
        subplot(6,4,18)
    imagesc(fail1neuronpre(and(fail1behav==1,fail1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,19)
    imagesc(fail1neuronpre(and(fail1behav==1,fail1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,20)
    imagesc(fail1neuronpre(and(fail1behav==1,fail1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    %plot Fails (stop) and all splits
        subplot(6,4,21)
    imagesc(fail1neuronpre(fail1behav==0,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run)')
    
        subplot(6,4,22)
    imagesc(fail1neuronpre(and(fail1behav==0,fail1split==1),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 F')
    
        subplot(6,4,23)
    imagesc(fail1neuronpre(and(fail1behav==0,fail1split==2),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 1 R')
    
        subplot(6,4,24)
    imagesc(fail1neuronpre(and(fail1behav==0,fail1split==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('After 2 R')
    
    
    
    
set(gcf, 'Position',  [0, 500, 1000, 2000])

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronpre/')

saveas(gcf,fullfile(fname,filename))

end
   
%plot instructive indexing of neurons

if instructcomplex==1
figure
subplot(8,2,1)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) to R (Stop)')
    
subplot(8,2,2)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) to F (Stop)')

subplot(8,2,3)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) to R (Stop)')
    
subplot(8,2,4)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) to F (Stop)')
    
subplot(8,2,5)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) to R (Stop)')
    
subplot(8,2,6)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) to F (Stop)')

subplot(8,2,7)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==4,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) to R (Stop)')
    
subplot(8,2,8)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==4,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) to F (Stop)')

subplot(8,2,9)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==5,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) to R (Run)')
    
subplot(8,2,10)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==5,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) to F (Run)')

subplot(8,2,11)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==6,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) to R (Run)')
    
subplot(8,2,12)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==6,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) to F (Run)')
    
subplot(8,2,13)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==7,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) to R (Run)')
    
subplot(8,2,14)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==7,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) to F (Run)')

subplot(8,2,15)
    averr=calculateAverage(rew1neuroncon(rew1behavsplit==8,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) to R (Run)')
    
subplot(8,2,16)
    averr=calculateAverage(fail1neuroncon(fail1behavsplit==8,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) to F (Run)')
    
    


set(gcf, 'Position',  [0, 500, 300, 2000])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroninstruct/')

saveas(gcf,fullfile(fname,filename))


%heatmaps

figure
subplot(8,2,1)
    imagesc(rew1neuroncon(rew1behavsplit==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) to R (Stop)')
    
subplot(8,2,2)
    imagesc(fail1neuroncon(fail1behavsplit==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) to F (Stop)')

subplot(8,2,3)
    imagesc(rew1neuroncon(rew1behavsplit==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) to R (Stop)')
    
subplot(8,2,4)
    imagesc(fail1neuroncon(fail1behavsplit==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) to F (Stop)')
    
subplot(8,2,5)
    imagesc(rew1neuroncon(rew1behavsplit==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) to R (Stop)')
    
subplot(8,2,6)
    imagesc(fail1neuroncon(fail1behavsplit==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) to F (Stop)')

subplot(8,2,7)
    imagesc(rew1neuroncon(rew1behavsplit==4,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) to R (Stop)')
    
subplot(8,2,8)
    imagesc(fail1neuroncon(fail1behavsplit==4,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) to F (Stop)')

subplot(8,2,9)
    imagesc(rew1neuroncon(rew1behavsplit==5,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) to R (Run)')
    
subplot(8,2,10)
    imagesc(fail1neuroncon(fail1behavsplit==5,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) to F (Run)')

subplot(8,2,11)
    imagesc(rew1neuroncon(rew1behavsplit==6,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) to R (Run)')
    
subplot(8,2,12)
    imagesc(fail1neuroncon(fail1behavsplit==6,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) to F (Run)')
    
subplot(8,2,13)
    imagesc(rew1neuroncon(rew1behavsplit==7,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) to R (Run)')
    
subplot(8,2,14)
    imagesc(fail1neuroncon(fail1behavsplit==7,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) to F (Run)')

subplot(8,2,15)
    imagesc(rew1neuroncon(rew1behavsplit==8,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) to R (Run)')
    
subplot(8,2,16)
    imagesc(fail1neuroncon(fail1behavsplit==8,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) to F (Run)')
    
    


set(gcf, 'Position',  [0, 500, 300, 2000])

    

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroninstruct/')

saveas(gcf,fullfile(fname,filename))

end

%%%

if instructsimple==1

%
figure
subplot(4,2,1)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==1,rew1behavsplit==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Stop to Reward (Stop)')
    
subplot(4,2,2)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==1,fail1behavsplit==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Stop to Fail (Stop)')

subplot(4,2,3)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==2,rew1behavsplit==4),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Run to Reward (Stop)')
    
subplot(4,2,4)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==2,fail1behavsplit==4),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Run to Fail (Stop)')
    
subplot(4,2,5)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==5,rew1behavsplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Stop to Reward (Run)')
    
subplot(4,2,6)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==5,fail1behavsplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Stop to Fail (Run)')
    
subplot(4,2,7)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==6,rew1behavsplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Run to Reward (Run)')
    
subplot(4,2,8)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==6,fail1behavsplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Run to Fail (Run)')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroninstructsimple/')

saveas(gcf,fullfile(fname,filename))



%heatmap

figure
subplot(4,2,1)
    imagesc(rew1neuroncon(or(rew1behavsplit==1,rew1behavsplit==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Reward (Stop)')
    
subplot(4,2,2)
    imagesc(fail1neuroncon(or(fail1behavsplit==1,fail1behavsplit==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Fail (Stop)')

subplot(4,2,3)
    imagesc(rew1neuroncon(or(rew1behavsplit==2,rew1behavsplit==4),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Reward (Stop)')
    
subplot(4,2,4)
    imagesc(fail1neuroncon(or(fail1behavsplit==2,fail1behavsplit==4),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Fail (Stop)')
    
subplot(4,2,5)
    imagesc(rew1neuroncon(or(rew1behavsplit==5,rew1behavsplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Reward (Run)')
    
subplot(4,2,6)
    imagesc(fail1neuroncon(or(fail1behavsplit==5,fail1behavsplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Fail (Run)')
    
subplot(4,2,7)
    imagesc(rew1neuroncon(or(rew1behavsplit==6,rew1behavsplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Reward (Run)')
    
subplot(4,2,8)
    imagesc(fail1neuroncon(or(fail1behavsplit==6,fail1behavsplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Fail (Run)')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroninstructsimple/')

saveas(gcf,fullfile(fname,filename))

end

if cuechange==1
figure
subplot(4,2,1)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==1,rew1behavsplit==5),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Reward(Stop) to Reward')
    
subplot(4,2,2)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==1,fail1behavsplit==5),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Reward(Stop) to Fail')

subplot(4,2,3)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==2,rew1behavsplit==6),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Reward(Run) to Reward')
    
subplot(4,2,4)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==2,fail1behavsplit==6),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Reward(Run) to Fail')
    
subplot(4,2,5)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==3,rew1behavsplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Fail(Stop) to Reward')
    
subplot(4,2,6)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==3,fail1behavsplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Fail(Stop) to Fail')
    
subplot(4,2,7)
    averr=calculateAverage(rew1neuroncon(or(rew1behavsplit==4,rew1behavsplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Fail(Run) to Reward')
    
subplot(4,2,8)
    averr=calculateAverage(fail1neuroncon(or(fail1behavsplit==4,fail1behavsplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('Fail(Run) to Fail')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronchangecues/')

saveas(gcf,fullfile(fname,filename))

%heatmap



figure
subplot(4,2,1)
    imagesc(rew1neuroncon(or(rew1behavsplit==1,rew1behavsplit==5),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Reward(Stop) to Reward')
    
subplot(4,2,2)
    imagesc(fail1neuroncon(or(fail1behavsplit==1,fail1behavsplit==5),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Reward(Stop) to Fail')

subplot(4,2,3)
    imagesc(rew1neuroncon(or(rew1behavsplit==2,rew1behavsplit==6),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Reward(Run) to Reward')
    
subplot(4,2,4)
    imagesc(fail1neuroncon(or(fail1behavsplit==2,fail1behavsplit==6),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Reward(Run) to Fail')
    
subplot(4,2,5)
    imagesc(rew1neuroncon(or(rew1behavsplit==3,rew1behavsplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Fail(Stop) to Reward')
    
subplot(4,2,6)
    imagesc(fail1neuroncon(or(fail1behavsplit==3,fail1behavsplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Fail(Stop) to Fail')
    
subplot(4,2,7)
    imagesc(rew1neuroncon(or(rew1behavsplit==4,rew1behavsplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Fail(Run) to Reward')
    
subplot(4,2,8)
    imagesc(fail1neuroncon(or(fail1behavsplit==4,fail1behavsplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Fail(Run) to Fail')


set(gcf, 'Position',  [0, 500, 300, 500])



        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronchangecues/')

saveas(gcf,fullfile(fname,filename))


end


if roomcombinations==1
    
    figure
    subplot(6,2,1)
    averr=calculateAverage(rew1neuronpre(rew1combosplit==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F-F-R')
    
    subplot(6,2,2)
    imagesc(rew1neuronpre(rew1combosplit==1,:));
caxis(coloraxis)
colormap winter

    title('F-F-R')
    subplot(6,2,3)
    averr=calculateAverage(rew1neuronpre(rew1combosplit==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F-R-R')
    
    subplot(6,2,4)
    imagesc(rew1neuronpre(rew1combosplit==2,:));
caxis(coloraxis)
colormap winter
    title('F-R-R')
    
    subplot(6,2,5)
    averr=calculateAverage(rew1neuronpre(rew1combosplit==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R-F-R')
    
    subplot(6,2,6)
    imagesc(rew1neuronpre(rew1combosplit==3,:));
caxis(coloraxis)
colormap winter
    title('R-F-R')
    
    subplot(6,2,7)
    averr=calculateAverage(fail1neuronpre(fail1combosplit==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R-R-F  ')
    
    subplot(6,2,8)
    imagesc(fail1neuronpre(fail1combosplit==1,:));
caxis(coloraxis)
colormap winter
    title('R-R-F')
    
    subplot(6,2,9)
    averr=calculateAverage(fail1neuronpre(fail1combosplit==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F-R-F')
    
    subplot(6,2,10)
    imagesc(fail1neuronpre(fail1combosplit==2,:));
caxis(coloraxis)
colormap winter
    title('F-R-F')
    
    subplot(6,2,11)
    averr=calculateAverage(fail1neuronpre(fail1combosplit==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R-F-F')
    
    subplot(6,2,12)
    imagesc(fail1neuronpre(fail1combosplit==3,:));
caxis(coloraxis)
colormap winter
    title('R-F-F')
    
    set(gcf, 'Position',  [0, 500, 300, 1000])



        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuroncombo/')

saveas(gcf,fullfile(fname,filename))
    
end

%plot instructive indexing of neurons

if neuronfuture==1
figure
subplot(8,2,1)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is R (Stop)')
    
subplot(8,2,2)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==1,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is R (Stop)')

subplot(8,2,3)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is R (Run)')
    
subplot(8,2,4)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==2,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is R (Run)')
    
subplot(8,2,5)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is F (Stop)')
    
subplot(8,2,6)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==3,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is F (Stop)')

subplot(8,2,7)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==4,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is F (Run)')
    
subplot(8,2,8)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==4,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is F (Run)')

subplot(8,2,9)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==5,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is R (Stop)')
    
subplot(8,2,10)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==5,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is R (Stop)')

subplot(8,2,11)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==6,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is R (Run)')
    
subplot(8,2,12)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==6,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is R (Run)')
    
subplot(8,2,13)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==7,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is F (Stop)')
    
subplot(8,2,14)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==7,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is F (Stop)')

subplot(8,2,15)
    averr=calculateAverage(rew1neuroncon(rewfuturesplit==8,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is F (Run)')
    
subplot(8,2,16)
    averr=calculateAverage(fail1neuroncon(failfuturesplit==8,:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is F (Run)')


set(gcf, 'Position',  [0, 500, 300, 2000])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronfuture/')

saveas(gcf,fullfile(fname,filename))


%heatmaps

figure
subplot(8,2,1)
    imagesc(rew1neuroncon(rewfuturesplit==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) next is R (Stop)')
    
subplot(8,2,2)
    imagesc(fail1neuroncon(failfuturesplit==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) next is R (Stop)')

subplot(8,2,3)
    imagesc(rew1neuroncon(rewfuturesplit==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) next is R (Run)')
    
subplot(8,2,4)
    imagesc(fail1neuroncon(failfuturesplit==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) next is R (Run)')
    
subplot(8,2,5)
    imagesc(rew1neuroncon(rewfuturesplit==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Stop) next is F (Stop)')
    
subplot(8,2,6)
    imagesc(fail1neuroncon(failfuturesplit==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) next is F (Stop)')

subplot(8,2,7)
    imagesc(rew1neuroncon(rewfuturesplit==4,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) next is F (Run)')
    
subplot(8,2,8)
    imagesc(fail1neuroncon(failfuturesplit==4,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Stop) next is F (Run)')

subplot(8,2,9)
    imagesc(rew1neuroncon(rewfuturesplit==5,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) next is R (Stop)')
    
subplot(8,2,10)
    imagesc(fail1neuroncon(failfuturesplit==5,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) next is R (Stop)')

subplot(8,2,11)
    imagesc(rew1neuroncon(rewfuturesplit==6,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) next is R (Run)')
    
subplot(8,2,12)
    imagesc(fail1neuroncon(failfuturesplit==6,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) next is R (Run)')
    
subplot(8,2,13)
    imagesc(rew1neuroncon(rewfuturesplit==7,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) next is F (Stop)')
    
subplot(8,2,14)
    imagesc(fail1neuroncon(failfuturesplit==7,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) next is F (Stop)')

subplot(8,2,15)
    imagesc(rew1neuroncon(rewfuturesplit==8,:));
caxis(coloraxis)
colorbar
colormap winter
    title('R (Run) next is F (Run)')
    
subplot(8,2,16)
    imagesc(fail1neuroncon(failfuturesplit==8,:));
caxis(coloraxis)
colorbar
colormap winter
    title('F (Run) next is F (Run)')
    
    


set(gcf, 'Position',  [0, 500, 500, 2000])

    

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronfuture/')

saveas(gcf,fullfile(fname,filename))

end


if neuronfuturesimple==1

%
figure
subplot(4,2,1)
    averr=calculateAverage(rew1neuroncon(or(rewfuturesplit==1,rewfuturesplit==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is Stop')
    
subplot(4,2,2)
    averr=calculateAverage(fail1neuroncon(or(failfuturesplit==1,failfuturesplit==3),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is Stop')

subplot(4,2,3)
    averr=calculateAverage(rew1neuroncon(or(rewfuturesplit==2,rewfuturesplit==4),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Stop) next is Run')
    
subplot(4,2,4)
    averr=calculateAverage(fail1neuroncon(or(failfuturesplit==2,failfuturesplit==4),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Stop) next is Run')
    
subplot(4,2,5)
    averr=calculateAverage(rew1neuroncon(or(rewfuturesplit==5,rewfuturesplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is Stop')
    
subplot(4,2,6)
    averr=calculateAverage(fail1neuroncon(or(failfuturesplit==5,failfuturesplit==7),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is Stop')
    
subplot(4,2,7)
    averr=calculateAverage(rew1neuroncon(or(rewfuturesplit==6,rewfuturesplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('R (Run) next is Run')
    
subplot(4,2,8)
    averr=calculateAverage(fail1neuroncon(or(failfuturesplit==6,failfuturesplit==8),:),0);
    errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxcon])
    ylim([limityneuron])
    title('F (Run) next is Run')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronfuturesimple/')

saveas(gcf,fullfile(fname,filename))



%heatmap

figure
subplot(4,2,1)
    imagesc(rew1neuroncon(or(rewfuturesplit==1,rewfuturesplit==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Reward (Stop)')
    
subplot(4,2,2)
    imagesc(fail1neuroncon(or(failfuturesplit==1,failfuturesplit==3),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Fail (Stop)')

subplot(4,2,3)
    imagesc(rew1neuroncon(or(rewfuturesplit==2,rewfuturesplit==4),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Reward (Stop)')
    
subplot(4,2,4)
    imagesc(fail1neuroncon(or(failfuturesplit==2,failfuturesplit==4),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Fail (Stop)')
    
subplot(4,2,5)
    imagesc(rew1neuroncon(or(rewfuturesplit==5,rewfuturesplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Reward (Run)')
    
subplot(4,2,6)
    imagesc(fail1neuroncon(or(failfuturesplit==5,failfuturesplit==7),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop to Fail (Run)')
    
subplot(4,2,7)
    imagesc(rew1neuroncon(or(rewfuturesplit==6,rewfuturesplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Reward (Run)')
    
subplot(4,2,8)
    imagesc(fail1neuroncon(or(failfuturesplit==6,failfuturesplit==8),:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run to Fail (Run)')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronfuturesimple/')

saveas(gcf,fullfile(fname,filename))

end



if actioninstruct==1
    
    
%
figure
subplot(4,2,1)
    averr=calculateAverage(allneuronpre(neuronactionsplit==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Stop, prev Reward (Stop)')
    
subplot(4,2,2)
    averr=calculateAverage(allneuronpre(neuronactionsplit==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Stop, prev Reward (Run)')

subplot(4,2,3)
    averr=calculateAverage(allneuronpre(neuronactionsplit==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Stop, prev Fail (Stop)')
    
subplot(4,2,4)
    averr=calculateAverage(allneuronpre(neuronactionsplit==4,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Stop, prev Fail (Run)')
    
subplot(4,2,5)
    averr=calculateAverage(allneuronpre(neuronactionsplit==5,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Run, prev Reward (Stop)')
    
subplot(4,2,6)
    averr=calculateAverage(allneuronpre(neuronactionsplit==6,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Run, prev Reward (Run)')
    
subplot(4,2,7)
    averr=calculateAverage(allneuronpre(neuronactionsplit==7,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Run, Prev Fail (Stop)')
    
subplot(4,2,8)
    averr=calculateAverage(allneuronpre(neuronactionsplit==8,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Run, prev Fail (Run)')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuron',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronactioninstruct/')

saveas(gcf,fullfile(fname,filename))



%heatmap

figure
subplot(4,2,1)
    imagesc(allneuronpre(neuronactionsplit==1,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop, prev Reward (Stop)')
    
subplot(4,2,2)
    imagesc(allneuronpre(neuronactionsplit==2,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop, prev Reward (Run)')

subplot(4,2,3)
    imagesc(allneuronpre(neuronactionsplit==3,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop, prev Fail (Stop)')
    
subplot(4,2,4)
    imagesc(allneuronpre(neuronactionsplit==4,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Stop, prev Fail (Run)')
    
subplot(4,2,5)
    imagesc(allneuronpre(neuronactionsplit==5,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run, prev Reward (Stop)')
    
subplot(4,2,6)
    imagesc(allneuronpre(neuronactionsplit==6,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run, prev Reward (Run)')
    
subplot(4,2,7)
    imagesc(allneuronpre(neuronactionsplit==7,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run, prev Fail (Stop)')
    
subplot(4,2,8)
    imagesc(allneuronpre(neuronactionsplit==8,:));
caxis(coloraxis)
colorbar
colormap winter
    title('Run, prev Fail (Run)')


set(gcf, 'Position',  [0, 500, 300, 500])

    

        filename=strcat('neuronheat',num2str(neuron),'.jpeg');

             
        fname = strcat(pwd,'/neuronactioninstruct/')

saveas(gcf,fullfile(fname,filename))
    

end


if plotstructure==1
    
    subplot(9,4,1)
    averr=calculateAverage(rrsignals(:,:,1),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (All)')
    
    subplot(9,4,2)
    averr=calculateAverage(rrsignals(:,:,2),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (All)')
    
    subplot(9,4,5)
    imagesc(rrsignals(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,6)
    imagesc(rrsignals(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    
    subplot(9,4,9)
    imagesc(rrspeed(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,10)
    imagesc(rrspeed(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    %%%%
    
    
    subplot(9,4,13)
    averr=calculateAverage(rfrsignals(:,:,1),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (All)')
    
    subplot(9,4,14)
    averr=calculateAverage(rfrsignals(:,:,2),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(9,4,15)
    averr=calculateAverage(rfrsignals(:,:,3),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (All)')
    
    %%%
    
    subplot(9,4,17)
    imagesc(rfrsignals(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,18)
    imagesc(rfrsignals(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
        subplot(9,4,19)
    imagesc(rfrsignals(:,:,3));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    %%%
    
    subplot(9,4,21)
    imagesc(rfrspeed(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,22)
    imagesc(rfrspeed(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
        subplot(9,4,23)
    imagesc(rfrspeed(:,:,3));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    %%%
    
    
    subplot(9,4,25)
    averr=calculateAverage(rffrsignals(:,:,1),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (All)')
    
    subplot(9,4,26)
    averr=calculateAverage(rffrsignals(:,:,2),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(9,4,27)
    averr=calculateAverage(rffrsignals(:,:,3),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(9,4,28)
    averr=calculateAverage(rffrsignals(:,:,4),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('R (All)')
    
    %%%
    
    subplot(9,4,29)
    imagesc(rffrsignals(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,30)
    imagesc(rffrsignals(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    
    
    subplot(9,4,31)
    imagesc(rffrsignals(:,:,3));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
        subplot(9,4,32)
    imagesc(rffrsignals(:,:,4));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    %%%
    
    subplot(9,4,33)
    imagesc(rffrspeed(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(9,4,34)
    imagesc(rffrspeed(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    
    
    subplot(9,4,35)
    imagesc(rffrspeed(:,:,3));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    
        subplot(9,4,36)
    imagesc(rffrspeed(:,:,4));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    

set(gcf, 'Position',  [0, 500, 600, 1000])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

        
        fname = strcat(pwd,'/neuronrffr/')

    saveas(gcf,fullfile(fname,filename))
    
    
    %%%
    
    
    
end

%%%%%%%%


if plotstructurerffr==1
    
    
    
    subplot(2,4,1)
    averr=calculateAverage(rffrsignals(:,:,1),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([-6  6])
    ylim([limityneuron])
    title('R (All)')
    
    subplot(2,4,2)
    averr=calculateAverage(rffrsignals(:,:,2),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([-6  6])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(2,4,3)
    averr=calculateAverage(rffrsignals(:,:,3),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([-6  6])
    ylim([limityneuron])
    title('F (All)')
    
        subplot(2,4,4)
    averr=calculateAverage(rffrsignals(:,:,4),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([-6  6])
    ylim([limityneuron])
    title('R (All)')
    
    %%%
    
    subplot(2,4,5)
    imagesc(rffrsignals(:,:,1));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    subplot(2,4,6)
    imagesc(rffrsignals(:,:,2));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
    
    
    subplot(2,4,7)
    imagesc(rffrsignals(:,:,3));
caxis(coloraxis)
colormap winter
    title('F (All)')
    
        subplot(2,4,8)
    imagesc(rffrsignals(:,:,4));
caxis(coloraxis)
colormap winter
    title('R (All)')
    
    %%%
    
    
    

% set(gcf, 'Position',  [0, 500, 600, 1000])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

        
        fname = strcat(pwd,'/neuronrffronly/')

    saveas(gcf,fullfile(fname,filename))
    
    
    %%%
    
    
    
end


if afterewfail==1
    
    subplot(3,7,1)
    averr=calculateAverage(allneuronpre(or(neuronaftersplit==1,neuronaftersplit==2),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (All) after R')
    
    subplot(3,7,2)
    averr=calculateAverage(allneuronpre(neuronaftersplit==1,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (R) after R')
    
        subplot(3,7,3)
    averr=calculateAverage(allneuronpre(neuronaftersplit==2,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (F) after R')
    
    
    
        subplot(3,7,4)
    averr=calculateAverage(allneuronpre(neuronaftersplit==3,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (F) after R')
    
    
    subplot(3,7,5)
    averr=calculateAverage(allneuronpre(or(neuronaftersplit==4,neuronaftersplit==5),:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (All) after N')
    
    subplot(3,7,6)
    averr=calculateAverage(allneuronpre(neuronaftersplit==4,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (R) after N')
    
        subplot(3,7,7)
    averr=calculateAverage(allneuronpre(neuronaftersplit==5,:),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('Next (F) after N')
    
    %%%
    
        subplot(3,7,8)
    imagesc(allneuronpre(or(neuronaftersplit==1,neuronaftersplit==2),:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,7,9)
    imagesc(allneuronpre(neuronaftersplit==1,:));
caxis(coloraxis)
colormap winter
    
    subplot(3,7,10)
    imagesc(allneuronpre(neuronaftersplit==2,:));
caxis(coloraxis)
colormap winter

    subplot(3,7,11)
    imagesc(allneuronpre(neuronaftersplit==3,:));
caxis(coloraxis)
colormap winter
    
    
        subplot(3,7,12)
    imagesc(allneuronpre(or(neuronaftersplit==4,neuronaftersplit==5),:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,7,13)
    imagesc(allneuronpre(neuronaftersplit==4,:));
caxis(coloraxis)
colormap winter
    
    subplot(3,7,14)
    imagesc(allneuronpre(neuronaftersplit==5,:));
caxis(coloraxis)
colormap winter


    
        subplot(3,7,15)
    imagesc(allspeedpre(or(neuronaftersplit==1,neuronaftersplit==2),:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,7,16)
    imagesc(allspeedpre(neuronaftersplit==1,:));
caxis(coloraxis)
colormap winter

    
    subplot(3,7,17)
    imagesc(allspeedpre(neuronaftersplit==2,:));
caxis(coloraxis)
colormap winter
    
    subplot(3,7,18)
    imagesc(allspeedpre(neuronaftersplit==3,:));
caxis(coloraxis)
colormap winter
    
    
        subplot(3,7,19)
    imagesc(allspeedpre(or(neuronaftersplit==4,neuronaftersplit==5),:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,7,20)
    imagesc(allspeedpre(neuronaftersplit==4,:));
caxis(coloraxis)
colormap winter
    
    subplot(3,7,21)
    imagesc(allspeedpre(neuronaftersplit==5,:));
caxis(coloraxis)
colormap winter
    
    
    
    

set(gcf, 'Position',  [0, 500, 1000, 600])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

        
        fname = strcat(pwd,'/neuronafter/')

    saveas(gcf,fullfile(fname,filename))
    
%     hello
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if plotengagements==1
    
    subplot(3,5,1)
    averr=calculateAverage(allneuronengagecon(engagesplit==1,:),0);
    errorbar(xaxisengage,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxengage])
    ylim([limityneuron])
    title('Engage After R')
    
    subplot(3,5,2)
    averr=calculateAverage(allneuronengage(engagesplit==1,:),0);
    errorbar(xaxisengage,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    xlim([limitxengage])
    ylim([limityneuron])
    title('Engage After NR')
    
        subplot(3,5,3)
    averr=calculateAverage(allneuronengagecon(engagesplit==2,:),0);
    errorbar(xaxisengage,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxengage])
    ylim([limityneuron])
    title('Engage After R')
    
    subplot(3,5,4)
    averr=calculateAverage(allneuronengage(engagesplit==2,:),0);
    errorbar(xaxisengage,averr(:,1),averr(:,2),'color',[0.9290 0.6940 0.1250],'LineWidth',2)
    xlim([limitxengage])
    ylim([limityneuron])
    title('Engage After NR')
    
    
    subplot(3,5,5)
    averr=calculateAverage(allneuronengage(or(engagesplit==1,engagesplit==2),:),0);
    errorbar(xaxisengage,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxengage])
    ylim([limityneuron])
    title('Engage After Any')
    
    
    %%%
    
        subplot(3,5,6)
    imagesc(allneuronengagecon(engagesplit==1,:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,5,7)
    imagesc(allneuronengage(engagesplit==1,:));
caxis(coloraxis)
colormap winter

        subplot(3,5,8)
    imagesc(allneuronengagecon(engagesplit==2,:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,5,9)
    imagesc(allneuronengage(engagesplit==2,:));
caxis(coloraxis)
colormap winter
    
    subplot(3,5,10)
    imagesc(allneuronengage(or(engagesplit==1,engagesplit==2),:));
caxis(coloraxis)
colormap winter

    %%%

    
        subplot(3,5,11)
    imagesc(allspeedengagecon(engagesplit==1,:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,5,12)
    imagesc(allspeedengage(engagesplit==1,:));
caxis(coloraxis)
colormap winter

        subplot(3,5,13)
    imagesc(allspeedengagecon(engagesplit==2,:));
caxis(coloraxis)
colormap winter
    
    
    
    subplot(3,5,14)
    imagesc(allspeedengage(engagesplit==2,:));
caxis(coloraxis)
colormap winter


    subplot(3,5,15)
    imagesc(allspeedengage(or(engagesplit==1,engagesplit==2),:));
caxis(coloraxis)
colormap winter
    
    

set(gcf, 'Position',  [0, 500, 1000, 800])

        filename=strcat('neuron',num2str(neuron),'.jpeg');

        
        fname = strcat(pwd,'/neuronengage/')

    saveas(gcf,fullfile(fname,filename))
    
    
    
end

close all

