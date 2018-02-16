M=1000;
N=1000;
[X,Y]=meshgrid(linspace(-1,1,N),linspace(-1,1,M));
image=X;
image(X>-.9 & X<.9 & Y>-.4 & Y<-.2)=0.75;
image(X>-.9 & X<.9 & Y>.2 & Y<.4)=0.1;

figure(1)
clf
imagesc(X(1,:),Y(:,1),image);
colormap(gray)
axis equal
axis tight

        
rad=sqrt(x.^2+y.^2);
ang=atan2(y,x);
img=mod(ang,pi/8);
img(rad>.5)=0;
figure(1)
clf
imagesc(x(1,:),y(:,1),img);
colormap(gray(64))
axis equal
axis tight
