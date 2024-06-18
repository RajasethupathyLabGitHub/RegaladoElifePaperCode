
    


if plotstructure==1
    
    averr=calculateAverage(rrsignals(:,:,1),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    
    averr=calculateAverage(rrsignals(:,:,2),0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0.4470 0.7410],'LineWidth',2)
    
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
end