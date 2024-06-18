%%%find best fit correlation

clear all
clear all
close all
close all

load 'Fall_new.mat'
load 'imagingbehavior.mat'


Fnewshort=Fnew(:,end-numel(imagingbehavior(:,1)):end);

for n1=1:numel(Fnewshort(:,1))
    neuron1=Fnewshort(:,n1);
    fitnum=0;
    neuronfitsexcept=[];
    for n2=1:1:numel(Fnewshort(:,1)) 
        fitnum=fitnum+1;
        neuron2=Fnewshort(:,n2);
        cc=corrcoef(neuron1,neuron2);
        neuronfits(n2,n1)=cc(1,2);
        if n2~=n1
            neuronfitsexcept(fitnum)=cc(1,2);
        end
    end
    
        bestfit(n1)=max(neuronfitsexcept);
    
end

imagesc(neuronfits)
colorbar; 
caxis([0 1])

set(gcf, 'Position',  [0, 500, 250, 250])
saveas(gcf,'Correlations.tif')
   