% FIRST: comment in these two variables so you can paste the ROI data from ImageJ
% ROI=0;

% if mod(numel(ROI(:,1)), 2) == 0
% else
%   ROI=ROI(1:end-1,:);
% end
    
% FIRST: comment in these two variables so you can paste the ROI data from ImageJ
% ROI=0;

numberofROIs=5;

if ROI(end,end)==0
    ROI=ROI(1:end-1,:);
end

if mod(numel(ROI(:,1)), 2) == 0
else
  ROI=ROI(1:end-1,:);
end
% 
% mean1st=mean(ROI(:,2));
% even=0;
% odd=0;
% for a=1:numel(ROI(:,2))
%     if ROI(a,2)> mean1st
%         even=even+1;
%     meanFirsteven(1,even)=ROI(a,2);
%     elseif ROI(a,2)< mean1st
%         odd=odd+1;
%         meanFirstodd(1,odd)=ROI(a,2);
%     end
%     if odd > even +1
%         disp(a)
%     end
% end
% 
% mean2nd=mean(ROI(:,3));
% even=0;
% odd=0;
% for a=1:numel(ROI(:,3))
%     if ROI(a,3)> mean2nd
%         even=even+1;
%     meanSecondeven(1,even)=ROI(a,3);
%     elseif ROI(a,3)< mean2nd
%         odd=odd+1;
%         meanSecondodd(1,odd)=ROI(a,3);
%     end
% end
% 
%     
% mean3rd=mean(ROI(:,4));
% even=0;
% odd=0;
% for a=1:numel(ROI(:,4))
%     if ROI(a,4)> mean3rd
%         even=even+1;
%     meanThirdeven(1,even)=ROI(a,4);
%     elseif ROI(a,4)< mean3rd
%         odd=odd+1;
%         meanThirdodd(1,odd)=ROI(a,4);
%     end
% % end
% count1=0;
% count2=0;
% oneROIset=[];
% otherROIset=[];
% 
% for x=1:numel(ROI(:,1))
%     
%     if x<=100 && mod(x, 2) == 1
%         count1=count1+1;
%         oneROIset(count1,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
%     elseif x<=100 && mod(x, 2) == 0
%         count2=count2+1;
%         otherROIset(count2,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
%     end
%     
%     if x>100
%         numbertocompare=ROI(x,2);
%         oldnumber=ROI(x-1,2);
%         oldoldnumber=ROI(x-2,2);
%         oldoldoldnumber=ROI(x-3,2);
%         oneROImean=mean(ROI(101:2:200,2));
%         otherROImean=mean(ROI(100:2:200,2));
%         %[ROI(x,2), abs(oneROImean-numbertocompare), abs(otherROImean-numbertocompare)]
%         if numbertocompare<oldnumber   && abs(numbertocompare-oldnumber)>abs(numbertocompare-oldoldnumber) && abs(numbertocompare-oldoldnumber)<abs(numbertocompare-oldoldoldnumber)
%         count1=count1+1;
%         oneROIset(count1,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
% %         elseif numbertocompare<oldnumber && abs(numbertocompare-oldnumber)<abs(numbertocompare-oldoldnumber) %&& abs(numbertocompare-oldoldnumber)>abs(numbertocompare-oldoldoldnumber)
% %             count2=count2+1;
% %             otherROIset(count2,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
%         end
%         if numbertocompare>oldnumber  && abs(numbertocompare-oldnumber)>abs(numbertocompare-oldoldnumber) && abs(numbertocompare-oldoldnumber)<abs(numbertocompare-oldoldoldnumber)
%             count2=count2+1;
%             otherROIset(count2,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
% %         elseif numbertocompare>oldnumber  && abs(numbertocompare-oldnumber)<abs(numbertocompare-oldoldnumber) %&& abs(numbertocompare-oldoldnumber)>abs(numbertocompare-oldoldoldnumber)
% %             count1=count1+1;
% %             oneROIset(count1,1:numel(ROI(1,:)))=ROI(x,1:numel(ROI(1,:)));
%         end
%     end
% end



oneROIset=ROI(1:2:end,:);
otherROIset=ROI(2:2:end,:);

differencebetween=[];
meanofdifference=[];
stdofdifference=[];


for row=1:numel(oneROIset(:,1)) 
%     meanofdifference(row,1)=mean(differencebetween);
%     stdofdifference(row,1)=std(differencebetween);
    if oneROIset(row,numberofROIs+1)<otherROIset(row,numberofROIs+1)
       temp=oneROIset(row,:);
       oneROIset(row,:)=otherROIset(row,:);
       otherROIset(row,:)=temp;
    end
end

differencebetween=[];
for row=1:numel(oneROIset(:,1))
    row
     differencebetween(row,1)=oneROIset(row,numberofROIs+1)-otherROIset(row,numberofROIs+1);
     if differencebetween(row,1)>=-5 && differencebetween(row,1)<=5
         mean(oneROIset(1:row,numberofROIs+1))
         oneROIset(row,end)
         mean(otherROIset(1:row,numberofROIs+1))
         otherROIset(row,end)
         
        if oneROIset(row,numberofROIs+1)>mean(oneROIset(1:row,numberofROIs+1))+2*std(oneROIset(1:row,numberofROIs+1)) || oneROIset(row,numberofROIs+1)<mean(oneROIset(1:row,numberofROIs+1))-2*std(oneROIset(1:row,numberofROIs+1))
             'delete oneROIset'
             temp=oneROIset;
             temp2=[];
             temp2=temp(1:row-1,:);
             oneROIset=vertcat(temp2,temp(row+1:end,:));
         end
         if otherROIset(row,numberofROIs+1)>mean(otherROIset(1:row,numberofROIs+1))+2*std(otherROIset(1:row,numberofROIs+1)) || otherROIset(row,numberofROIs+1)<mean(otherROIset(1:row,numberofROIs+1))-2*std(otherROIset(1:row,numberofROIs+1))
             'delete otherROIset'
             temp=otherROIset;
             temp2=[];
             temp2=temp(1:row-1,:);
             otherROIset=vertcat(temp2,temp(row+1:end,:));
         end
         if numel(oneROIset(:,1))>numel(otherROIset(:,1))
             oneROIset=oneROIset(1:end-1,:);
         elseif numel(oneROIset(:,1))<numel(otherROIset(:,1))
             otherROIset=otherROIset(1:end-1,:);
         end
     end
end



if numberofROIs==1
meanFirsteven(1,:)= oneROIset(:,2);
meanFirstodd(1,:)= otherROIset(:,2);
meanSecondeven=0;
meanSecondodd=0;
meanThirdeven=0;
meanThirdodd=0;
meanFourtheven=0;
meanFourthodd=0;
meanFiftheven=0;
meanFifthodd=0;
elseif numberofROIs==2
meanFirsteven(1,:)= oneROIset(:,2);
meanFirstodd(1,:)=otherROIset(:,2);
meanSecondeven(1,:)=oneROIset(:,3);
meanSecondodd(1,:)=otherROIset(:,3);
meanThirdeven=0;
meanThirdodd=0;
meanFourtheven=0;
meanFourthodd=0;
meanFiftheven=0;
meanFifthodd=0;
elseif numberofROIs==3
meanFirsteven(1,:)= oneROIset(:,2);
meanFirstodd(1,:)=otherROIset(:,2);
meanSecondeven(1,:)=oneROIset(:,3);
meanSecondodd(1,:)=otherROIset(:,3);
meanThirdeven(1,:)=oneROIset(:,4);
meanThirdodd(1,:)=otherROIset(:,4);
meanFourtheven=0;
meanFourthodd=0;
meanFiftheven=0;
meanFifthodd=0;
elseif numberofROIs==4
meanFirsteven(1,:)= oneROIset(:,2);
meanFirstodd(1,:)=otherROIset(:,2);
meanSecondeven(1,:)=oneROIset(:,3);
meanSecondodd(1,:)=otherROIset(:,3);
meanThirdeven(1,:)=oneROIset(:,4);
meanThirdodd(1,:)=otherROIset(:,4);
meanFourtheven(1,:)=oneROIset(:,5);
meanFourthodd(1,:)=otherROIset(:,5);
meanFiftheven=0;
meanFifthodd=0;
elseif numberofROIs==5
meanFirsteven(1,:)= oneROIset(:,2);
meanFirstodd(1,:)=otherROIset(:,2);
meanSecondeven(1,:)=oneROIset(:,3);
meanSecondodd(1,:)=otherROIset(:,3);
meanThirdeven(1,:)=oneROIset(:,4);
meanThirdodd(1,:)=otherROIset(:,4);
meanFourtheven(1,:)=oneROIset(:,5);
meanFourthodd(1,:)=otherROIset(:,5);
meanFiftheven(1,:)=oneROIset(:,6);
meanFifthodd(1,:)=otherROIset(:,6);
end





figure;
subplot(5,1,1);
plot(meanFirsteven)
hold on
plot(meanFirstodd)
subplot(5,1,2);
plot(meanSecondeven)
hold on
plot(meanSecondodd)
subplot(5,1,3);
plot(meanThirdeven)
hold on
plot(meanThirdodd) 
subplot(5,1,4);
plot(meanFourtheven)
hold on
plot(meanFourthodd)
subplot(5,1,5);
plot(meanFiftheven)
hold on
plot(meanFifthodd)


Yout1=0;
Yout2=0;
Yout3=0;
Yout4=0;
Yout5=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if numberofROIs>=1
if mean(meanFirsteven)>mean(meanFirstodd)
    high1=meanFirsteven;
    low1=meanFirstodd;
else
    high1=meanFirstodd;
    low1=meanFirsteven;
end
reg = polyfit(low1(1,:),high1(1,:),1);
a=reg(1);
b=reg(2);
controlfit =a*low1+b;
for all=1:numel(high1(1,:))
normdata1(1,all)=(high1(1,all)-controlfit(1,all))/controlfit(1,all);
normdata1(1,all)=normdata1(1,all)*100;
end
X=(1:numel(normdata1)).';
Y=normdata1.';
Yout1=msbackadj(X,Y,'WindowSize', 200,'StepSize', 200)

figure
subplot(5,1,1);
plot(normdata1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if numberofROIs>=2
if mean(meanSecondeven)>mean(meanSecondodd)
    high1=meanSecondeven;
    low1=meanSecondodd;
else
    high1=meanSecondodd;
    low1=meanSecondeven;
end
reg = polyfit(low1(1,:),high1(1,:),1);
a=reg(1);
b=reg(2);
controlfit =a*low1+b;
for all=1:numel(high1(1,:))
normdata2(1,all)=(high1(1,all)-controlfit(1,all))/controlfit(1,all);
normdata2(1,all)=normdata2(1,all)*100;
end
X=(1:numel(normdata2)).';
Y=normdata2.';
Yout2=msbackadj(X,Y,'WindowSize', 200,'StepSize', 200)

subplot(5,1,2);
plot(normdata2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if numberofROIs>=3
if mean(meanThirdeven)>mean(meanThirdodd)
    high1=meanThirdeven;
    low1=meanThirdodd;
else
    high1=meanThirdodd;
    low1=meanThirdeven;
end
reg = polyfit(low1(1,:),high1(1,:),1);
a=reg(1);
b=reg(2);
controlfit =a*low1+b;
for all=1:numel(high1(1,:))
normdata3(1,all)=(high1(1,all)-controlfit(1,all))/controlfit(1,all);
normdata3(1,all)=normdata3(1,all)*100;
end
X=(1:numel(normdata3)).';
Y=normdata3.';
Yout3=msbackadj(X,Y,'WindowSize', 200,'StepSize', 200)

subplot(5,1,3);
plot(normdata3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if numberofROIs>=4
if mean(meanFourtheven)>mean(meanFourthodd)
    high1=meanFourtheven;
    low1=meanFourthodd;
else
    high1=meanFourthodd;
    low1=meanFourtheven;
end
reg = polyfit(low1(1,:),high1(1,:),1);
a=reg(1);
b=reg(2);
controlfit =a*low1+b;
for all=1:numel(high1(1,:))
normdata4(1,all)=(high1(1,all)-controlfit(1,all))/controlfit(1,all);
normdata4(1,all)=normdata4(1,all)*100;
end
X=(1:numel(normdata4)).';
Y=normdata4.';
Yout4=msbackadj(X,Y,'WindowSize', 200,'StepSize', 200)

subplot(5,1,4);
plot(normdata4);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if numberofROIs>=5
if mean(meanFiftheven)>mean(meanFifthodd)
    high1=meanFiftheven;
    low1=meanFifthodd;
else
    high1=meanFifthodd;
    low1=meanFiftheven;
end
reg = polyfit(low1(1,:),high1(1,:),1);
a=reg(1);
b=reg(2);
controlfit =a*low1+b;
for all=1:numel(high1(1,:))
normdata5(1,all)=(high1(1,all)-controlfit(1,all))/controlfit(1,all);
normdata5(1,all)=normdata5(1,all)*100;
end
X=(1:numel(normdata5)).';
Y=normdata5.';
Yout5=msbackadj(X,Y,'WindowSize', 200,'StepSize', 200)

subplot(5,1,5);
plot(normdata5);

end


figure
subplot(5,1,1);
plot(Yout1)
subplot(5,1,2);
plot(Yout2)
subplot(5,1,3);
plot(Yout3)
subplot(5,1,4);
plot(Yout4)
subplot(5,1,5);
plot(Yout5)

min([Yout1(100:end), Yout2(100:end), Yout3(100:end), Yout4(100:end), Yout5(100:end)])
max([Yout1(100:end), Yout2(100:end), Yout3(100:end), Yout4(100:end), Yout5(100:end)])


