%Sapounas Antonios
%AEM 15172
%windrose

clear;
filename='Wind data.xlsx';
data=xlsread(filename);
data(:,5) = data(:,5)*0.51;
year_max=max(data(:,1));
year_min=min(data(:,1));
year= randi([year_min year_max-5]);
period= find(data(:,1)>=year & data(:,1)<=year+5);
data2=data(period,:);
dir=data2(:,6); %wind direction
wind_sp=data2(:,5); %wind speed
pc_name= getenv('COMPUTERNAME');
Options={'anglenorth',0,'angleeast',90,'labels',{'N(0)','E(90)','S(180)','W(270)'},'freqlabelangle',30,'radialgridnumber',16,'TitleString',{sprintf('Wind Rose %i - %i',year,year+5);''}};
[figure_handle,count,speeds,directions,Table] = WindRose(dir,wind_sp, Options);
annotation('textbox',[.73 0 0.3 0.1],'String',['Sapounas Antonios',pc_name],'EdgeColor','none');
annotation('textbox',[0 0 0.2 0.1],'String',date(),'EdgeColor','none');
season=find(data2(:,2)>=3 & data2(:,2)<=8);
most_frequent_dir= mode(data2(season,6));
fprintf('The most frequent wind direction is %d \n', most_frequent_dir)