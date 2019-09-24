%% Setup
%9/1/19
clear all;  
clc
cd /project/psychimg3/Reagan/Top/offMagnetData/DigitSpan

%Correlation bettween education and score?

%% Setting variables

[numDigSpanData,textDigSpanData,rawDigSpanData] = xlsread('TOP_waisds_8.28.19.xlsx');%read in the CogState file

%PArticipant Type
TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';%TOP
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';%PLB
AllParticipants=sort(vertcat(TopParticipantList,PlaceboParticipantList));

%Making the data usable
partNumb = cell2mat(rawDigSpanData(2:end,1));
partNumb2 = str2num(partNumb(:,5:end));

%THIS is the usable dataset
DigSpanNumData = [partNumb2 numDigSpanData];


%% Pruning

%only using participants that have completed 2 scans
nonUsableParticipantsINDEX=find(~ismember(DigSpanNumData(:,1),AllParticipants));
DigSpanNumData(nonUsableParticipantsINDEX,:)=[];

%184 only has screening - idk why
index184=find(DigSpanNumData(:,1)==184);
DigSpanNumData(index184,:)=[];

RemoveTheseVisits=[11,12];%removing weeks 24 and 36
RemoveTheseVisitsINDEX=find(ismember(DigSpanNumData(:,2),RemoveTheseVisits));
DigSpanNumData(RemoveTheseVisitsINDEX,:)=[];
DigSpanNumData2=DigSpanNumData;

%% Setup for mins and Max

[row, col]=find(DigSpanNumData2(:,:)==0);

for ii = 1:length(col)
    DigSpanNumData2(row(ii),col(ii))=nan;
    DigSpanNumData2(row(ii),col(ii)-1)=nan;%The number before all 1's and 0's
end

%% ScoresMatrix

scoringCols = [1, 2, 45, 81, 82];
DigSpanScores = DigSpanNumData(:,scoringCols);

%% NonStruct - analysis

%Identifying Top and Plb
AllTopINDEX=find(ismember(DigSpanScores(:,1),TopParticipantList));
DigSpanNumDataTop=DigSpanScores(AllTopINDEX,:);

AllPlbINDEX=find(ismember(DigSpanScores(:,1),PlaceboParticipantList));
DigSpanNumDataPlb=DigSpanScores(AllPlbINDEX,:);

%Means
topDigSpanAvg=mean(DigSpanNumDataTop(:,3:5));
PlbDigSpanAvg=mean(DigSpanNumDataPlb(:,3:5));

%SEM
TopSEM=(std(DigSpanNumDataTop(:,3:5))/sqrt(length(DigSpanNumDataTop(:,3:5))));
PlbSEM=(std(DigSpanNumDataPlb(:,3:5)))/sqrt(length(DigSpanNumDataPlb(:,3:5)));
    



%% Prepping the structs

DigSpanStruct1.Screening = [];DigSpanStruct1.week14 = [];
%DigSpanStruct1.week24 = [];DigSpanStruct1.week36 = [];
DigSpanStruct1NAMES = fieldnames(DigSpanStruct1);

%Top
DigSpanStruct2.TopAtScreening = [];DigSpanStruct2.TopAtWeek14 = [];
%TopPlbDigSpanStruct1.TopAtWeek24 = [];TopPlbDigSpanStruct1.TopAtWeek36 = [];
%PLB
DigSpanStruct2.PlbAtScreening = [];DigSpanStruct2.PlbAtWeek14 = [];
%TopPlbDigSpanStruct1.PlbAtWeek24 = [];TopPlbDigSpanStruct1.PlbAtWeek36 = [];

DigSpanStruct2NAMES = fieldnames(DigSpanStruct2);

%% Visits

visitList=[88,10];%,11,12];

%Struct for Visit
for ii = 1:length(visitList)
    INDEX = find(DigSpanScores(:,2)==visitList(ii));
    DigSpanStruct1.(DigSpanStruct1NAMES{ii}) = DigSpanScores(INDEX,:);
end

%% Separating between top and PLB

TopOrPlb=[0,1];
count=1;

%Top or PLB secific structures/matracies
for jj = 1:length(TopOrPlb)
    for ii = 1:length(visitList)
        
        if jj == 1 %TOP
            topVisitINDEX = find(ismember(DigSpanStruct1.(DigSpanStruct1NAMES{ii})(:,1),TopParticipantList));
            DigSpanStruct2.(DigSpanStruct2NAMES{count}) = DigSpanStruct1.(DigSpanStruct1NAMES{ii})(topVisitINDEX,:);
            count = count +1;
        elseif jj == 2 %PLB
            PlbVisitINDEX = find(ismember(DigSpanStruct1.(DigSpanStruct1NAMES{ii})(:,1),PlaceboParticipantList));
            DigSpanStruct2.(DigSpanStruct2NAMES{count}) = DigSpanStruct1.(DigSpanStruct1NAMES{ii})(PlbVisitINDEX,:);
            count = count +1;
        end
    end
end

%% Means, std, and analyses

%For Means
DigSpanDataHeadersMeans = {'ForwardScoreTop','BackwardScoreTop','TotalScoreTop','ForwardScorePlb','BackwardScorePlb','TotalScorePlb'};
%For SEMs
DigSpanDataHeadersSEMS = {'ForwardScoreTopSEM','BackwardScoreTopSEM','TotalScoreTopSEM','ForwardScorePlbSEM','BackwardScorePlbSEM','TotalScorePlbSEM'};

VisitTypeRows = {'VisitType';'Screening';'Week14'};

DigSpanNumDataMEANSall=[];DigSpanNumDataSEMall=[];

for ii=1:2 %only screening and visit 10
    
    %Means
    TopMean=nanmean(DigSpanStruct2.(DigSpanStruct2NAMES{ii})(:,3:5));
    PlbMean=nanmean(DigSpanStruct2.(DigSpanStruct2NAMES{ii+2})(:,3:5));
  
    %Means
    DigSpanNumDataMEANS=[];
    DigSpanNumDataMEANS = [TopMean,PlbMean];
    DigSpanNumDataMEANSall = vertcat(DigSpanNumDataMEANSall,DigSpanNumDataMEANS);
    DigSpanDataHeadersMeans = vertcat(DigSpanDataHeadersMeans,num2cell(DigSpanNumDataMEANS));
    
    %SEM
    TopSEM=(nanstd(DigSpanStruct2.(DigSpanStruct2NAMES{ii})(:,3:5)))/sqrt(length(DigSpanStruct2.(DigSpanStruct2NAMES{ii})(:,3:5)));
    PlbSEM=(nanstd(DigSpanStruct2.(DigSpanStruct2NAMES{ii+2})(:,3:5)))/sqrt(length(DigSpanStruct2.(DigSpanStruct2NAMES{ii+2})(:,3:5)));
    
    %SEM
    DigSpanNumDataSEM=[];
    DigSpanNumDataSEM = [TopSEM,PlbSEM];
    DigSpanNumDataSEMall = vertcat(DigSpanNumDataSEMall,DigSpanNumDataSEM);
    DigSpanDataHeadersSEMS = vertcat(DigSpanDataHeadersSEMS,num2cell(DigSpanNumDataSEM));

    
    %ttest2()
end

%MEANS
DigSpanMeansTable=[VisitTypeRows,DigSpanDataHeadersMeans];

%SEM
DigSpanSEMTable=[VisitTypeRows,DigSpanDataHeadersSEMS];

%ages need to be changed

