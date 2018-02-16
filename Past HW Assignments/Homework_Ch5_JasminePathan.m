%% Ch5 Homework
% 5.1
clear all
flagsize=15;
saltire=zeros(flagsize);

for i=1:flagsize
    saltire(i, i)=1;
    saltire((flagsize+1)-i, i)=1;
end

figure(1)
image(saltire+1)
cmap=[0,0,1;1,1,1];
colormap(cmap)

figure(2)
image(saltire+1)
cmap= [1,0,0;1,1,1];
colormap(cmap)

george=zeros(flagsize);
george(ceil(flagsize/2), :)=1;
george(:,ceil(flagsize/2))=1;
figure(3)
image(george+1)
cmap=[ 1 1 1 ; 1 0 0];
colormap(cmap)

union=(saltire+(2*george))+1;
union(union>3)=3;
figure(4)
image(union)
cmap(1, :)= [0,0,1];
cmap(2, :)= [1,0,0];
cmap(3, :)= [1,0,0];
colormap(cmap)

bars=[ceil(flagsize/2)-1 ceil(flagsize/2)+1];
union(bars, :)=union(bars, :)+3;
union(:,bars)=union(:, bars)+3;
union(union>6)=union(union>6)-3; 
union(ceil(flagsize/2), :)=6;
union(:,ceil(flagsize/2))=6;
figure(5)
image(union)
cmap(4, :)= [1,1,1];
cmap(5, :)= [1,1,1];
cmap(6, :)= [1,0,0];
colormap(cmap)

for i=1:flagsize
    for j=1:flagsize
        if i==j-1 || j==i-1 || i==j+1 || j==i+1 
            if union(i, j)<6
                union(i, j)=5;
                union(i, (flagsize+1)-j)=5;
            end
        end
    end
end

figure(6)
image(union)
colormap(cmap)
axis off; axis equal
%% 5.2
ntrials=30;
durtrial=5*1000;
timevec=0:2:durtrial*ntrials;
data=sin((2*pi*timevec)/(durtrial))+.1*randn(size(timevec));
plot(timevec, data, '-')
% a)
firstHalfSec=[];
repeatedVec=1:1:251;
for i=1:30
    firstHalfSec=[firstHalfSec,repeatedVec+((i-1)*2500)];
end
firstHalfSec
firstHalfSecData=data(firstHalfSec);
mean(firstHalfSecData)
% b)
interval=[];
repeatedVec2=1000:1:1251;
for j=1:30
    interval=[interval,repeatedVec2+((j-1)*2500)];
end
intervalData=data(interval);
mean(intervalData)
% c)
timePoints=find(data>0.9);
% d)
timePoints=find(data>0.7 & data<0.8);
%% 5.3
%Sam Lin collects data on 70 rats. 20 of them were duds and their data were thrown away. 
ratID=1:70; ratID=ratID(randperm(length(ratID))); ratID=sort(ratID(1:50)); 
%On the remaining rats he collects 10000 trials, and he calculates the 
% correct across each bin of 100 trials.
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps));
per=Y+randi(10, size(Y))-5;
per(per>100)=100; per(per<0)=0;
% a)
image(per')
cmap=gray(100);
colormap(cmap)
% b)

cmap(90:100,:) = 1;
cmap(1:10,:) = 0;
colormap(cmap)
% c)
trials=per(60:70,:); 
trialsAbove66=trials>66;
ratsTrialsAbove66=sum(trialsAbove66);
numRatsTrialsAbove66=nnz(ratsTrialsAbove66)
% d)
ratsTrialsAbove66=ratsTrialsAbove66>0;
% e)
for i=1:100
    row=per(i,:);
    trialsAbove80=row>80;
    numRatsTrialsAbove80=nnz(trialsAbove80);
    if numRatsTrialsAbove80>=40
        disp(num2str(i));
        break
    end
end
% f)
per(56:76,2:2:50)=NaN;
