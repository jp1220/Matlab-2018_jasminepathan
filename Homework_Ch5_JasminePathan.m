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
data=sin((2*pi* timevec)/(durtrial))+.1*randn(size(timevec));
plot(timevec, data, '-')
% a)
firstHalfSecIdx=[];
repeatedVec = 1:1:250; % First 1/2 Second, split by 2ms
for i=1:30
    firstHalfSecIdx=[firstHalfSecIdx,repeatedVec+((i-1)*2500)];
end
firstHalfSecData=data(firstHalfSecIdx);
mean(firstHalfSecData)
% b)
intervalIdx=[];
repeatedVec = 1000:1:1250; % 2-2.5 Second-th, split by 2ms
for i=1:30
    intervalIdx=[intervalIdx,repeatedVec+((i-1)*2500)];
end
intervalData=data(intervalIdx);
mean(data)
% c)
timePoints=find(data>0.9);
% d)
timePoints=find(data>0.7 & data<0.8);

% NICELY DONE!!!

%% 5.3
%Sam Lin collects data on 70 rats. 20 of them were duds and their data were thrown away. 
ratID=randperm(70); ratID=sort(ratID(1:50)); 

%On the remaining rats he collects 10000 trials, and he calculates the % correct across each bin of 100 trials.
ratID=randperm(70); ratID=sort(ratID(1:50)); 
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps));
per=Y+randi(10, size(Y))-5;
per(per>100)=100; per(per<0)=0;
image(per); colormap(gray(100));

% have another go at this now 










