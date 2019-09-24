%% Setup
%9/1/19
clear all;  
clc;
cd /project/psychimg3/Reagan/Top/offMagnetData/DrinkingData


%% Setting variables

[numDrinkingData,textDrinkingData,rawDrinkingData] = xlsread('Top_DrinkingData_8.23.19.xlsx');%read in the CogState file

%PArticipant Type
TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';%TOP
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';%PLB

TopDrinkingDataStruct1.Screening = [];TopDrinkingDataStruct1.BaseLine = [];
TopDrinkingDataStruct1.Visit7or8 = [];TopDrinkingDataStruct1.Visit10 = [];
TopDrinkingDataStruct1NAMES = fieldnames(TopDrinkingDataStruct1);

%Top
TopDrinkingDataStruct2.TopAtScreening = [];TopDrinkingDataStruct2.TopAtBaseLine = [];
TopDrinkingDataStruct2.TopAtVisit7or8 = [];TopDrinkingDataStruct2.TopAtVisit10 = [];
%PLB
TopDrinkingDataStruct2.PlbAtScreening = [];TopDrinkingDataStruct2.PlbAtBaseLine = [];
TopDrinkingDataStruct2.PlbAtVisit7or8 = [];TopDrinkingDataStruct2.PlbAtVisit10 = [];

TopDrinkingDataStruct2NAMES = fieldnames(TopDrinkingDataStruct2);



%% Making the data usable
usableRows = length(numDrinkingData)+1;
partNumb = cell2mat(rawDrinkingData(2:usableRows,1));
partNumb2 = str2num(partNumb(:,5:end));

%THIS is the usable dataset
TopDrinkingData = [partNumb2 numDrinkingData];

%%
visitList=[0,1,7,10];

%Struct for Visit
for ii = 1:length(visitList)
    INDEX = find(TopDrinkingData(:,2)==visitList(ii));
    TopDrinkingDataStruct1.(TopDrinkingDataStruct1NAMES{ii}) = TopDrinkingData(INDEX,:);
end

TopOrPlb=[0,1];
count=1;

%Top or PLB secific structures/matracies
for jj = 1:length(TopOrPlb)
    for ii = 1:length(visitList)
        
        if jj == 1 %TOP
            topVisitINDEX = find(ismember(TopDrinkingDataStruct1.(TopDrinkingDataStruct1NAMES{ii})(:,1),TopParticipantList));
            TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{count}) = TopDrinkingDataStruct1.(TopDrinkingDataStruct1NAMES{ii})(topVisitINDEX,:);
            count = count +1;
        elseif jj == 2 %PLB
            PlbVisitINDEX = find(ismember(TopDrinkingDataStruct1.(TopDrinkingDataStruct1NAMES{ii})(:,1),PlaceboParticipantList));
            TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{count}) = TopDrinkingDataStruct1.(TopDrinkingDataStruct1NAMES{ii})(PlbVisitINDEX,:);
            count = count +1;
        end
    end
end


%For Means
DrinkingDataHeadersMeans = {'TopAvg#Drinks','Top%DrinkDays','Top%HeavyDays','PlbAvg#Drinks','Plb%DrinkDays','Plb%HeavyDays'};
%For SEMs
DrinkingDataHeadersSEMS = {'TopAvg#DrinksSEMS','Top%DrinkDaysSEMS','Top%HeavyDaysSEMS','PlbAvg#DrinksSEMS','Plb%DrinkDaysSEMS','Plb%HeavyDaysSEMS'};

VisitTypeRows = {'VisitType';'Screening';'BaseLine';'Visit7Or8';'Visit10'};

DrinkingNumDataMEANSall=[];DrinkingNumDataSEMall=[];

for ii=1:(length(TopDrinkingDataStruct2NAMES)/2)
    
    %Means
    TopMean=nanmean(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii})(:,3:5));
    PlbMean=nanmean(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii+4})(:,3:5));
  
    %Means
    DrinkingNumDataMEANS=[];
    DrinkingNumDataMEANS = [TopMean,PlbMean];
    DrinkingNumDataMEANSall = vertcat(DrinkingNumDataMEANSall,DrinkingNumDataMEANS);
    DrinkingDataHeadersMeans = vertcat(DrinkingDataHeadersMeans,num2cell(DrinkingNumDataMEANS));
    
    %SEM
    TopSEM=(nanstd(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii})(:,3:5)))/sqrt(length(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii})(:,3:5)));
    PlbSEM=(nanstd(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii+4})(:,3:5)))/sqrt(length(TopDrinkingDataStruct2.(TopDrinkingDataStruct2NAMES{ii+4})(:,3:5)));
    
    %SEM
    DrinkingNumDataSEM=[];
    DrinkingNumDataSEM = [TopSEM,PlbSEM];
    DrinkingNumDataSEMall = vertcat(DrinkingNumDataSEMall,DrinkingNumDataSEM);
    DrinkingDataHeadersSEMS = vertcat(DrinkingDataHeadersSEMS,num2cell(DrinkingNumDataSEM));

    
    %ttest2()
end

%MEANS
drinkingMeansTable=[VisitTypeRows,DrinkingDataHeadersMeans];

%SEM
drinkingSEMTable=[VisitTypeRows,DrinkingDataHeadersSEMS];











