%% Setup
%9/1/19
clear all;  
clc;
cd /project/psychimg3/Reagan/Top/offMagnetData/PHQ9

%Correlation bettween education and score?

%% Setting variables

[numphq9Data,textphq9Data,rawphq9Data] = xlsread('phq9_8.28.19.xlsx');%read in the CogState file

%PArticipant Type
TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';%TOP
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';%PLB
AllParticipants=sort(vertcat(TopParticipantList,PlaceboParticipantList));

%Making the data usable
partNumb = cell2mat(rawphq9Data(2:end,1));
partNumb2 = str2num(partNumb(:,5:end));

%THIS is the usable dataset
TopNumphq9Data = [partNumb2 numphq9Data];

%% Pruning

%only using participants that have completed 2 scans
nonUsableParticipantsINDEX=find(~ismember(TopNumphq9Data(:,1),AllParticipants));
TopNumphq9Data(nonUsableParticipantsINDEX,:)=[];

%184 only has screening - idk why
index184=find(TopNumphq9Data(:,1)==184);
TopNumphq9Data(index184,:)=[];

RemoveTheseVisits=[2,3,4,5,6,8,9,11,12];
RemoveTheseVisitsINDEX=find(ismember(TopNumphq9Data(:,2),RemoveTheseVisits));
TopNumphq9Data(RemoveTheseVisitsINDEX,:)=[];

%% Prepping the structs

phq9Struct1.Screening = [];phq9Struct1.week14 = [];
phq9Struct1.week24 = [];phq9Struct1.week36 = [];
phq9Struct1NAMES = fieldnames(phq9Struct1);

%Top
TopPlbPhq9Struct1.TopAtScreening = [];TopPlbPhq9Struct1.TopAtWeek6 = [];
TopPlbPhq9Struct1.TopAtWeek14 = [];
%PLB
TopPlbPhq9Struct1.PlbAtScreening = [];TopPlbPhq9Struct1.PlbAtWeek6 = [];
TopPlbPhq9Struct1.PlbAtWeek14 = [];

TopPlbPhq9Struct1NAMES = fieldnames(TopPlbPhq9Struct1);



%% Visits

visitList=[1,7,10];

%Struct for Visit
for ii = 1:length(visitList)
    INDEX = find(TopNumphq9Data(:,2)==visitList(ii));
    phq9Struct1.(phq9Struct1NAMES{ii}) = TopNumphq9Data(INDEX,:);
end

%% Separating between top and PLB

TopOrPlb=[0,1];
count=1;

%Top or PLB secific structures/matracies
for jj = 1:length(TopOrPlb)
    for ii = 1:length(visitList)
        
        if jj == 1 %TOP
            topVisitINDEX = find(ismember(phq9Struct1.(phq9Struct1NAMES{ii})(:,1),TopParticipantList));
            TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{count}) = phq9Struct1.(phq9Struct1NAMES{ii})(topVisitINDEX,:);
            count = count +1;
        elseif jj == 2 %PLB
            PlbVisitINDEX = find(ismember(phq9Struct1.(phq9Struct1NAMES{ii})(:,1),PlaceboParticipantList));
            TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{count}) = phq9Struct1.(phq9Struct1NAMES{ii})(PlbVisitINDEX,:);
            count = count +1;
        end
    end
end

%% Means, std, and analyses

%For Means
phq9DataHeadersMeans = {...
    
    'ReducedPleasure','Down','BetterOffDead','Tired','appetite',...
    'NegativeSelf','BadConcentration','Slow','BetterOffDead','All1s',...
    'All2s','All3s','Total','SumLifeDifficulty',...
    'PlbReducedPleasure','PlbDown','PlbBetterOffDead','PlbTired','PlbAppetite',...
    'PlbNegativeSelf','PlbBadConcentration','PlbSlow','PlbBetterOffDead','PlbAll1s',...
    'PlbAll2s','PlbAll3s','PlbTotal','PlbSumLifeDifficulty'};

%For SEMs
phq9DataHeadersSEMS = {...
    
    'ReducedPleasure','Down','BetterOffDead','Tired','appetite',...
    'NegativeSelf','BadConcentration','Slow','BetterOffDead','All1s',...
    'All2s','All3s','Total','SumLifeDifficulty',...
    'PlbReducedPleasure','PlbDown','PlbBetterOffDead','PlbTired','PlbAppetite',...
    'PlbNegativeSelf','PlbBadConcentration','PlbSlow','PlbBetterOffDead','PlbAll1s',...
    'PlbAll2s','PlbAll3s','PlbTotal','PlbSumLifeDifficulty'};

VisitTypeRows = {'VisitType';'Screening';'Week6';'Week14'};

phq9NumDataMEANSall=[];phq9NumDataSEMall=[];

for ii=1:(length(TopPlbPhq9Struct1NAMES)/2)
    
    %Means
    TopMean=nanmean(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii})(:,5:18));
    PlbMean=nanmean(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii+3})(:,5:18));
  
    %Means
    phq9NumDataMEANS=[];
    phq9NumDataMEANS = [TopMean,PlbMean];
    phq9NumDataMEANSall = vertcat(phq9NumDataMEANSall,phq9NumDataMEANS);
    phq9DataHeadersMeans = vertcat(phq9DataHeadersMeans,num2cell(phq9NumDataMEANS));
    
    %SEM
    TopSEM=(nanstd(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii})(:,5:18)))/sqrt(length(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii})(:,5:18)));
    PlbSEM=(nanstd(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii+3})(:,5:18)))/sqrt(length(TopPlbPhq9Struct1.(TopPlbPhq9Struct1NAMES{ii+3})(:,5:18)));
    
    %SEM
    phq9NumDataSEM=[];
    phq9NumDataSEM = [TopSEM,PlbSEM];
    phq9NumDataSEMall = vertcat(phq9NumDataSEMall,phq9NumDataSEM);
    phq9DataHeadersSEMS = vertcat(phq9DataHeadersSEMS,num2cell(phq9NumDataSEM));

    
    %ttest2()
end

%MEANS
phq9MeansTable=[VisitTypeRows,phq9DataHeadersMeans];

%SEM
phq9SEMTable=[VisitTypeRows,phq9DataHeadersSEMS];

%ages need to be changed








