NameFile = uigetfile('*.txt');
PosFile = uigetfile('*.txt');
BipolarContacts(NameFile,PosFile);
NameFile = uigetfile('*.txt');
PosFile = uigetfile('*.txt');
labelnew = importdata(NameFile);
posnew = importdata(PosFile);
Pattern = '-';
labelnew = Remove_Name_Pattern(labelnew,Pattern);

num = 0;
for i =1:length(Channels)
    if Channels(i).keep == 1 
        num = num+1;
        Chan_need(num).pos = i;
        Chan_need(num).id = Channels(i).id;
    end
end
sum =0;
for i =1:num
    for j =1:num
        if i~= j       
          TF1 = contains(labelnew,Chan_need(i).id);
          TTF1 = find(TF1,1);
          TF2 = contains(labelnew,Chan_need(j).id);
          TTF2 = find(TF2,1);
          if M(TTF1,TTF2)>10
             sum = sum+1; 
             EUdis(sum) = sqrt((posnew(TTF2,1)-posnew(TTF1,1))^2+(posnew(TTF2,2)-posnew(TTF1,2))^2+(posnew(TTF2,3)-posnew(TTF1,3))^2);
             EURMS(sum) = M(TTF1,TTF2);
          end
        end
    end
end
figure
plot(EUdis,EURMS,'r.');
        
p = polyfit(EUdis,EURMS,1);
f = polyval(p,EUdis);
plot(EUdis,EURMS,'o',EUdis,f,'-');
        
[r,p] = corr(EUdis',EURMS');