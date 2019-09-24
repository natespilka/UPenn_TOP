%% Setup
%9/1/19
clear all;  
clc;
cd /project/psychimg3/Reagan/Top/offMagnetData/COWA

%Correlation bettween education and score?

%% Setting variables

[numCowaData,textCowaData,rawCowaData] = xlsread('cowa_8.28.19.xlsx');%read in the CogState file

%PArticipant Type
TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';%TOP
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';%PLB
AllParticipants=sort(vertcat(TopParticipantList,PlaceboParticipantList));

%Making the data usable
partNumb = cell2mat(rawCowaData(2:end,1));
partNumb2 = str2num(partNumb(:,5:end));

%THIS is the usable dataset
TopNumCowaData = [partNumb2 numCowaData];

%% Pruning

%only using participants that have completed 2 scans
nonUsableParticipantsINDEX=find(~ismember(TopNumCowaData(:,1),AllParticipants));
TopNumCowaData(nonUsableParticipantsINDEX,:)=[];

%184 only has screening - idk why
index184=find(TopNumCowaData(:,1)==184);
TopNumCowaData(index184,:)=[];

%remove the 12th column
TopNumCowaData(:,12)=[];
%% Prepping the structs

CowaStruct1.Screening = [];CowaStruct1.week14 = [];
CowaStruct1.week24 = [];CowaStruct1.week36 = [];
CowaStruct1NAMES = fieldnames(CowaStruct1);

%Top
TopPlbCowaStruct1.TopAtScreening = [];TopPlbCowaStruct1.TopAtWeek14 = [];
TopPlbCowaStruct1.TopAtWeek24 = [];TopPlbCowaStruct1.TopAtWeek36 = [];
%PLB
TopPlbCowaStruct1.PlbAtScreening = [];TopPlbCowaStruct1.PlbAtWeek14 = [];
TopPlbCowaStruct1.PlbAtWeek24 = [];TopPlbCowaStruct1.PlbAtWeek36 = [];

TopPlbCowaStruct1NAMES = fieldnames(TopPlbCowaStruct1);



%% Visits

visitList=[0,13,24,36];

%Struct for Visit
for ii = 1:length(visitList)
    INDEX = find(TopNumCowaData(:,2)==visitList(ii));
    CowaStruct1.(CowaStruct1NAMES{ii}) = TopNumCowaData(INDEX,:);
end

%% Separating between top and PLB

TopOrPlb=[0,1];
count=1;

%Top or PLB secific structures/matracies
for jj = 1:length(TopOrPlb)
    for ii = 1:length(visitList)
        
        if jj == 1 %TOP
            topVisitINDEX = find(ismember(CowaStruct1.(CowaStruct1NAMES{ii})(:,1),TopParticipantList));
            TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{count}) = CowaStruct1.(CowaStruct1NAMES{ii})(topVisitINDEX,:);
            count = count +1;
        elseif jj == 2 %PLB
            PlbVisitINDEX = find(ismember(CowaStruct1.(CowaStruct1NAMES{ii})(:,1),PlaceboParticipantList));
            TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{count}) = CowaStruct1.(CowaStruct1NAMES{ii})(PlbVisitINDEX,:);
            count = count +1;
        end
    end
end

%% Means, std, and analyses

%For Means
CowaDataHeadersMeans = {'TopAvgEDU','TopAvgTotalWords','TopAvgCorrectedScore','TopAvgPercentile','TopAvg_T','TopAvgErrors','TopAvgReps/Pers','PlbAvgEDU','PlbAvgTotalWords','PlbAvgCorrectedScore','PlbAvgPercentile','TopAvg_T','PlbAvgErrors','PlbAvgReps/Pers'};
%For SEMs
CowaDataHeadersSEMS = {'TopEduSEMS','TopTotalWordsSEMS','TopCorrectedScoreSEMS','TopPercentileSEMS','TopSEM_T','TopErrorsSEMS','TopReps/PersSEMS','PlbEduSEMS','PlbTotalWordsSEMS','PlbCorrectedScoreSEMS','PlbPercentileSEMS','PlbSEM_T','PlbErrorsSEMS','PlbReps/PersSEMS'};

VisitTypeRows = {'VisitType';'Screening';'Visit10'};

CowaNumDataMEANSall=[];CowaNumDataSEMall=[];

for ii=1:2 %only screening and visit 10
    
    %Means
    TopMean=nanmean(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii})(:,7:13));
    PlbMean=nanmean(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii+4})(:,7:13));
  
    %Means
    CowaNumDataMEANS=[];
    CowaNumDataMEANS = [TopMean,PlbMean];
    CowaNumDataMEANSall = vertcat(CowaNumDataMEANSall,CowaNumDataMEANS);
    CowaDataHeadersMeans = vertcat(CowaDataHeadersMeans,num2cell(CowaNumDataMEANS));
    
    %SEM
    TopSEM=(nanstd(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii})(:,7:13)))/sqrt(length(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii})(:,7:13)));
    PlbSEM=(nanstd(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii+4})(:,7:13)))/sqrt(length(TopPlbCowaStruct1.(TopPlbCowaStruct1NAMES{ii+4})(:,7:13)));
    
    %SEM
    CowaNumDataSEM=[];
    CowaNumDataSEM = [TopSEM,PlbSEM];
    CowaNumDataSEMall = vertcat(CowaNumDataSEMall,CowaNumDataSEM);
    CowaDataHeadersSEMS = vertcat(CowaDataHeadersSEMS,num2cell(CowaNumDataSEM));

    
    %ttest2()
end

%MEANS
CowaMeansTable=[VisitTypeRows,CowaDataHeadersMeans];

%SEM
CowaSEMTable=[VisitTypeRows,CowaDataHeadersSEMS];

%ages need to be changed








