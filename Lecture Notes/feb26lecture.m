[~, headers]=xlsread('Psych315W18survey.csv'%file name, 'A1:AP1'%header rows);
[~,~,data]=xlsread('Psych315W18survey.csv', 'A2:AP153');
ind1=find(strcmp(headers, 'gender'));
ind2=find(strcmp(headers, 'computer'));
value_ind1=zeros(size(data,1),1);
ind1=find(strcmp,data(:,ind1), 'Female');
gender(ind1)=1;

value_ind2=Nan(size(data,1),1);
value_ind2(strcmp,data(:,ind2), 'PC')=1;
value_ind2(strcmp,data(:,ind2), 'Apple')=2;
pc=length(find(value_ind2(ind1)==1));




% didnt work for prof in class
% for d1=1:100
%     for d2=1:30
%         csvwrite('Subset315',data{d1,d2},d1,d2);
%     end
% end 

