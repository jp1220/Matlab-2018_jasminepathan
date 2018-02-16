%Q4.1
%%A
matA(1:2,1:5)=1;
matA(3:5,1:5)=2;
matA
%%B
matB=zeros(4,5);
matB(1:4,1:2)=1;
matB(1:4,5)=1;
matB
%%C
matC=ones(6,5);
matC(2:4,2:3)=0;
matC
%%D
matD=zeros(5);
for j=1:5;
    matD(:,j)=1:5;
end;
matD
%%E
matE=ones(6);
for i=1:length(matE);
    for j=1:length(matE);
        if j>=i
            matE(i,j)=2;
        end
    end
end
matE
%%F
matF=zeros(5);
for j=1:5;
    matF(:,j)=((j-1)*5);
end;
matF
%%G
matG=zeros(5);
for i=1:5;
    for j=1:5; 
        matG(i,j)=5*(j-1)+i;
    end
end
matG
%%H
matH=ones(8);
for j=1:8;
    if mod(j,2)==0
        matH(:,j)=0;
    end
end
matH
%%I
matI=zeros(8);
for i=1:8;
    for j=1:8;
        if mod(i,2)==1 && mod(j,2)==1 && i==j
           matI(i,j)=1;
        end
    end
end
matI
%%J
matJ=zeros(5);
for i=1:5
    for j=1:5
        matJ(i,j)=(i-1)+(j-1);
    end;
end;
matJ
%%K
matK=zeros(5);
for i=1:5;
    for j=1:5;
        matK(i,j)=i*j;
    end;
end;
matK
%%L
matL=zeros(5);
for i=1:5;
    for j=1:5;
    matL(i,j)=5*(i-1)+j;
    end;
end;
matL

%Q4.2
%%a
mat1=zeros(3,3,3);
mat1(2,2,2)=1;
mat1
%%b
mat2=zeros(5,5,5);
mat2(2:4,2:4,2:4)=1;
mat2

%Q4.3
%%a
mat=rand(4,3)
mat(3,2)
mat(7)
%or
sub2ind([4,3],3,2)
%Q4.4
%%a
x=5;
if x>0
    disp('x is positive')
elseif x<0
    disp('x is negative')
end

%%b
x=5
if x<2 || x>pi
    disp('x is either less than 2 or greater than pi')
end
%%c
x=5
y=2
z=5
if (x>2 && y<4) || z==0
    disp('either x is greater than 2 and y is less than 4 or z is equal to zero')
end

%Q4.5
roll=ceil(6*rand(1,2));
numrolls=1;
while roll(1)~=1 || roll(2)~=1
    roll=ceil(6*rand(1,2));
    numrolls=numrolls+1;
end
disp('snake eyes')
disp(numrolls)