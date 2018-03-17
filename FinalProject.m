% Mousebrain

close all

pathName=uigetdir;
% pathName='/Users/jasminepathan/Desktop/Matlab/Matlab-2018_jasminepathan/mouse_brain/HABP/FLOX/localized/';
for i=1:5
    for j=1:3 
        figure
        fileName=strcat('flox',num2str(i),' cortex',num2str(j),'.TIF')
        fullFileName=strcat(pathName,fileName); % open file
        img=imread(fullFileName,1);
        origimg=double(img(:, :, 2)); % always use channel 2
        croppedimg=origimg; 
        figure(1) 
        imagesc(croppedimg); colormap(gray); 
        % crop bad regions
        isdone='x'; r=[]; c=[];
        while ~strcmp(isdone, 'q')
            [c,r]=ginput(2);
            if ~isempty(r) && sum(r>0) && sum(c>0)
              croppedimg(round(r(1)):round(r(2)), round(c(1)):round(c(2)))=NaN;
            end
            imagesc(croppedimg); colormap(gray); 
            tmp=input('press q to finish, any key otherwise ... ', 's');
            isdone = tmp;
            imagesc(croppedimg); colormap(gray); 
            figure(2)
            subplot(2,2,1) 
            imagesc(origimg); % display original image
            subplot(2,2,2)
            imagesc(croppedimg); % display cropped image
            subplot(2,2,4)
            hist(origimg(:)); % display histogram
            thr=129; % change threshold here accordingly
            imgT=origimg(:);
            imgT(imgT<=thr)=0;
            imgT(imgT>thr)=1;
            imgT=reshape(imgT, size(origimg));
            numOverThresholds=nnz(imgT);
            numPixels=length(find(~isnan(imgT)));
            % ask the user if they want to change the thr
            area=100-numOverThresholds/numPixels*100; % calculate percentage of area stained
            disp(strcat(fileName,',',num2str(area))) % log the area and the corresponding filename into csv format
            subplot(2,2,3)
            imagesc(imgT); % display values below threshold
            %imwrite(Figure(2),strcat('threshold',fileName))
        end   
    end
end