%paintpots
img=1:5
pp1=[0 0 0; .25 .25 .25; .5 .5 .5; .75 .75 .75; 1 1 1]
pp2=[0 0 1; 1 0 0; 0 1 0; .5 0 1; 1 0 1]
figure(1)
image(img)
colormap(pp1)
colormap(pp2)

image(img')
colormap(pp1)
colormap(pp2)

image(1:40)
colormap(hot(5))
colormap(hsv(40))
colormap(jet(40))
%winter, spring, fall... colormaps. find full list with "doc graph3d"

pp2(5,:)=[0 0 0]
image(img); colormap(pp2)

%colormaps
img=1:10;
figure(1);
pp=ones(10,3);
image(img);
colormap(pp);
axis off;

for i=1:10
    pp(1,:)=1/10
    colormap(pp)
end

%exciting colormaps
img=reshape(1:64, 8, 8);
image(img);colormap(gray(64));
axis equal;
axis off;
drawnow;

pp=rand(64,3);
for i=1:200;
    colormap(pp);
    drawnow;
end

%contrast experiment
contrast=linspace(0,1,5);
size=2:2:12;
nc=[5 6 5 6 4; 
    4 6 8 9 9;
    6 5 7 10 8;
    3 5 8 9 10;
    5 6 9 10 10;
    6 5 8 10 9];

%image(contrast,size,pc);
%colormap(gray(10));
%xlabel('contrast');
%ylabel('size');

pc=100*nc/10;
image(pc)
set(gca, 'XTick', contrast)
set(gca, 'XTickLabel', contrast)
pcmap=colormap(gray(100));
gmap(1:50, :)=0
