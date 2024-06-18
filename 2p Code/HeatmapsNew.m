clear all
close all

load neuronstructure.mat

%1 is for all context, 2 is  only stop, 3 is only run
c1allstoprun=1;
c2allstoprun=1;

c1allafter1after2=1;
c2allafter1after2=1;
stopafterrew=1;
stopafterfail=1;
afterstoprew=1;
afterstopfail=1;

structureneuron1=0;
structureneuron2=0;
structureneuron3=0;
structureneuron4=0;
structureneuron5=0;
structureneuron6=0;

sequenceRFFRneuron1=0;
sequenceRFFRneuron2=0;
sequenceRFFRneuron3=0;
sequenceRFFRneuron4=0;

RFRfutureneuron=0;
RFFRfutureneuron=0;
RFFRfutureneuronboth=0;

contextneuron=0;

contextneuron1=0;
contextneuron11=0;
contextneuron21=0;

contextneuron2=0;
contextneuron12=0;
contextneuron22=0;

engageneuron1=0;
engageneuron2=0;

neuronRstop=0;
neuronNstop=0;

postneuron1=0;
postneuron2=0;
postneuron3=0;

thresholdrange=startpre-10:startpre+10;
engagethresholdrange=startengage-20:startengage+4;
conthresholdrange=startcon-4:startcon+15;
motithreshold=0.75;
coloraxis=[0 1];
    limityneuron=[-0.3 0.7];



timerangecon=timerangecon;
    limitxcon=[round(timerangecon(1)) round(timerangecon(end))];
timerangepre=timerangepre;
    limitxpre=[round(timerangepre(1)) round(timerangepre(end))];

    xaxiscon=linspace(round(timerangecon(1)), round(timerangecon(end)), numel(neuronstructure(1).contextneuron.zscore(1,:)));
    xaxispre=linspace(round(timerangepre(1)), round(timerangepre(end)), numel(neuronstructure(1).preneuron.zscore(1,:)));
    

