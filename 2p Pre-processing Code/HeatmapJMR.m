%%%For each neuron, get their signal for every cue and reward and
%%%engagement after reward
clear all
clear all

load 'imagingbehavior.mat'

%%%describe the columns in imagingbehavior
experimenttimecolumn=1;
trialtimecolumn=2;
distancey=3;
distancex=4;
speedcolumn=5;
cuecolumn=6;
trialtypecolumn=13;
trialcolumn=14;
lickratecolumn=19;

neuroncolumn=numel(imagingbehavior(1,:))-numel(Fnew(:,1));
neuronnum=numel(Fnew(:,1));

neuroncount=0;
newcue1all=0;
newcue2all=0;

%%%%%%%%%%%%%%%%%%%%%%%%
%%%find contextentries%%%
%%%%%%%%%%%%%%%%%%%%%%%%
contextentries=find(diff(imagingbehavior(:,cuecolumn))==1)

start=5;
finish=25;


for i=1:numel(contextentries)

    if contextentries(i)>start && contextentries(i)<numel(imagingbehavior(:,1))-finish %check if you can grab the amount of elements necesary
        
        if imagingbehavior(contextentries(i),trialtypecolumn)==1 %check if the mouse entered a reward room
        newcue1all=newcue1all+1;
        
        %%%get speed normalized within a certain range
        cue1speed(newcue1all,:)=imagingbehavior(contextentries(i)-start:contextentries(i)+finish,speedcolumn);

        %%%get neurons
        for n=1:neuronnum
        cue1neurons(newcue1all,:,n)=imagingbehavior(contextentries(i)-start:contextentries(i)+finish,neuroncolumn+n);
        end
        end

        if imagingbehavior(contextentries(i),trialtypecolumn)==2 %check if mouse entered a nonreward room
        newcue2all=newcue2all+1;
        %%%get speed normalized
        cue2speed(newcue2all,:)=imagingbehavior(contextentries(i)-start:contextentries(i)+finish,speedcolumn);

        for n=1:neuronnum
        cue2neurons(newcue2all,:,n)=imagingbehavior(contextentries(i)-start:contextentries(i)+finish,neuroncolumn+n);
        end
        end
    
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%





timerange=imagingbehavior(contextentries(2)-start:contextentries(2)+finish,1)-imagingbehavior(contextentries(2),1)
%%%average the neuron responses in cues
for n=1:numel(cue1neurons(1,1,:))

    for t=1:numel(cue1neurons(1,:,1))
        cue1neuronsav(n,t)=mean(cue1neurons(:,t,n));
    end
    cue1neuronsav(n,:)=normalize(cue1neuronsav(n,:));
    cue1order(n)=find(cue1neuronsav(n,:)==max(cue1neuronsav(n,:)));
    cuetuning(n,1)=mean(cue1neuronsav(n,start:start+10))-mean(cue1neuronsav(n,1:start));

    for t=1:numel(cue2neurons(1,:,1))
        cue2neuronsav(n,t)=mean(cue2neurons(:,t,n));
    end
    cue2neuronsav(n,:)=normalize(cue2neuronsav(n,:));
    cue2order(n)=find(cue2neuronsav(n,:)==max(cue2neuronsav(n,:)));
    cuetuning(n,2)=mean(cue2neuronsav(n,start:start+10))-mean(cue2neuronsav(n,1:start));
    cuetuning(n,3)=cuetuning(n,1)-cuetuning(n,2);
    

end

[B1 I1]=sort(cue1order);
[B2 I2]=sort(cue2order);

subplot(2,4,1)
imagesc(cue1speed)
hold on;
line([start,start], [0,numel(cue1speed(:,1))], 'Color', 'k');
hold on;
line([start+10,start+10], [0,numel(cue1speed(:,1))], 'Color', 'k');
hold on;
line([start+20,start+20], [0,numel(cue1speed(:,1))], 'Color', 'k');
title('Cues 1: Speed')

subplot(2,4,5)
imagesc(cue2speed)
hold on;
line([start,start], [0,numel(cue2speed(:,1))], 'Color', 'k');
line([start+10,start+10], [0,numel(cue2speed(:,1))], 'Color', 'k');
line([start+20,start+20], [0,numel(cue2speed(:,1))], 'Color', 'k');
title('Cues 2: Speed')

subplot(2,4,2)
imagesc(cue1neuronsav)
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 1: Neurons')

subplot(2,4,6)
imagesc(cue2neuronsav)
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 2: Neurons')

