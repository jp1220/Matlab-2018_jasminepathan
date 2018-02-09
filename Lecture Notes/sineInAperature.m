% SineInAperture
amp=1;
sf=6;
rad=pi; %change rad will change size of circle
x=linspace(-pi,pi,100);

sinewave=sin(x*sf);
oneM=ones(size(sinewave));
sinewave2D=amp*(oneM'*sinewave);
sinewave2D_scaled=((sinewave2D+1)*127.5)+1;
imagesc(sinewave2D_scaled); %imagesc scales it, image is the manual way to do it
colormap(gray);

%does same thing as for loop below but doing 
%point wise multiplcation instead

[X,Y]=meshgrid(linspace(-pi,pi,100));
ind=find(X.^2+Y.^2>rad^2);
sinewave2D_scaled(ind)=100; 
    %change newave2D_scaled changed the square around the circle


%%build the array
naps=2;
sep=50;
bigMatSize=[(naps+1)*sep]+[length(x)*naps]
bigMat=128.5*ones(bigMatSize);
startpt=[sep (sep*2)+length(x)];
for i=1:naps
    for j=1:naps
bigMat(startpt(i):startpt(i)+length(x)-1, startpt(j):startpt(j)+length(x)-1)= ...
sinewave2D_scaled;
    end
end
imagesc(bigMat);










