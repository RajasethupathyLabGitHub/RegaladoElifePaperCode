%%%This script now looks at the finished behavior variable (with trial times,
%%%stimuli and lickrates) to align the neurons from your Fall.mat file
%%%it looks for the number of columns in your behavior variable and starts
%%%putting the neuron activity in separate columns that are added

load 'Fall_new.mat'

count=0;
colnum=numel(behavior(1,:));

%%fix the nothing number column



for i=1:numel(behavior(:,1))
    
    if behavior(i,6)==1 && behavior(i-1,6)==0  
        
        endcontext=find(behavior(i:end,6)==0,1)+i-2;
        endcontextime=behavior(endcontext,1)-behavior(i,1)
           
           if  ~isempty(endcontextime) && endcontextime>5 && behavior(i,13)==2
               
               startreward=find(behavior(:,1)>=(behavior(endcontext,1)-3),1)
               behavior(startreward:endcontext,10)=1;
               
           end
    
    
    end

end

for a=1:numel(frametimes_3rd)
    frame=frametimes_3rd(a);
    getthisrow=1;
    if frame>0
    for b=1:numel(behavior(1:end-1,1))
        if behavior(b,1)>=frame+behavior(50,1) && getthisrow==1
%             hello
            count=count+1;
            getthisrow=0;
            imagingbehavior(count,1:colnum)=behavior(b,1:colnum);
            
            
            if count==1
            elseif count>1
            end
            imagingbehavior(count,colnum+1)=count;
            neuroncount=0;
            for neuron=1:numel(Fnew(:,1))
                    neuroncount=neuroncount+1;
                    imagingbehavior(count,colnum+1+neuroncount)=Fnew(neuron,a);
                    newzdff(count,neuron)=zdff(neuron,a);
                    newnoisedff(count,neuron)=noisedff(neuron,a);
                    newtransientstart(count,neuron)=transientstart(neuron,a);
                    newnormstart(count,neuron)=normdff(neuron,a);
            end
            
            oldnumber=a;
            
        end
       
    end
    end
end
zdff=newzdff;
noisedff=newnoisedff;
normdff=newnormstart;
transientstart=newtransientstart;

% hello

%remove the last trials if the mouse never stops
lastreward=find(diff(imagingbehavior(:,9)),1,'last');
lastposition=numel(imagingbehavior(:,9))
if lastposition-lastreward>59
imagingbehavior=imagingbehavior(1:lastreward+60,:);
end


%%% save imaging behavior
clearvars -except imagingbehavior Fnew colnum lickcolumn Fnewshort frametimes_3rd zdff noisedff normdff transientstart

filename= 'imagingbehavior.mat'
save(filename)

% hello