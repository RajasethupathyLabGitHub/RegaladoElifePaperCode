function averr = calculateAverage(neuron,z)

if numel(neuron(:,1))>=2 || numel(neuron(:,1))==0
if z==0
    averr(:,1) = mean(neuron);
elseif z==1
    averr(:,1) = zscore(mean(neuron));
end
    averr(:,2) = std(neuron)/sqrt(length(neuron));
    
    
    
elseif numel(neuron(:,1))==1
        averr(:,1)=neuron;
        averr(:,2)=0;
end
        
end