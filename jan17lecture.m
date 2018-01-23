mat1=[1 2 ; 3 4];
mat2=[2 4; 4 5; 6 7];
mat2=[2 4; 4 5];
mat1;
mat2;
mat1*mat2;

%fake brain
TR=2;
t=1:TR:239;
brain=randn(64,64,28,120);
%happy=repmat(0,10,1);
%size(happy)
%sad=repmat(1,10,1);
%happysad=[happy; sad] %or happysad=[happy sad]'
%happysad=happysad(:);
%design=repmat(happysad, 6, 1);

design=repmat([repmat(0, 10,1); repmat(1,10,1)], 6, 1);
ROI= [20:30, 12:40, 18:23];
brain(20:30, 12:40, 18:23, find(design))=...
    brain(20:30, 12:40, 18:23, find(design))-1;
imagesc(brain(:,:,20,13));
sad=mean(brain(:,:,20, find (design)),4);
subplot(1,2,1);
imagesc(squeeze(sad));
axis equal;