% neuronstructure, context, all/stop/run
% function plotneurons(neuronstructure,conout,allstoprun)
name=1;
newspeed1=0;
newspeed2=0;
newspeed1all=0;
newspeed2all=0;
neuron=0;
neuron=0;
newspeedafter1=0;
newspeedafter2=0;
for neuron=1:numel(neuronstructure(:))
    
    %get speed
    mousenames=unique({neuronstructure.mouse});
    if name<=numel(mousenames) && isequal({neuronstructure(neuron).mouse},mousenames(name))
        name=name+1;
        
        
        
                context1=neuronstructure(neuron).context(:,1)==1;
                context1stop=and(neuronstructure(neuron).context(:,1)==1, neuronstructure(neuron).context(:,2)==1);
                context1run=and(neuronstructure(neuron).context(:,1)==1, neuronstructure(neuron).context(:,2)==0);
                
                context2=neuronstructure(neuron).context(:,1)==2;
                context2stop=and(neuronstructure(neuron).context(:,1)==2, neuronstructure(neuron).context(:,2)==1);
                context2run=and(neuronstructure(neuron).context(:,1)==2, neuronstructure(neuron).context(:,2)==0);
                
                
                
                
                
                context1all=neuronstructure(neuron).context(:,1)==1;
                context2all=neuronstructure(neuron).context(:,1)==2;
                
                context11=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context11(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==1);
                
                context1stop1stop=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context1stop1stop(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==1);
                context1stop1stop(2:end)=and(context1stop1stop(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                context1stop1stop(2:end)=and(context1stop1stop(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
%                 context11(2:end)=and(context11(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
%                 context11(2:end)=and(context11(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
%                 context11(2:end)=and(context11(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
                context12=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context12(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==2);
                
                context1stop2stop=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context1stop2stop(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==2);
                context1stop2stop(2:end)=and(context1stop2stop(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                context1stop2stop(2:end)=and(context1stop2stop(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
                
                context1stop2run=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context1stop2run(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==2);
                context1stop2run(2:end)=and(context1stop2run(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                context1stop2run(2:end)=and(context1stop2run(2:end)==1,neuronstructure(neuron).context(2:end,2)==0);
%                 context12(2:end)=and(context12(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
%                 context12(2:end)=and(context12(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
%                 hello
                
%                 context21=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
%                 context21(2:end)=or(neuronstructure(neuron).context(1:end-1,1)==2,neuronstructure(neuron).context(1:end-1,2)==0);
%                 context21(2:end)=and(context21(2:end)==1,neuronstructure(neuron).context(2:end,1)==1);
%                 context21(2:end)=and(context21(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
                context21=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context21(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==2,neuronstructure(neuron).context(2:end,1)==1);
%                 context21(2:end)=and(context21(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);


%                 context22=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
%                 context22(2:end)=or(neuronstructure(neuron).context(1:end-1,1)==2,neuronstructure(neuron).context(1:end-1,2)==0);
%                 context22(2:end)=and(context22(2:end)==1,neuronstructure(neuron).context(2:end,1)==2);
%                 context22(2:end)=and(context22(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
                context22=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                context22(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==2,neuronstructure(neuron).context(2:end,1)==2);
%                 context22(2:end)=and(context22(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                
                
                
                contextafter1=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextafter1(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                
                contextafter2=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextafter2(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==2,neuronstructure(neuron).context(1:end-1,2)==1);
                
                engage1=neuronstructure(neuron).engagecontext(:,1)==1;
                engage1=and(engage1==1,neuronstructure(neuron).engagecontext(:,2)==1);
                engage2=neuronstructure(neuron).engagecontext(:,1)==2; 
                engage2=and(engage2==1,neuronstructure(neuron).engagecontext(:,2)==1);
                
                if stopafterrew==1
%                     context1all(2:end)=and(context1all(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
%                     context21(2:end)=and(context21(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                end
                
                if stopafterfail==1
%                     context2all(2:end)=and(context2all(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
%                     context22(2:end)=and(context22(2:end)==1,neuronstructure(neuron).context(1:end-1,2)==1);
                end
                
                if afterstoprew==1
                    context1all(2:end)=and(context1all(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                end
                
                if afterstopfail==1
                    context2all(2:end)=and(context2all(2:end)==1,neuronstructure(neuron).context(2:end,2)==1);
                end
                
                
                if afterstopfail==-1
                    context2all(2:end)=and(context2all(2:end)==1,neuronstructure(neuron).context(2:end,2)==0);
                    context12(2:end)=and(context12(2:end)==1,neuronstructure(neuron).context(2:end,2)==0);
                    context22(2:end)=and(context22(2:end)==1,neuronstructure(neuron).context(2:end,2)==0);
                end
                
                if sum(context1run)==0
                    context1run=context1;
                end
                if sum(context2run)==0
                    context2run=context2;
                end
                
                
                %%%just track 1 R, 2 R, 1 NR, or 2 NR
                
                contextFRF=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextFRF(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(2:end-1,1)==1);
                contextFRF(3:end)=and(contextFRF(3:end),neuronstructure(neuron).context(3:end,1)==2);
%                 contextFRF(3:end)=and(contextFRF(3:end),neuronstructure(neuron).context(3:end,2)==1);
                
                contextRRF=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRRF(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==1,neuronstructure(neuron).context(2:end-1,1)==1);
                contextRRF(3:end)=and(contextRRF(3:end),neuronstructure(neuron).context(3:end,1)==2);
                
                contextRFF=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRFF(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==1,neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFF(3:end)=and(contextRFF(3:end),neuronstructure(neuron).context(3:end,1)==2);
%               contextRFF(3:end)=and(contextRFF(3:end),neuronstructure(neuron).context(3:end,2)==1);
                
                
                
                contextFFR=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextFFR(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(2:end-1,1)==2);
                contextFFR(3:end)=and(contextFFR(3:end),neuronstructure(neuron).context(3:end,1)==1);
%                 context2F(4:end)=and(context2F(4:end),neuronstructure(neuron).context(1:end-3,2)==1);
%                 context2F(4:end)=and(context2F(4:end),neuronstructure(neuron).context(4:end,2)==1);
                
                contextFRR=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextFRR(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(2:end-1,1)==1);
                contextFRR(3:end)=and(contextFRR(3:end),neuronstructure(neuron).context(3:end,1)==1);
%                 contextFRR(3:end)=and(contextFRR(3:end),neuronstructure(neuron).context(2:end-1,2)==1);
%                 contextFRR(3:end)=and(contextFRR(3:end),neuronstructure(neuron).context(3:end,2)==1);
                
                contextRFR=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRFR(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==1,neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFR(3:end)=and(contextRFR(3:end),neuronstructure(neuron).context(3:end,1)==1);
%                 contextRFR(3:end)=and(contextRFR(3:end),neuronstructure(neuron).context(1:end-2,2)==1);
%                 contextRFR(3:end)=and(contextRFR(3:end),neuronstructure(neuron).context(3:end,2)==1);
                
        
                contextRFFR1=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
%                 contextRFFR1(1:end-3)=and(neuronstructure(neuron).context(1:end-3,1)==1,neuronstructure(neuron).context(1:end-3,2)==1);
                contextRFFR1(1:end-2)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(1:end-2,1)==2);
                contextRFFR1(1:end-2)=and(contextRFFR1(1:end-2),neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFFR1(1:end-2)=and(contextRFFR1(1:end-2),neuronstructure(neuron).context(3:end,1)==1);

                contextRFFR2=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
%                 contextRFFR2(2:end-2)=and(neuronstructure(neuron).context(1:end-3,1)==1,neuronstructure(neuron).context(1:end-3,2)==1);
                contextRFFR2(2:end-1)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(1:end-2,1)==2);
                contextRFFR2(2:end-1)=and(contextRFFR2(2:end-1),neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFFR2(2:end-1)=and(contextRFFR2(2:end-1),neuronstructure(neuron).context(3:end,1)==1);
                
                
                contextRFFR3=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
%                 contextRFFR3(3:end-1)=and(neuronstructure(neuron).context(1:end-3,1)==1,neuronstructure(neuron).context(1:end-3,2)==1);
                contextRFFR3(3:end)=and(neuronstructure(neuron).context(1:end-2,1)==2,neuronstructure(neuron).context(1:end-2,1)==2);
                contextRFFR3(3:end)=and(contextRFFR3(3:end),neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFFR3(3:end)=and(contextRFFR3(3:end),neuronstructure(neuron).context(3:end,1)==1);
%      
%                 contextRFFR4=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
% %                 contextRFFR4(4:end)=and(neuronstructure(neuron).context(1:end-3,1)==1,neuronstructure(neuron).context(1:end-3,2)==1);
%                 contextRFFR4(4:end)=and(neuronstructure(neuron).context(1:end-3,1)==1,neuronstructure(neuron).context(1:end-3,1)==1);
%                 contextRFFR4(4:end)=and(contextRFFR4(4:end),neuronstructure(neuron).context(2:end-2,1)==2);
%                 contextRFFR4(4:end)=and(contextRFFR4(4:end),neuronstructure(neuron).context(3:end-1,1)==2);
%                 contextRFFR4(4:end)=and(contextRFFR4(4:end),neuronstructure(neuron).context(4:end,1)==1);
                
                %%%do outcome firing
                
%                 outcomeR=neuronstructure(neuron).outcome(:,1)==1;
%                 outcomeF=neuronstructure(neuron).outcome(:,1)==2;

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%LETS FIND FUTURE REWARD NEURONS%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                contextRRfuture=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRRfuture(2:end)=and(neuronstructure(neuron).context(1:end-1,1)==1,neuronstructure(neuron).context(2:end,1)==1);
                
                contextRFRfuture=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRFRfuture(2:end-1)=and(neuronstructure(neuron).context(1:end-2,1)==1,neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFRfuture(2:end-1)=and(contextRFRfuture(2:end-1),neuronstructure(neuron).context(3:end,1)==1);
                
                contextRFFRfuture=zeros(1,numel(neuronstructure(neuron).context(:,1)))';
                contextRFFRfuture(2:end-1)=and(neuronstructure(neuron).context(1:end-2,1)==1,neuronstructure(neuron).context(2:end-1,1)==2);
                contextRFFRfuture(2:end-1)=and(contextRFFRfuture(2:end-1),neuronstructure(neuron).context(3:end,1)==2);
                

                for trial=1:numel(context1all)
                    if context1(trial)==1 && sum(context1all)>0
                    newspeed1=newspeed1+1;
                    speedcues1(newspeed1,:)=neuronstructure(neuron).contextspeed(trial,:);
                    end
                    if context2(trial)==1 && sum(context2all)>0
                    newspeed2=newspeed2+1;
                    speedcues2(newspeed2,:)=neuronstructure(neuron).contextspeed(trial,:);
                    end
                    if context1all(trial)==1 && sum(context1all)>0
                    newspeed1all=newspeed1all+1;
                    speedcues1all(newspeed1all,:)=neuronstructure(neuron).contextspeed(trial,:);
                    end
                    if context2all(trial)==1 && sum(context2all)>0
                    newspeed2all=newspeed2all+1;
                    speedcues2all(newspeed2all,:)=neuronstructure(neuron).contextspeed(trial,:);
                    end
                    if contextafter1(trial)==1 && sum(context1all)>0
                    newspeedafter1=newspeedafter1+1;
                    speedcues1after(newspeedafter1,:)=neuronstructure(neuron).prespeed(trial,:);
                    end
                    if contextafter2(trial)==1 && sum(context2all)>0
                    newspeedafter2=newspeedafter2+1;
                    speedcues2after(newspeedafter2,:)=neuronstructure(neuron).prespeed(trial,:);
                    end
                end
                    
    end
    
    
    
    
        
        
    %get neuron average signal and find its max value
        neuroncues1(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context1==1,:),1));
        neuroncues1all(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1all==1,:),1));
        neuroncues1stop(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context1stop==1,:),1));
        neuroncues1run(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context1run==1,:),1));
        neuroncues11(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context11==1,:),1));
        neuroncues21(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context21==1,:),1));
        
        
        neuroncuesFRR(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        neuroncuesFRF(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        neuroncuesRRF(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        neuronorder(neuron,1)=find(neuroncues1(neuron,:)==max(neuroncues1(neuron,:)));
        neuronstoporder(neuron,1)=find(neuroncues1stop(neuron,:)==max(neuroncues1stop(neuron,:)));
%         neuronrunorder(neuron,1)=find(neuroncues1run(neuron,:)==max(neuroncues1run(neuron,:)));
        neuronallorder(neuron,1)=find(neuroncues1all(neuron,:)==max(neuroncues1all(neuron,:)));
        neuron1order(neuron,1)=find(neuroncues11(neuron,:)==max(neuroncues11(neuron,:)));
        neuron21order(neuron,1)=find(neuroncues21(neuron,:)==max(neuroncues21(neuron,:)));
        neuronFRRorder(neuron,1)=find(neuroncuesFRR(neuron,:)==max(neuroncuesFRR(neuron,:)));
        neuronFRForder(neuron,1)=find(neuroncuesFRF(neuron,:)==max(neuroncuesFRF(neuron,:)));
        neuronRRForder(neuron,1)=find(neuroncuesRRF(neuron,:)==max(neuroncuesRRF(neuron,:)));
%         neuronstoporder(neuron,1)=find(neuroncues1stop(neuroncues1stop,:)==max(neuroncues1stop(neuroncues1stop,:)));
        
        neuroncues2(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context2==1,:),1));
        neuroncues2all(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context2all==1,:),1));
        neuroncues2stop(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context2stop==1,:),1));
        neuroncues2run(neuron,:)=(mean(neuronstructure(neuron).contextneuron.zscore(context2run==1,:),1));
        neuroncues22(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context22==1,:),1));
        neuroncues12(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context12==1,:),1));
        
        
        neuroncuesRFR(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        neuroncuesRFF(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        neuroncuesFFR(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        
        neuron2order(neuron,1)=find(neuroncues2(neuron,:)==max(neuroncues2(neuron,:)));
        neuron2stoporder(neuron,1)=find(neuroncues2stop(neuron,:)==max(neuroncues2stop(neuron,:)));
        neuron2runorder(neuron,1)=find(neuroncues2run(neuron,:)==max(neuroncues2run(neuron,:)));
        neuron2allorder(neuron,1)=find(neuroncues2all(neuron,:)==max(neuroncues2all(neuron,:)));
        neuron22order(neuron,1)=find(neuroncues22(neuron,:)==max(neuroncues22(neuron,:)));
        neuron2order(neuron,1)=find(neuroncues12(neuron,:)==max(neuroncues12(neuron,:)));
        neuroRFRorder(neuron,1)=find(neuroncuesRFR(neuron,:)==max(neuroncuesRFR(neuron,:)));
        neuroRFForder(neuron,1)=find(neuroncuesRFF(neuron,:)==max(neuroncuesRFF(neuron,:)));
        neuronFFRorder(neuron,1)=find(neuroncuesFFR(neuron,:)==max(neuroncuesFFR(neuron,:)));
%         neuron2stoporder(neuron,1)=find(neuroncues2stop(neuroncues2stop,:)==max(neuroncues2stop(neuroncues2stop,:)));
    
        neuronafterR(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextafter1==1,:),1));
        neuronafterF(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextafter2==1,:),1));
        neuronafterRorder(neuron,1)=find(neuronafterR(neuron,:)==max(neuronafterR(neuron,:)));
        neuronafterForder(neuron,1)=find(neuronafterF(neuron,:)==max(neuronafterF(neuron,:)));
        
        neuronRFFR1(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        neuronRFFR2(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        neuronRFFR3(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
%         neuronRFFR4(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR4==1,:),1));
        
        neuronRFFR1order(neuron,1)=find(neuronRFFR1(neuron,:)==max(neuronRFFR1(neuron,:)));
        neuronRFFR2order(neuron,1)=find(neuronRFFR2(neuron,:)==max(neuronRFFR2(neuron,:)));
        neuronRFFR3order(neuron,1)=find(neuronRFFR3(neuron,:)==max(neuronRFFR3(neuron,:)));
%         neuronRFFR4order(neuron,1)=find(neuronRFFR4(neuron,:)==max(neuronRFFR4(neuron,:)));
        
        
        
        %%%look at any neuron v active in FFFR
        
        
        
        %FOR ENGAGEMENTS
        
        neuronengage1(neuron,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage1==1,:),1));
        neuronengage2(neuron,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage2==1,:),1));
        
        %look at contexts
        
        neuroncues1stop1stop(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop1stop==1,:),1));
        neuroncues1stop2stop(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2stop==1,:),1));
        neuroncues1stop2run(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2run==1,:),1));
        
        
        %look at future Reward
        
        neuroncuesRFRfuture(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFRfuture==1,:),1));
        neuroncuesRFFRfuture(neuron,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFRfuture==1,:),1));
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find future reward selective cells %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if any(neuroncuesRFRfuture(neuron,thresholdrange)>=motithreshold)
        RFRfutureneuron=RFRfutureneuron+1;
        end
        
        if any(neuroncuesRFFRfuture(neuron,thresholdrange)>=motithreshold)
        RFFRfutureneuron=RFFRfutureneuron+1;
        end 
        
        
        if any(neuroncuesRFRfuture(neuron,thresholdrange)>=motithreshold) && any(neuroncuesRFFRfuture(neuron,thresholdrange)>=motithreshold)
        RFFRfutureneuronboth=RFFRfutureneuronboth+1;
        end 
        
       
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find engage selective cells %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if any(neuronengage1(neuron,engagethresholdrange)>=motithreshold)
            engageneuron1=engageneuron1+1;
        engageR1(engageneuron1,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage1==1,:),1));
        engageR2(engageneuron1,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage2==1,:),1));

        engageR1con(engageneuron1,:)=(mean(neuronstructure(neuron).engageneuroncon.zscore(engage1==1,:),1));
        engageR2con(engageneuron1,:)=(mean(neuronstructure(neuron).engageneuroncon.zscore(engage2==1,:),1));
        
        
        neuronRFFR1engageR(engageneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        neuronRFFR2engageR(engageneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        neuronRFFR3engageR(engageneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
%         neuronRFFR4engageR(engageneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR4==1,:),1));
        
        neuronengage1order(engageneuron1,1)=find(engageR1(engageneuron1,:)==max(engageR1(engageneuron1,:)));
        
        end
         if any(neuronengage2(neuron,engagethresholdrange)>=motithreshold)
            engageneuron2=engageneuron2+1;
        engageN1(engageneuron2,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage1==1,:),1));
        engageN2(engageneuron2,:)=(mean(neuronstructure(neuron).engageneuron.zscore(engage2==1,:),1));
        
        engageN1con(engageneuron2,:)=(mean(neuronstructure(neuron).engageneuroncon.zscore(engage1==1,:),1));
        engageN2con(engageneuron2,:)=(mean(neuronstructure(neuron).engageneuroncon.zscore(engage2==1,:),1));
        
        neuronRFFR1engageN(engageneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        neuronRFFR2engageN(engageneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        neuronRFFR3engageN(engageneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
%         neuronRFFR4engageN(engageneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR4==1,:),1));
        
        neuronengage2order(engageneuron2,1)=find(engageN2(engageneuron2,:)==max(engageN2(engageneuron2,:)));
         end
         
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find R or N stop  selective cells  %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if any(neuroncues1stop(neuron,conthresholdrange)>=motithreshold)
            neuronRstop=neuronRstop+1;
        end
        
        
        if any(neuroncues2stop(neuron,conthresholdrange)>=motithreshold)
            neuronNstop=neuronNstop+1;
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find R or N after reward  selective cells  %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if any(neuroncues1stop1stop(neuron,engagethresholdrange)>=motithreshold)
            postneuron1=postneuron1+1;
        postR1(postneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop1stop==1,:),1));
        postR2(postneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2stop==1,:),1));
        
        neuronpost1order(postneuron1,1)=find(postR1(postneuron1,:)==max(postR1(postneuron1,:)));
        
        end
         if any(neuroncues1stop2stop(neuron,engagethresholdrange)>=motithreshold)
            postneuron2=postneuron2+1;
        postNstop1(postneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop1stop==1,:),1));
        postNstop2(postneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2stop==1,:),1));
        
        
        neuronpost2order(postneuron2,1)=find(postNstop2(postneuron2,:)==max(postNstop2(postneuron2,:)));
         end
         
         
         if any(neuroncues1stop2run(neuron,engagethresholdrange)>=motithreshold)
            postneuron3=postneuron3+1;
        postNrun1(postneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2stop==1,:),1));
        postNrun2(postneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(context1stop2run==1,:),1));
        
        
        neuronpost3order(postneuron3,1)=find(postNrun2(postneuron3,:)==max(postNrun2(postneuron3,:)));
         end
         
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find context selective cells  REWARD COMBOS %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        if any(neuroncues1(neuron,thresholdrange)>=motithreshold)
            contextneuron1=contextneuron1+1;
        end
         if any(neuroncues11(neuron,thresholdrange)>=motithreshold)
            contextneuron11=contextneuron11+1;
         end
          if any(neuroncues21(neuron,thresholdrange)>=motithreshold)
            contextneuron21=contextneuron21+1;
        end
        
        if any(neuroncuesFRR(neuron,thresholdrange)>=motithreshold)
            
        structureneuron1=structureneuron1+1;
        structureFRR1(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureFRR2(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureFRR3(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureFRR4(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureFRR5(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureFRR6(structureneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        structureFRRav(structureneuron1,1)=mean(structureFRR1(structureneuron1,thresholdrange));
        structureFRRav(structureneuron1,2)=mean(structureFRR2(structureneuron1,thresholdrange));
        structureFRRav(structureneuron1,3)=mean(structureFRR3(structureneuron1,thresholdrange));
        structureFRRav(structureneuron1,4)=mean(structureFRR4(structureneuron1,thresholdrange));
        structureFRRav(structureneuron1,5)=mean(structureFRR5(structureneuron1,thresholdrange));
        structureFRRav(structureneuron1,6)=mean(structureFRR6(structureneuron1,thresholdrange));
        
        structureFRR1order(structureneuron1,:)=find(structureFRR1(structureneuron1,:)==max(structureFRR1(structureneuron1,:)));
        
        end
        
        if any(neuroncuesRFR(neuron,thresholdrange)>=motithreshold)
            
        structureneuron2=structureneuron2+1;
        structureRFR1(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureRFR2(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureRFR3(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureRFR4(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureRFR5(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureRFR6(structureneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        structureRFRav(structureneuron2,1)=mean(structureRFR1(structureneuron2,thresholdrange));
        structureRFRav(structureneuron2,2)=mean(structureRFR2(structureneuron2,thresholdrange));
        structureRFRav(structureneuron2,3)=mean(structureRFR3(structureneuron2,thresholdrange));
        structureRFRav(structureneuron2,4)=mean(structureRFR4(structureneuron2,thresholdrange));
        structureRFRav(structureneuron2,5)=mean(structureRFR5(structureneuron2,thresholdrange));
        structureRFRav(structureneuron2,6)=mean(structureRFR6(structureneuron2,thresholdrange));
        
        structureRFR2order(structureneuron2,:)=find(structureRFR2(structureneuron2,:)==max(structureRFR2(structureneuron2,:)));
        end
        
        
        if any(neuroncuesFFR(neuron,thresholdrange)>=motithreshold)
            
        structureneuron3=structureneuron3+1;
        neuronname(structureneuron3)=neuron;
        structureFFR1(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureFFR2(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureFFR3(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureFFR4(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureFFR5(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureFFR6(structureneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        
        structureFFRav(structureneuron3,1)=mean(structureFFR1(structureneuron3,thresholdrange));
        structureFFRav(structureneuron3,2)=mean(structureFFR2(structureneuron3,thresholdrange));
        structureFFRav(structureneuron3,3)=mean(structureFFR3(structureneuron3,thresholdrange));
        structureFFRav(structureneuron3,4)=mean(structureFFR4(structureneuron3,thresholdrange));
        structureFFRav(structureneuron3,5)=mean(structureFFR5(structureneuron3,thresholdrange));
        structureFFRav(structureneuron3,6)=mean(structureFFR6(structureneuron3,thresholdrange));
        
        structureFFR3order(structureneuron3,:)=find(structureFFR3(structureneuron3,:)==max(structureFFR3(structureneuron3,:)));
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %find context selective cells  No REWARD COMBOS %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        if any(neuroncues2(neuron,thresholdrange)>=motithreshold)
            contextneuron2=contextneuron2+1;
        end
         if any(neuroncues12(neuron,thresholdrange)>=motithreshold)
            contextneuron12=contextneuron12+1;
         end
                 if any(neuroncues22(neuron,thresholdrange)>=motithreshold)
            contextneuron22=contextneuron22+1;
        end
        
        if any(neuroncuesRFF(neuron,thresholdrange)>=motithreshold)
            
        structureneuron4=structureneuron4+1;
        structureRFF1(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureRFF2(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureRFF3(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureRFF4(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureRFF5(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureRFF6(structureneuron4,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        structureRFF4order(structureneuron4,:)=find(structureRFF4(structureneuron4,:)==max(structureRFF4(structureneuron4,:)));
        
        end
        
        if any(neuroncuesFRF(neuron,thresholdrange)>=motithreshold)
            
        structureneuron5=structureneuron5+1;
        structureFRF1(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureFRF2(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureFRF3(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureFRF4(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureFRF5(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureFRF6(structureneuron5,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        structureFRF5order(structureneuron5,:)=find(structureFRF5(structureneuron5,:)==max(structureFRF5(structureneuron5,:)));
        end
        
        
        if any(neuroncuesRRF(neuron,thresholdrange)>=motithreshold)
            
        structureneuron6=structureneuron6+1;
%         neuronname(structureneuron6)=neuron;
        structureRRF1(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRR==1,:),1));
        structureRRF2(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFR==1,:),1));
        structureRRF3(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFFR==1,:),1));
        structureRRF4(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFF==1,:),1));
        structureRRF5(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextFRF==1,:),1));
        structureRRF6(structureneuron6,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRRF==1,:),1));
        
        structureRRF6order(structureneuron6,:)=find(structureRRF6(structureneuron6,:)==max(structureRRF6(structureneuron6,:)));
        end
        
        
        if any(neuronRFFR1(neuron,thresholdrange)>=motithreshold)
            sequenceRFFRneuron1=sequenceRFFRneuron1+1;
            
        sequenceFFR1neuron1(sequenceRFFRneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        sequenceFFR2neuron1(sequenceRFFRneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        sequenceFFR3neuron1(sequenceRFFRneuron1,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
        
        sequenceFFR1order(sequenceRFFRneuron1,:)=find(sequenceFFR1neuron1(sequenceRFFRneuron1,:)==max(sequenceFFR1neuron1(sequenceRFFRneuron1,:)));
            
        
        sequenceFFR1av(sequenceRFFRneuron1,1)=mean(sequenceFFR1neuron1(sequenceRFFRneuron1,thresholdrange));
        sequenceFFR1av(sequenceRFFRneuron1,2)=mean(sequenceFFR2neuron1(sequenceRFFRneuron1,thresholdrange));
        sequenceFFR1av(sequenceRFFRneuron1,3)=mean(sequenceFFR3neuron1(sequenceRFFRneuron1,thresholdrange));
        
        
        end
        
        if any(neuronRFFR2(neuron,thresholdrange)>=motithreshold)
            sequenceRFFRneuron2=sequenceRFFRneuron2+1;
            
        sequenceFFR1neuron2(sequenceRFFRneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        sequenceFFR2neuron2(sequenceRFFRneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        sequenceFFR3neuron2(sequenceRFFRneuron2,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
        
        sequenceFFR2order(sequenceRFFRneuron2,:)=find(sequenceFFR2neuron2(sequenceRFFRneuron2,:)==max(sequenceFFR2neuron2(sequenceRFFRneuron2,:)));
            
        sequenceFFR2av(sequenceRFFRneuron2,1)=mean(sequenceFFR1neuron2(sequenceRFFRneuron2,thresholdrange));
        sequenceFFR2av(sequenceRFFRneuron2,2)=mean(sequenceFFR2neuron2(sequenceRFFRneuron2,thresholdrange));
        sequenceFFR2av(sequenceRFFRneuron2,3)=mean(sequenceFFR3neuron2(sequenceRFFRneuron2,thresholdrange));
        
        end
        
        if any(neuronRFFR3(neuron,thresholdrange)>=motithreshold)
            sequenceRFFRneuron3=sequenceRFFRneuron3+1;
            
        sequenceFFR1neuron3(sequenceRFFRneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR1==1,:),1));
        sequenceFFR2neuron3(sequenceRFFRneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR2==1,:),1));
        sequenceFFR3neuron3(sequenceRFFRneuron3,:)=(mean(neuronstructure(neuron).preneuron.zscore(contextRFFR3==1,:),1));
        
        sequenceFFR3order(sequenceRFFRneuron3,:)=find(sequenceFFR3neuron3(sequenceRFFRneuron3,:)==max(sequenceFFR3neuron3(sequenceRFFRneuron3,:)));
            
        sequenceFFR3av(sequenceRFFRneuron3,1)=mean(sequenceFFR1neuron3(sequenceRFFRneuron3,thresholdrange));
        sequenceFFR3av(sequenceRFFRneuron3,2)=mean(sequenceFFR2neuron3(sequenceRFFRneuron3,thresholdrange));
        sequenceFFR3av(sequenceRFFRneuron3,3)=mean(sequenceFFR3neuron3(sequenceRFFRneuron3,thresholdrange));
        
        end
        
        
        
    
    
end

contextneurons=[(contextneuron1/neuron)*100 (contextneuron11/neuron)*100 (contextneuron21/neuron)*100 ...
    (contextneuron2/neuron)*100 (contextneuron12/neuron)*100 (contextneuron22/neuron)*100 ...
    (structureneuron1/neuron)*100 (structureneuron2/neuron)*100 (structureneuron3/neuron)*100 ...
    (structureneuron4/neuron)*100  (structureneuron5/neuron)*100 (structureneuron6/neuron)*100 ...
    (engageneuron1/neuron)*100 (engageneuron2/neuron)*100];

NNRneurontuning=[(contextneuron12/neuron)*100 (contextneuron22/neuron)*100 (structureneuron3/neuron)*100]

hello

[B1 I1]=sort(neuronorder);
[B1 I1all]=sort(neuronallorder);
[B11 I11rew]=sort(neuron1order);
[B21 I21rew]=sort(neuron21order);
[B2 I2]=sort(neuron2order);
[B2 I2all]=sort(neuron2allorder);
[B22 I22rew]=sort(neuron22order);
[B12 I12rew]=sort(neuron2order);
[B1R IFRR]=sort(neuronFRRorder);
[B1R IFRF]=sort(neuronFRForder);
[B2R IRRF]=sort(neuronRRForder);
[B1F IRFR]=sort(neuroRFRorder);
[B1F IRFF]=sort(neuroRFForder);
[B2F IFFR]=sort(neuronFFRorder);
[B1F I1stop]=sort(neuronstoporder);
[B1F I2stop]=sort(neuron2stoporder);
% [B2F I1run]=sort(neuronrunorder);
[B2F I2run]=sort(neuron2runorder);

[B1 IAR]=sort(neuronafterRorder);
[B1 IAF]=sort(neuronafterForder);


[B1 IRFFR1]=sort(neuronRFFR1order);
[B1 IRFFR2]=sort(neuronRFFR2order);
[B1 IRFFR3]=sort(neuronRFFR3order);
% [B1 IRFFR4]=sort(neuronRFFR4order);

[B1 IEngage1]=sort(neuronengage1order);
[B1 IEngage2]=sort(neuronengage2order);


[B1 IPost1]=sort(neuronpost1order);
[B1 IPost2]=sort(neuronpost2order);

[B1 ISeq1]=sort(sequenceFFR1order);
[B1 ISeq2]=sort(sequenceFFR2order);
[B1 ISeq3]=sort(sequenceFFR3order);



% [B1 IRFFR1moti]=sort(neuronRFFR1motiorder);
% [B1 IRFFR2moti]=sort(neuronRFFR2motiorder);
% [B1 IRFFR3moti]=sort(neuronRFFR3motiorder);
% [B1 IRFFR4moti]=sort(neuronRFFR4motiorder);


[B1 IFRR1]=sort(structureFRR1order);
[B1 IRFR2]=sort(structureRFR2order);
[B1 IFFR3]=sort(structureFFR3order);
[B1 IRFF4]=sort(structureRFF4order);
[B1 IFRF5]=sort(structureFRF5order);
[B1 IRRF6]=sort(structureRRF6order);

% startcon=10;
neuronnum=numel(neuronstructure(:));

% figure
% %%%%%%%order by peak time
% subplot(2,4,1)
% imagesc(speedcues1after)
% hold on;
% line([startpre,startpre], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startpre+10,startpre+10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startpre+23,startpre+23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startpre-10,startpre-10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startpre-23,startpre-23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% title('After 1: Speed')
% caxis([0 2])
% 
% subplot(2,4,5)
% imagesc(speedcues2after)
% hold on;
% line([startpre,startpre], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startpre+10,startpre+10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startpre+23,startpre+23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startpre-10,startpre-10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startpre-23,startpre-23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% title('After 2: Speed')
% caxis([0 2])
% 
% subplot(2,4,2)
% imagesc(neuronafterR(IAR,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('After 1 (All): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,6)
% imagesc(neuronafterF(IAF,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('After 2 (All): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,3)
% imagesc(neuronafterR(IAF,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('After 1 (Sorted on 2): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,7)
% imagesc(neuronafterF(IAR,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('After 2 (Sorted on 1): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
%  
%  
%     subplot(2,4,4)
%     averr=calculateAverage(neuronafterR,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,8)
%     averr=calculateAverage(neuronafterF,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
% 
% set(gcf, 'Position',  [0, 0, 1300, 600])
% 
% saveas(gcf,'NeuronHeatAfterAll.tif')
% 
% % hello
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% %%%%%%%order by peak time
% subplot(2,4,1)
% imagesc(speedcues1)
% hold on;
% line([startcon,startcon], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon+10,startcon+10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon+23,startcon+23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon-10,startcon-10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon-23,startcon-23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% title('Cues 1: Speed')
% caxis([0 2])
% 
% subplot(2,4,5)
% imagesc(speedcues2)
% hold on;
% line([startcon,startcon], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon+10,startcon+10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon+23,startcon+23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon-10,startcon-10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon-23,startcon-23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% title('Cues 2: Speed')
% caxis([0 2])
% 
% subplot(2,4,2)
% imagesc(neuroncues1(I1,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (All): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,6)
% imagesc(neuroncues2(I2,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (All): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,3)
% imagesc(neuroncues1stop(I1stop,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (Stops): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,7)
% imagesc(neuroncues2stop(I2stop,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (Stop): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,4)
% imagesc(neuroncues1run(I1,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (Runs): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,8)
% imagesc(neuroncues2run(I2run,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (Runs): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% set(gcf, 'Position',  [0, 0, 1300, 600])
% 
% saveas(gcf,'NeuronHeatCuesRuns.tif')
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% %%%%%%%order by peak time
% 
% 
%     subplot(2,4,1)
%     averr=calculateAverage(speedcues1,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1: Speed')
%     
%     
%     subplot(2,4,5)
%     averr=calculateAverage(speedcues2,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2: Speed')
%     
%     
%     subplot(2,4,2)
%     averr=calculateAverage(neuroncues1,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%    title('Cues 1 (All): Neurons')
%    
%    
%     subplot(2,4,6)
%     averr=calculateAverage(neuroncues2,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (All): Neurons')
% 
%     subplot(2,4,3)
%     averr=calculateAverage(neuroncues2,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1 (Stops): Neurons')
% 
%     subplot(2,4,7)
%     averr=calculateAverage(neuroncues2stop,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (Stop): Neurons')
%     
%     
%     subplot(2,4,4)
%     averr=calculateAverage(neuroncues1run,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1 (Runs): Neurons')
%     
%     
%     subplot(2,4,8)
%     averr=calculateAverage(neuroncues2run,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (Runs): Neurons')
% 
% 
% 
% set(gcf, 'Position',  [0, 0, 1300, 600])
% 
% saveas(gcf,'NeuronHeatCuesRunsAverage.tif')
% 
% %%%%%%%%%%%%%%%%%%
% 
% figure
% 
% subplot(2,4,1)
% imagesc(speedcues1all)
% hold on;
% line([startcon,startcon], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon+10,startcon+10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon+23,startcon+23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon-10,startcon-10], [0,numel(speedcues1(:,1))], 'Color', 'k');
% line([startcon-23,startcon-23], [0,numel(speedcues1(:,1))], 'Color', 'k');
% title('Cues 1: Speed')
% caxis([0 2])
% colorbar
%  colormap winter
% 
% subplot(2,4,5)
% imagesc(speedcues2all)
% hold on;
% line([startcon,startcon], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon+10,startcon+10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon+23,startcon+23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon-10,startcon-10], [0,numel(speedcues2(:,1))], 'Color', 'k');
% line([startcon-23,startcon-23], [0,numel(speedcues2(:,1))], 'Color', 'k');
% title('Cues 2: Speed')
% caxis([0 2])
% colorbar
%  colormap winter
% 
% subplot(2,4,2)
% imagesc(neuroncues1all(I1all,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (Sorted): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,6)
% imagesc(neuroncues2all(I2all,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (Sorted on 1): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,3)
% imagesc(neuroncues11(I11rew,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (After Reward): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,7)
% imagesc(neuroncues12(I12rew,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (After Reward): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,4)
% imagesc(neuroncues21(I21rew,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 1 (After Nothing): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,4,8)
% imagesc(neuroncues22(I22rew,:))
% hold on;
% line([startcon,startcon], [0,neuronnum], 'Color', 'k');
% line([startcon+10,startcon+10], [0,neuronnum], 'Color', 'k');
% line([startcon+23,startcon+23], [0,neuronnum], 'Color', 'k');
% line([startcon-10,startcon-10], [0,neuronnum], 'Color', 'k');
% line([startcon-23,startcon-23], [0,neuronnum], 'Color', 'k');
% title('Cues 2 (After Nothing): Neurons')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% 
% 
% set(gcf, 'Position',  [0, 0, 1300, 600])
% 
% saveas(gcf,'NeuronHeatCuesAfter.tif')
% 
% 
% figure
% %%%%%%%order by peak time
% 
% 
%     subplot(2,4,1)
%     averr=calculateAverage(speedcues1,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1: Speed')
%     
%     
%     subplot(2,4,5)
%     averr=calculateAverage(speedcues2,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2: Speed')
%     
%     
%     subplot(2,4,2)
%     averr=calculateAverage(neuroncues1all,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%    title('Cues 1 (All): Neurons')
%    
%    
%     subplot(2,4,6)
%     averr=calculateAverage(neuroncues2all,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (All): Neurons')
% 
%     subplot(2,4,3)
%     averr=calculateAverage(neuroncues11,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1 (Stops): Neurons')
% 
%     subplot(2,4,7)
%     averr=calculateAverage(neuroncues12,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (Stop): Neurons')
%     
%     
%     subplot(2,4,4)
%     averr=calculateAverage(neuroncues21,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 1 (Runs): Neurons')
%     
%     
%     subplot(2,4,8)
%     averr=calculateAverage(neuroncues22,0);
%     errorbar(xaxiscon,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxcon])
%     ylim([limityneuron])
%     title('Cues 2 (Runs): Neurons')
% 
% 
% 
% 
% set(gcf, 'Position',  [0, 0, 1300, 600])
% 
% saveas(gcf,'NeuronHeatCuesAfterAverage.tif')
% 
% %%%%%%%%%%%%%%%%%%
% 
% figure
% 
% subplot(2,6,1)
% imagesc(neuroncuesFRR(IFRR,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Reward)')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,6,2)
% imagesc(neuroncuesRFR(IRFR,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Fail)')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,6,3)
% imagesc(neuroncuesFFR(IFFR,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 2F)')
% caxis(coloraxis)
% colorbar
% colormap winter
% 
% subplot(2,6,4)
% imagesc(neuroncuesRFF(IRFF,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Fail (After 1 Fail)')
% caxis(coloraxis)
% colorbar
%  colormap winter
% 
% subplot(2,6,5)
% imagesc(neuroncuesFRF(IFRF,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Fail (After 1 Reward)')
% caxis(coloraxis)
% colorbar
% colormap winter
% 
% subplot(2,6,6)
% imagesc(neuroncuesRRF(IRRF,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Fail (After 2 R)')
% caxis(coloraxis)
% colorbar
% colormap winter
% 
% 
%  
%     subplot(2,6,7)
%     averr=calculateAverage(neuroncuesFRR,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,6,8)
%     averr=calculateAverage(neuroncuesRFR,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,6,9)
%     averr=calculateAverage(neuroncuesFFR,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,6,10)
%     averr=calculateAverage(neuroncuesRFF,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,6,11)
%     averr=calculateAverage(neuroncuesFRF,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,6,12)
%     averr=calculateAverage(neuroncuesRRF,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
% 
% set(gcf, 'Position',  [0, 0, 1600, 600])
% 
% saveas(gcf,'NeuronHeat1R2R1F2F.tif')
% 
% 
% %%%%%%%%%%%%%%%%%%
% 
% figure
% 
% subplot(2,4,1)
% imagesc(neuronRFFR1(IRFFR1,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Reward)')
% caxis(coloraxis)
%  colormap winter
% 
% subplot(2,4,2)
% imagesc(neuronRFFR2(IRFFR2,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Fail)')
% caxis(coloraxis)
%  colormap winter
% 
% subplot(2,4,3)
% imagesc(neuronRFFR3(IRFFR3,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 2F)')
% caxis(coloraxis)
% colormap winter
% 
% subplot(2,4,4)
% imagesc(neuronRFFR4(IRFFR4,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Fail (After 1 Fail)')
% caxis(coloraxis)
%  colormap winter
% 
% 
%  
%     subplot(2,4,5)
%     averr=calculateAverage(neuronRFFR1,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,6)
%     averr=calculateAverage(neuronRFFR2,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,7)
%     averr=calculateAverage(neuronRFFR3,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,8)
%     averr=calculateAverage(neuronRFFR4,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
% set(gcf, 'Position',  [0, 0, 1000, 600])
% 
% saveas(gcf,'NeuronHeatRFFR.tif')
% 
% 
% %%%%%%%%%%%
% 
% figure
% 
% 
% subplot(2,4,1)
% imagesc(neuronRFFR1moti(IRFFR4moti,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Reward)')
% caxis(coloraxis)
%  colormap winter
% 
% subplot(2,4,2)
% imagesc(neuronRFFR2moti(IRFFR4moti,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 1 Fail)')
% caxis(coloraxis)
%  colormap winter
% 
% subplot(2,4,3)
% imagesc(neuronRFFR3moti(IRFFR4moti,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward (After 2F)')
% caxis(coloraxis)
% colormap winter
% 
% subplot(2,4,4)
% imagesc(neuronRFFR4moti(IRFFR4moti,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Fail (After 1 Fail)')
% caxis(coloraxis)
%  colormap winter
%  
%  
%  
%     subplot(2,4,5)
%     averr=calculateAverage(neuronRFFR1moti,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,6)
%     averr=calculateAverage(neuronRFFR2moti,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,7)
%     averr=calculateAverage(neuronRFFR3moti,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
%     
%     
%     subplot(2,4,8)
%     averr=calculateAverage(neuronRFFR4moti,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
%     title('All')
% set(gcf, 'Position',  [0, 0, 1000, 600])
% 
% saveas(gcf,'NeuronHeatRFFRmoti.tif')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Reward Structure Tuninig%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure


subplot(6,3,1)
imagesc(structureFRR1(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,2)
imagesc(structureFRR2(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,3)
imagesc(structureFRR3(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,4)
    averr=calculateAverage(structureFRR1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,5)
    averr=calculateAverage(structureFRR2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,6)
    averr=calculateAverage(structureFRR3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    

subplot(6,3,7)
imagesc(structureRFR1(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,8)
imagesc(structureRFR2(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,9)
imagesc(structureRFR3(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,10)
    averr=calculateAverage(structureRFR1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,11)
    averr=calculateAverage(structureRFR2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,12)
    averr=calculateAverage(structureRFR3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    

subplot(6,3,13)
imagesc(structureFFR1(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,14)
imagesc(structureFFR2(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,15)
imagesc(structureFFR3(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,16)
    averr=calculateAverage(structureFFR1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,17)
    averr=calculateAverage(structureFFR2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,18)
    averr=calculateAverage(structureFFR3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    
set(gcf, 'Position',  [0, 0, 600, 1000])

saveas(gcf,'NeuronRewardStructureTuningR.jpeg')

%%%%%%%%%%%

figure


subplot(6,3,1)
imagesc(structureFRR4(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,2)
imagesc(structureFRR5(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,3)
imagesc(structureFRR6(IFRR1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,4)
    averr=calculateAverage(structureFRR4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,5)
    averr=calculateAverage(structureFRR5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,6)
    averr=calculateAverage(structureFRR6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    

subplot(6,3,7)
imagesc(structureRFR4(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,8)
imagesc(structureRFR5(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,9)
imagesc(structureRFR6(IRFR2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,10)
    averr=calculateAverage(structureRFR4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,11)
    averr=calculateAverage(structureRFR5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,12)
    averr=calculateAverage(structureRFR6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    

subplot(6,3,13)
imagesc(structureFFR4(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,14)
imagesc(structureFFR5(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,15)
imagesc(structureFFR6(IFFR3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,16)
    averr=calculateAverage(structureFFR4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,17)
    averr=calculateAverage(structureFFR5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,18)
    averr=calculateAverage(structureFFR6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    
set(gcf, 'Position',  [500, 0, 600, 1000])

saveas(gcf,'NeuronRewardStructureTuningNR.jpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% NO Reward Structure Tunnig%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure


subplot(6,3,1)
imagesc(structureRFF1(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,2)
imagesc(structureRFF2(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,3)
imagesc(structureRFF3(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,4)
    averr=calculateAverage(structureRFF1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,5)
    averr=calculateAverage(structureRFF2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,6)
    averr=calculateAverage(structureRFF3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    

subplot(6,3,7)
imagesc(structureFRF1(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,8)
imagesc(structureFRF2(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,9)
imagesc(structureFRF3(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,10)
    averr=calculateAverage(structureFRF1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,11)
    averr=calculateAverage(structureFRF2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,12)
    averr=calculateAverage(structureFRF3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    

subplot(6,3,13)
imagesc(structureRRF1(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,14)
imagesc(structureRRF2(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FR)')
caxis(coloraxis)
 colormap winter

subplot(6,3,15)
imagesc(structureRRF3(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FFR)')
caxis(coloraxis)
colormap winter



subplot(6,3,16)
    averr=calculateAverage(structureRRF1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,17)
    averr=calculateAverage(structureRRF2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,18)
    averr=calculateAverage(structureRRF3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    
set(gcf, 'Position',  [0, 0, 600, 1000])

saveas(gcf,'NeuronNoRewardStructureTuningR.jpeg')

%%%%%%%%%%%

figure


subplot(6,3,1)
imagesc(structureRFF4(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,2)
imagesc(structureRFF5(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,3)
imagesc(structureRFF6(IRFF4,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FRR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,4)
    averr=calculateAverage(structureRFF4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,5)
    averr=calculateAverage(structureRFF5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,6)
    averr=calculateAverage(structureRFF6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    

subplot(6,3,7)
imagesc(structureFRF4(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,8)
imagesc(structureFRF5(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,9)
imagesc(structureFRF6(IFRF5,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('RFR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,10)
    averr=calculateAverage(structureFRF4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,11)
    averr=calculateAverage(structureFRF5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,12)
    averr=calculateAverage(structureFRF6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    

subplot(6,3,13)
imagesc(structureRRF4(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RFF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,14)
imagesc(structureRRF5(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (FRF)')
caxis(coloraxis)
 colormap winter

subplot(6,3,15)
imagesc(structureRRF6(IRRF6,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR tuned (RRF)')
caxis(coloraxis)
colormap winter



subplot(6,3,16)
    averr=calculateAverage(structureRRF4,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,17)
    averr=calculateAverage(structureRRF5,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
subplot(6,3,18)
    averr=calculateAverage(structureRRF6,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    title('All')
    
    
    
set(gcf, 'Position',  [500, 0, 600, 1000])

saveas(gcf,'NeuronNoRewardStructureTuningNR.jpeg')


%%%%%%%%%
figure

subplot(4,4,1)
imagesc(engageR1con(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (Rew Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,2)
imagesc(engageR1(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter



    
    
    
subplot(4,4,3)
imagesc(engageR2con(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (NR Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,4)
imagesc(engageR2(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter



subplot(4,4,5)
    averr=calculateAverage(engageR1con,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,6)
    averr=calculateAverage(engageR1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
subplot(4,4,7)
    averr=calculateAverage(engageR2con,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,8)
    averr=calculateAverage(engageR2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
    

subplot(4,4,9)
imagesc(engageN1con(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (Rew Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,10)
imagesc(engageN1(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter




    
    subplot(4,4,11)
imagesc(engageN2con(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (NR Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,12)
imagesc(engageN2(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter
 
 
 
 subplot(4,4,13)
    averr=calculateAverage(engageN1con,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,14)
    averr=calculateAverage(engageN1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])



subplot(4,4,15)
    averr=calculateAverage(engageN2con,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,16)
    averr=calculateAverage(engageN2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
set(gcf, 'Position',  [500, 0, 1000, 1000])

saveas(gcf,'NeuronEngagements.jpeg')

%%%%%%%%%%%%%%%%%%%%%%%%

figure

subplot(4,4,1)
imagesc(neuronRFFR1engageR(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (Rew Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,2)
imagesc(neuronRFFR2engageR(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter



    
    
    
subplot(4,4,3)
imagesc(neuronRFFR3engageR(IEngage1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('Reward Engage Neurons (NR Con)')
caxis(coloraxis)
 colormap winter

% subplot(4,4,4)
% imagesc(neuronRFFR4engageR(IEngage1,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('Reward Engage Neurons (Engage)')
% caxis(coloraxis)
%  colormap winter



subplot(4,4,5)
    averr=calculateAverage(neuronRFFR1engageR,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,6)
    averr=calculateAverage(neuronRFFR2engageR,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
subplot(4,4,7)
    averr=calculateAverage(neuronRFFR3engageR,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
% subplot(4,4,8)
%     averr=calculateAverage(neuronRFFR4engageR,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
    
    
    

subplot(4,4,9)
imagesc(neuronRFFR1engageN(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (Rew Con)')
caxis(coloraxis)
 colormap winter

subplot(4,4,10)
imagesc(neuronRFFR2engageN(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (Engage)')
caxis(coloraxis)
 colormap winter




    
    subplot(4,4,11)
imagesc(neuronRFFR3engageN(IEngage2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('NR Engage Neurons (NR Con)')
caxis(coloraxis)
 colormap winter

% subplot(4,4,12)
% imagesc(neuronRFFR4engageN(IEngage2,:))
% hold on;
% line([startpre,startpre], [0,neuronnum], 'Color', 'k');
% line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
% line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
% line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
% line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
% title('NR Engage Neurons (Engage)')
% caxis(coloraxis)
%  colormap winter
 
 
 
 subplot(4,4,13)
    averr=calculateAverage(neuronRFFR1engageN,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
subplot(4,4,14)
    averr=calculateAverage(neuronRFFR2engageN,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])



subplot(4,4,15)
    averr=calculateAverage(neuronRFFR3engageN,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    
% subplot(4,4,16)
%     averr=calculateAverage(neuronRFFR4engageN,0);
%     errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
%     xlim([limitxpre])
%     ylim([limityneuron])
    
    
set(gcf, 'Position',  [500, 0, 1000, 1000])

saveas(gcf,'NeuronEngagementsRFFR.jpeg')

%%%%%%%%%%%%%%%%%%

figure
subplot(6,3,1)
imagesc(sequenceFFR1neuron1(ISeq1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (1st F tuned; 1st F)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,2)
imagesc(sequenceFFR2neuron1(ISeq1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (1st F tuned; 2nd F)')
caxis(coloraxis)
 colormap winter
 
  subplot(6,3,3)
imagesc(sequenceFFR3neuron1(ISeq1,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (1st F tuned; R)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,4)
    averr=calculateAverage(sequenceFFR1neuron1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,5)
    averr=calculateAverage(sequenceFFR2neuron1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,6)
    averr=calculateAverage(sequenceFFR3neuron1,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
    %%%
    
subplot(6,3,7)
imagesc(sequenceFFR1neuron2(ISeq2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (2nd F tuned; 1st F)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,8)
imagesc(sequenceFFR2neuron2(ISeq2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (2nd F tuned; 2nd F)')
caxis(coloraxis)
 colormap winter
 
  subplot(6,3,9)
imagesc(sequenceFFR3neuron2(ISeq2,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (2nd F tuned; R)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,10)
    averr=calculateAverage(sequenceFFR1neuron2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,11)
    averr=calculateAverage(sequenceFFR2neuron2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,12)
    averr=calculateAverage(sequenceFFR3neuron2,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])

    
    %%%
    
subplot(6,3,13)
imagesc(sequenceFFR1neuron3(ISeq3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (R tuned; 1st F)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,14)
imagesc(sequenceFFR2neuron3(ISeq3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (R tuned; 2nd F)')
caxis(coloraxis)
 colormap winter
 
  subplot(6,3,15)
imagesc(sequenceFFR3neuron3(ISeq3,:))
hold on;
line([startpre,startpre], [0,neuronnum], 'Color', 'k');
line([startpre+10,startpre+10], [0,neuronnum], 'Color', 'k');
line([startpre+23,startpre+23], [0,neuronnum], 'Color', 'k');
line([startpre-10,startpre-10], [0,neuronnum], 'Color', 'k');
line([startpre-23,startpre-23], [0,neuronnum], 'Color', 'k');
title('FFR (R tuned; R)')
caxis(coloraxis)
 colormap winter
 
 subplot(6,3,16)
    averr=calculateAverage(sequenceFFR1neuron3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,17)
    averr=calculateAverage(sequenceFFR2neuron3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    
     subplot(6,3,18)
    averr=calculateAverage(sequenceFFR3neuron3,0);
    errorbar(xaxispre,averr(:,1),averr(:,2),'color',[0 0 0],'LineWidth',2)
    xlim([limitxpre])
    ylim([limityneuron])
    

set(gcf, 'Position',  [500, 0, 600, 1000])

saveas(gcf,'NeuronRFFRSequenceTuning.jpeg')

% hello


