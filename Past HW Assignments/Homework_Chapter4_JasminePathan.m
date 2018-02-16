%% Homework Chapter 4
 
%% Q 4.1: Making matrices
 
% Create the following matrices without typing in the numbers by hand:

% mat1=[5     0     0     0     0; ...
%      0    10     0     0     0; ...
%      0     0    15     0     0; ...
%      0     0     0    20     0; ...
%      0     0     0     0    25];
 
mat1=zeros(5);
for i=1:5;
    for j=1:5;
        if i==j
            mat1(i,j)=(i*5);
        end
    end
end
mat1

%   mat2=[5     5     5     5     5; ...
%     10    10    10    10    10; ...
%     15    15    15    15    15; ...
%     20    20    20    20    20; ...
%     25    25    25    25    25];

mat2=ones(5);
for i=1:5
        mat2(i,:)=i*5;
end
mat2

% mat3=[4     3     2     1     0; ...
%      9     8     7     6     5; ...
%     14    13    12    11    10; ...
%     19    18    17    16    15; ...
%     24    23    22    21    20];
mat3=zeros(5);
for i=1:5
    for j=1:5
        mat3(i,j)=i*5-j;
    end
end
mat3

% mat4=[1     2     3     4     5; ...
%      6     7     8     9    10; ...
%     11    12    13    14    15; ...
%     16    17    18    19    20];

mat4=zeros(4,5);
for i=1:4
    for j=1:5
        mat4(i,j)=5*(i-1)+j;
    end
end
mat4

% mat5=[19    18    17    16    15; ...
%     14    13    12    11    10; ...
%      9     8     7     6     5; ...
%      4     3     2     1     0]; ...

mat5=zeros(4,5);
for i=1:4
        mat5(i,:)=(i*5)-[1:5];
end
mat5=flip(mat5);
mat5
    
% mat6=[0     0     0     0     0; ...
%     10    10    10    10    10; ...
%     20    20    20    20    20; ...
%     30    30    30    30    30];

mat6=zeros(4,5);
for i=1:4
    mat6(i,:)=(i-1)*10;
end
mat6

% mat7=[0     1     0     1     0; ...
%      1     0     1     0     1; ...
%      0     1     0     1     0; ...
%      1     0     1     0     1];

mat7=zeros(4,5);
for i=1:4
    for j=1:5
        if mod(i+j,2)==1
            mat7(i,j)=1;
        end
    end
end
mat7
        
%% Q4.2: Indexing, matrices, length and for
%You run an experiment and the data is collected into the following 3D matrix

mat=zeros(4,5,2);

mat(:,:,1) = [9    16    16    18     4;
     6    16    11    11     6;
    10    13     7    12     9;
    10     8    19    12     5];

mat(:,:,2) = [17     5     9     9    12;
     4     9     4     2     5;
     5     6    18     5    12;
     3    18    20     8    14];

% The rows represent repeated measurements,the columns represent subjects, 
% and the 3rd dimension represents whether the subject had drunk a cup of tea before the experiment.
% So each subject did the experiment 8 times,four times with a cup of tea, four times without.

% a) Find out how many scores there are greater or 
% equal to 15.
scores=0;
for i=1:4
    for j=1:5
        for k=1:2
            if mat(i,j,k)>=15
                scores=scores+1;
            end
        end
    end
end
scores
                
% b) Find out how many scores greater or equal to 15 
% there were among people who didn’t get the cup of tea.
    %assuming mat(:,:,1) was the cup of tea treatment
ScoresNoTea=0;
for i=1:4
    for j=1:5
        if mat(i,j,2)>=15
            ScoresNoTea=ScoresNoTea+1;
        end
    end
end
ScoresNoTea

%c) Set all the values less than or equal to 4 to NaN.
for i=1:4
    for j=1:5
        for k=1:2
            if mat(i,j,k)<=4
                mat(i,j,k)=NaN;
            end
        end
    end
end
mat

% d) Calculate the mean for each subject (not including values less than or equal to 4).
% If you feel very brave do it without using nonanmean from the github account
nanmean(nanmean(mat),3)

% e) write a script where you go through each column (subject) of data, and display for each subject
% (i) how many NaN there are in that subject’s data
nanPerSubject=zeros(1,5);
for i=1:4
    for j=1:5
        for k=1:2
            if isnan(mat(i,j,k))
                nanPerSubject(1,j)=nanPerSubject(1,j)+1;
            end
        end
    end
end
nanPerSubject              
% (ii) how many values there are that are greater or equal to 15.
values15orGreater=zeros(1,5);
for i=1:4
    for j=1:5
        for k=1:2
            if (mat(i,j,k))>=15
                values15orGreater(1,j)=values15orGreater(1,j)+1;
            end
        end
    end
end
values15orGreater
%% Q 4.3: Logical operations, mod.
% Write a script so that if x is:
% 0, 2, 4, 6  … etc. The script prints “x is an even integer”
% 1 3 5 7  … etc. The script prints “x is an odd integer”
% A positive non-integer (e.g. 3.2) the script prints “x is a positive non-integer”
% A negative non-integer (e.g. -2.2) the script prints “x is a negative non-integer”

x=((randn*randi(10)));
if mod(x,2)==0
    disp('x is an even integer');
elseif mod(x,2)==1
    disp('x is an odd integer');
elseif x>0
    disp('x is a positive non-integer');
else
    disp('x is a negative non-integer');
end
x

%% Q 4.4: While

% Write a script that on each loop rolls four dice and displays the sum of the four dice. 
% The program should count the number of rolls until the sum of the four dice is equal to 20.

roll=ceil(6*rand(1,4));
numrolls=1;
while sum(roll)~=20
    roll=ceil(6*rand(1,4));
    numrolls=numrolls+1;
end
SumDice=sum(roll)
NumberRolls=numrolls
	 