%Sapounas Antonios
%AEM 15172
%exe2

clear;
%% choose data
AEM= input('Please insert your AEM: ');
if rem(AEM,2)==0
   data=xlsread('Weibull data.xlsx','station_1');
   v=data(:,6);
  data(:,6)=data(:,6)*0.51;
year_min=min(data(:,1));
year_max=max(data(:,1));
year=randi([year_min year_max-4]);
period=find(data(:,1)>=year & data(:,1)<=year+4);
v=find(data(period,6)~=0);
spd=data(period,6);
dir=data(period,5);
else
     data=xlsread('Weibull data.xlsx','station_2'); 
     data(:,5)=data(:,5)*0.51;
year_min=min(data(:,1));
year_max=max(data(:,1));
year=randi([year_min year_max-4]);
period=find(data(:,1)>=year & data(:,1)<=year+4);
v=find(data(period,5)~=0);
spd=data(period,5);
dir=data(period,6);
end
spd=spd(spd~=0);
%% C,k
[rows,columns]=size(spd);
F=([1:rows]'-0.3)./(rows+0.4);
X=log(v);
Y=log(-log(1-F));
z=polyfit(X,Y,1);
B=z(1);
A=z(2);
k=B;
C=exp(-(A./B))*1e-3;
%% Graph
pc_name= getenv('COMPUTERNAME');
h=histfit(spd,30,'weibull');
h(1).FaceColor = [.7 0 1];
h(2).Color = [0 1 0];
annotation('textbox',[.73 0 0.3 0.1],'String',['Sapounas Antonios',pc_name],'EdgeColor','none');
annotation('textbox',[0 0 0.2 0.1],'String',date(),'EdgeColor','none');
annotation('textbox',[0.9 0.32 0.2 0.2],'String',sprintf('C=%i k=%i ',C,k),'EdgeColor','none');
title(sprintf('Weibull %i -%i',year,year+4));
xlabel('wind speed (m/s)');
ylabel('Probability');