subplot(2,4,3)
imagesc(cue1neuronsav(I1,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 1: Neurons (Sorted 1)')

subplot(2,4,7)
imagesc(cue2neuronsav(I2,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 2: Neurons (Sorted 2)')

subplot(2,4,4)
imagesc(cue1neuronsav(I2,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 1: Neurons (Sorted 2)')

subplot(2,4,8)
imagesc(cue2neuronsav(I1,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start+20,start+20], [0,neuronnum], 'Color', 'k');
title('Cues 2: Neurons (Sorted 1)')

set(gcf, 'Position',  [0, 0, 1300, 600])

saveas(gcf,'NeuronHeatCue.tif')




%%%%%%%%%%%%%%%%%%%%%%%%
%%%find water entries%%%
%%%%%%%%%%%%%%%%%%%%%%%%
waterentries=find(diff(imagingbehavior(:,9))==1)
nothingentries=find(diff(imagingbehavior(:,10))==1);
newwater1all=0;
newwater2all=0;

start=15;
finish=15;


for i=1:numel(waterentries)

    if waterentries(i)>start && waterentries(i)<numel(imagingbehavior(:,1))-finish
        
        if imagingbehavior(waterentries(i),trialtypecolumn)==1
        newwater1all=newwater1all+1;
        
        %%%get speed normalized
        water1speed(newwater1all,:)=imagingbehavior(waterentries(i)-start:waterentries(i)+finish,speedcolumn);

        %%%get neurons
        for n=1:neuronnum
        water1neurons(newwater1all,:,n)=imagingbehavior(waterentries(i)-start:waterentries(i)+finish,neuroncolumn+n);
        end
        end
    
    end
end

for i=1:numel(nothingentries)

    if nothingentries(i)>start && nothingentries(i)<numel(imagingbehavior(:,1))-finish
       

        if imagingbehavior(nothingentries(i),trialtypecolumn)==2
        newwater2all=newwater2all+1;
        %%%get speed normalized
        water2speed(newwater2all,:)=imagingbehavior(nothingentries(i)-start:nothingentries(i)+finish,speedcolumn);

        for n=1:neuronnum
        water2neurons(newwater2all,:,n)=imagingbehavior(nothingentries(i)-start:nothingentries(i)+finish,neuroncolumn+n);
        end
        end
    
    end
end


timerange=imagingbehavior(waterentries(2)-start:waterentries(2)+finish,1)-imagingbehavior(waterentries(2),1)
%%%average the neuron responses in cues
for n=1:numel(water1neurons(1,1,:))

    for t=1:numel(water1neurons(1,:,1))
        water1neuronsav(n,t)=mean(water1neurons(:,t,n));
    end
    water1neuronsav(n,:)=normalize(water1neuronsav(n,:));
    water1order(n)=find(water1neuronsav(n,:)==max(water1neuronsav(n,:)));

    for t=1:numel(water2neurons(1,:,1))
        water2neuronsav(n,t)=mean(water2neurons(:,t,n));
    end
    water2neuronsav(n,:)=normalize(water2neuronsav(n,:));
    water2order(n)=find(water2neuronsav(n,:)==max(water2neuronsav(n,:)));
    

end

[B1 I1rew]=sort(water1order);
[B2 I2rew]=sort(water2order);

figure

subplot(2,4,1)
imagesc(water1speed)
hold on;
line([start,start], [0,numel(water1speed(:,1))], 'Color', 'k');
hold on;
line([start+10,start+10], [0,numel(water1speed(:,1))], 'Color', 'k');
hold on;
line([start-10,start-10], [0,numel(water1speed(:,1))], 'Color', 'k');
title('Out 1: Speed')

subplot(2,4,5)
imagesc(water2speed)
hold on;
line([start,start], [0,numel(water2speed(:,1))], 'Color', 'k');
line([start+10,start+10], [0,numel(water2speed(:,1))], 'Color', 'k');
line([start-10,start-10], [0,numel(water2speed(:,1))], 'Color', 'k');
title('Out 2: Speed')

subplot(2,4,2)
imagesc(water1neuronsav)
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 1: Neurons')

subplot(2,4,6)
imagesc(water2neuronsav)
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 2: Neurons')

subplot(2,4,3)
imagesc(water1neuronsav(I1rew,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 1: Neurons (Sorted 1)')

subplot(2,4,7)
imagesc(water2neuronsav(I2rew,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 2: Neurons (Sorted 2)')

subplot(2,4,4)
imagesc(water1neuronsav(I2rew,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 1: Neurons (Sorted 2)')

subplot(2,4,8)
imagesc(water2neuronsav(I1rew,:))
hold on;
line([start,start], [0,neuronnum], 'Color', 'k');
line([start+10,start+10], [0,neuronnum], 'Color', 'k');
line([start-10,start-10], [0,neuronnum], 'Color', 'k');
title('Out 2: Neurons (Sorted 1)')

set(gcf, 'Position',  [0, 0, 1300, 600])


saveas(gcf,'NeuronHeatRew.tif')

