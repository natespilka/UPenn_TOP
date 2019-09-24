%% Setup
%9/1/19
clear all;  
clc;
cd /project/psychimg3/Reagan/Top/offMagnetData/Weight

%Correlation bettween education and score?

%% Setting variables

[numWeightData,textWeightData,rawWeightData] = xlsread('wieght_TOP_8.28.19.xlsx');%read in the CogState file

%PArticipant Type
TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';%TOP
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';%PLB
AllParticipants=sort(vertcat(TopParticipantList,PlaceboParticipantList));

%Making the data usable
partNumb = cell2mat(rawWeightData(2:end,1));
partNumb2 = str2num(partNumb(:,5:end));

%THIS is the usable dataset
TopNumWeightData = [partNumb2 numWeightData];

%% Pruning

%only using participants that have completed 2 scans
nonUsableParticipantsINDEX=find(~ismember(TopNumWeightData(:,1),AllParticipants));
TopNumWeightData(nonUsableParticipantsINDEX,:)=[];

%184 only has screening - idk why
index184=find(TopNumWeightData(:,1)==184);
TopNumWeightData(index184,:)=[];

%only columns of interest
TopNumWeightData1=TopNumWeightData(:,[1,3,12,118]); %

%% NonStruct - analysis

%Identifying Top and Plb
AllWeightTopINDEX=find(ismember(TopNumWeightData1(:,1),TopParticipantList));
AllWeightTop=TopNumWeightData1(AllWeightTopINDEX,:);

AllWeightPlbINDEX=find(ismember(TopNumWeightData1(:,1),PlaceboParticipantList));
AllWeightPlb=TopNumWeightData1(AllWeightPlbINDEX,:);

%Means
topWeightAvg=mean(AllWeightTop(:,3:4));
PlbWeightAvg=mean(AllWeightPlb(:,3:4));

%SEM
TopSEM=(std(AllWeightTop(:,3:4))/sqrt(length(AllWeightTop(:,3:4))));
PlbSEM=(std(AllWeightPlb(:,3:4)))/sqrt(length(AllWeightPlb(:,3:4)));
    

% 
% 
% %% Prepping the structs
% 
% WeightStruct1.Screening = [];WeightStruct1.week14 = [];
% %CowaStruct1.week24 = [];CowaStruct1.week36 = [];
% WeightStruct1NAMES = fieldnames(WeightStruct1);
% 
% %Top
% TopPlbWeightStruct1.TopAtScreening = [];TopPlbWeightStruct1.TopAtWeek14 = [];
% %TopPlbCowaStruct1.TopAtWeek24 = [];TopPlbCowaStruct1.TopAtWeek36 = [];
% %PLB
% TopPlbWeightStruct1.PlbAtScreening = [];TopPlbWeightStruct1.PlbAtWeek14 = [];
% %TopPlbCowaStruct1.PlbAtWeek24 = [];TopPlbCowaStruct1.PlbAtWeek36 = [];
% 
% TopPlbWeightStruct1NAMES = fieldnames(TopPlbWeightStruct1);
% 
% 
% 
% %% Visits
% 
% visitList=[0,14];%,24,36];
% 
% %Struct for Visit
% for ii = 1:length(visitList)
%     INDEX = find(TopNumCowaData(:,2)==visitList(ii));
%     WeightStruct1.(WeightStruct1NAMES{ii}) = TopNumCowaData(INDEX,:);
% end
% 
% %% Separating between top and PLB
% 
% TopOrPlb=[0,1];
% count=1;
% 
% %Top or PLB secific structures/matracies
% for jj = 1:length(TopOrPlb)
%     for ii = 1:length(visitList)
%         
%         if jj == 1 %TOP
%             topVisitINDEX = find(ismember(WeightStruct1.(WeightStruct1NAMES{ii})(:,1),TopParticipantList));
%             TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{count}) = WeightStruct1.(WeightStruct1NAMES{ii})(topVisitINDEX,:);
%             count = count +1;
%         elseif jj == 2 %PLB
%             PlbVisitINDEX = find(ismember(WeightStruct1.(WeightStruct1NAMES{ii})(:,1),PlaceboParticipantList));
%             TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{count}) = WeightStruct1.(WeightStruct1NAMES{ii})(PlbVisitINDEX,:);
%             count = count +1;
%         end
%     end
% end
% 
% %% Means, std, and analyses
% 
% %For Means
% CowaDataHeadersMeans = {'TopAvgEDU','TopAvgTotalWords','TopAvgCorrectedScore','TopAvgPercentile','TopAvg_T','TopAvgErrors','TopAvgReps/Pers','PlbAvgEDU','PlbAvgTotalWords','PlbAvgCorrectedScore','PlbAvgPercentile','TopAvg_T','PlbAvgErrors','PlbAvgReps/Pers'};
% %For SEMs
% CowaDataHeadersSEMS = {'TopEduSEMS','TopTotalWordsSEMS','TopCorrectedScoreSEMS','TopPercentileSEMS','TopSEM_T','TopErrorsSEMS','TopReps/PersSEMS','PlbEduSEMS','PlbTotalWordsSEMS','PlbCorrectedScoreSEMS','PlbPercentileSEMS','PlbSEM_T','PlbErrorsSEMS','PlbReps/PersSEMS'};
% 
% VisitTypeRows = {'VisitType';'Screening';'Visit10'};
% 
% CowaNumDataMEANSall=[];CowaNumDataSEMall=[];
% 
% for ii=1:2 %only screening and visit 10
%     
%     %Means
%     TopMean=nanmean(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii})(:,7:13));
%     PlbMean=nanmean(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii+4})(:,7:13));
%   
%     %Means
%     CowaNumDataMEANS=[];
%     CowaNumDataMEANS = [TopMean,PlbMean];
%     CowaNumDataMEANSall = vertcat(CowaNumDataMEANSall,CowaNumDataMEANS);
%     CowaDataHeadersMeans = vertcat(CowaDataHeadersMeans,num2cell(CowaNumDataMEANS));
%     
%     %SEM
%     TopSEM=(nanstd(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii})(:,7:13)))/sqrt(length(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii})(:,7:13)));
%     PlbSEM=(nanstd(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii+4})(:,7:13)))/sqrt(length(TopPlbWeightStruct1.(TopPlbWeightStruct1NAMES{ii+4})(:,7:13)));
%     
%     %SEM
%     CowaNumDataSEM=[];
%     CowaNumDataSEM = [TopSEM,PlbSEM];
%     CowaNumDataSEMall = vertcat(CowaNumDataSEMall,CowaNumDataSEM);
%     CowaDataHeadersSEMS = vertcat(CowaDataHeadersSEMS,num2cell(CowaNumDataSEM));
% 
%     
%     %ttest2()
% end
% 
% %MEANS
% CowaMeansTable=[VisitTypeRows,CowaDataHeadersMeans];
% 
% %SEM
% CowaSEMTable=[VisitTypeRows,CowaDataHeadersSEMS];
% 
% %ages need to be changed
% 
% 






