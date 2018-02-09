
for k=1:10 %number of kids in the study
    kid10(k,:)=[2:7]+randn(1,6);
end
subplot(1, 2, 1)
imagesc(kid5+1);
colormap(gray)
subplot(1, 2, 2);
image(kid10+1); colormap(gray(14))