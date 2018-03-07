% Mousebrain
clear
close all
inputImagesPathName=uigetdir(pwd,'Input Images');
cd(inputImagesPathName);
%inputImagesPathName='mouse_brain/HABP/FLOX/localized/';
thresholdImagesPathName='thresholdImages/';
outputCsvFileName='areas.csv';
% ask for input continue from where you left off or start over?
cont='';
while ~strcmp(cont,'n') && ~strcmp(cont, 'y')
    cont=input(strcat('\nDo you want to continue where you left off?\n', ...
        'WARNING: This will delete all output files! Enter y/n: '), 's');
end
i_start=1; % default first file number
j_start=1; % default first file number
syms outputCsvFile; % placeholder for output file
if cont=='n' % start over
    delete(outputCsvFileName); % delete existing output file if any
    rmdir(thresholdImagesPathName, 's') % delete output threshold folder if any
    outputCsvFile=fopen(outputCsvFileName,'w'); % create new file with write permissions
else % continue where left off
    % Get the name of last file that was analyzed from the CSV file
    readCsvFile=fopen(outputCsvFileName,'r'); % read current csv file
    allLines=textscan(readCsvFile,'%s %s','delimiter',',');
    allLines=allLines{1};
    lastFileName=allLines(end); % last line of CSV file
    twoNumbersInLastFileName=regexp(lastFileName,'\d*','Match');
    i_start=str2double(twoNumbersInLastFileName{1}{1}); % extract numbers from last file
    j_start=str2double(twoNumbersInLastFileName{1}{2});
    fclose(readCsvFile);
    % determine name of the next file since we're continuing from there
    j_start=j_start+1;
    if j_start==4 % maximum of cortex images+1
        i_start=i_start+1;
        j_start=1;
    end
    if i_start==6 % maximum of FLOX images+1
        fprintf('\n\n============Finished!============')
        return
    end
    outputCsvFile=fopen(outputCsvFileName,'a'); % append to existing file
end
if ~exist(thresholdImagesPathName,'dir')
    mkdir(thresholdImagesPathName); % Create new folder for threshold images if it doesn't exist
end

% Start analysis for each file
for i=i_start:5
    for j=j_start:3
        fileNameWithoutExtension=strcat('flox',num2str(i),' cortex',num2str(j));
        fileName=strcat(fileNameWithoutExtension,'.TIF');
        fprintf('\n\nCurrent File: %s\n', fileName);
        fullFileName=strcat(inputImagesPathName,fileName);
        img=imread(fullFileName,1); % open image file
        origimg=double(img(:, :, 2)); % always use channel 2
        croppedimg=origimg; 
        figure(1); imagesc(croppedimg); colormap(gray); 
        % crop bad regions
        isdone='x'; r=[]; c=[];
        while ~strcmp(isdone, 'q')
            [c,r]=ginput(2);
            if ~isempty(r) && sum(r>0) && sum(c>0)
              croppedimg(round(r(1)):round(r(2)), round(c(1)):round(c(2)))=NaN;
            end
            isdone=input('Press q to finish, any key otherwise... ', 's');
            if isdone=='q'
                imagesc(croppedimg); colormap(gray);
                thresholdFigure=figure(2);
                subplot(2,2,1); imagesc(origimg); % display original image
                subplot(2,2,2); imagesc(croppedimg); % display cropped image
                subplot(2,2,4); hist(origimg(:)); % display histogram
                thr=129; % change threshold here accordingly
                imgT=origimg(:);
                imgT(imgT<=thr)=0; imgT(imgT>thr)=1;
                imgT=reshape(imgT, size(origimg));
                numOverThresholds=nnz(imgT);
                numPixels=length(find(~isnan(imgT)));
                subplot(2,2,3); imagesc(imgT); % display values below threshold
                area=100-numOverThresholds/numPixels*100; % calculate percentage of area stained
                fprintf('Area: %s%%',num2str(area)); % display the computed area
                fprintf(outputCsvFile,'%s,%s\n',fileName,num2str(area)); % print it to the output file too
                saveas(thresholdFigure, strcat(thresholdImagesPathName, ...
                    fileNameWithoutExtension,'_threshold.bmp')); % save threshold figure
            end
        end
    end
    j_start=1; % reset j so that the next time i increments, j starts at 1
end
fclose(outputCsvFile);
fprintf('\n\n============Finished!============\n');
