% Homework for Chapter 2. Due January 19th

%%Q 2.1: Replacing letters in strings
% a)
str1='A PACK OF LIES';
str1(3)='L';
str1(11)='P';
str1
% b)
str2='It`s pouring with rain';
str2(6)='r';
str2(9)='p';
str2(19)='p';
str2
% c)
str1([3,11])=['L','P']
str2([6,9,19])=['r','p','p']

%%Q 2.2: More replacing letters in strings
%Starting with the string:
str='nosey little cook';
% a) 
id1=[14,2,3,5,6:13,1,15:17];
disp(str(id1))

%%Q 2.3: Creating vectors
v=[20:-2:6];
v=linspace(20,6,8);

v=[1.1000:0.2268:3.1416];
v=linspace(1.1000,3.1416,10);

v=[20:-1:1];
v=linspace(20,1,20);

%%Q 2.4: More indexing into strings
%Starting with the following string of 20 `x`s:
str='xxxxxxxxxxxxxxxxxxxx';
% a)
vect1=[2:3:20];
str(vect1)='z';
vect2=[3:3:20];
str(vect2)='p'
% b)
vect3=[5:7];
str(vect3)='r'
% c)
str(8)
% d)
vect4=[20:-1:1];
str=str(vect4)
% e)
str([6,13,17])

%%Q 2.5: Indexing into vectors
% a)
vector=[1.2: 2.36: 20]
% b)
vector(5)
% c)
vector(end)

%%Q 2.6: Still more indexing
stimlist='hhhhhhhhhhhhhhhh';
% a)
sad_face_trials=[1,2,6,7,10,13,14,15];
happy_face_trials=[3,4,5,8,9,11,12,16];
stimlist(sad_face_trials)='s';
stimlist(happy_face_trials)='h';
stimlist
stimlist(sad_face_trials)
stimlist(happy_face_trials)
% b)
sadvect=[1:4,9:12]
happyvect=[5:8,13:16]
% how the subject categorized faces:
resplist='ssshhhshsshhsssh';
% c)
stimlisthappy=stimlist(happyvect)
resplisthappy=resplist(happyvect)
% d)
stimlist(happyvect(3))
% e)
resplist(sadvect([3,4,5]))