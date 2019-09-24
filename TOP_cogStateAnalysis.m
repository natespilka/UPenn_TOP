%% Setup
%9/1/19
clear all;  
clc;
cd /project/psychimg3/Reagan/Top/offMagnetData/CogStateData

%% CogStateStruct Creation (RAW)

[numdataCogState,textdataCogState,rawdataCogState] = xlsread('CogStateAllData_TOP.xlsx');%read in the CogState file
% IDN_Matrix=rawdataCogState1(1,:);DET_Matrix=rawdataCogState1(1,:);GML_Matrix=rawdataCogState1(1,:);
% ISL_ISRL_Matrix=rawdataCogState1(1,:);OCL_Matrix=rawdataCogState1(1,:);ONB_Matrix=rawdataCogState1(1,:);

TopParticipantList = [23,68,98,106,184,196,238,263,267,284,289,314,315]';
PlaceboParticipantList = [62,125,159,202,220,264,268,283,286]';


%% pruning the trials with no integrity or were not completed

notCompleted=find(ismember(numdataCogState(:,27),1));
numdataCogState((notCompleted),:)=[];
rawdataCogState((notCompleted+1),:)=[];

noIntegrity=find(ismember(numdataCogState(:,28),1));
numdataCogState(noIntegrity,:)=[];
rawdataCogState((noIntegrity+1),:)=[];

extra062Session=find(ismember(numdataCogState(:,4),42327));
numdataCogState(extra062Session,:)=[];
rawdataCogState((extra062Session+1),:)=[];

numdataCogState(:,26:28)=[];%remove the columns of non interest
rawdataCogState(:,28:30)=[];

%% Puting data into structs

IDN_Matrix = [];DET_Matrix = [];GML_Matrix = [];
ISL_Matrix = [];OCL_Matrix = [];ONB_Matrix = [];ISRL_Matrix = [];
        
TCodeINDEX = find(ismember(rawdataCogState(1,:),'TCode'));

IDN = find(ismember(rawdataCogState(:,TCodeINDEX),'IDN'));
DET = find(ismember(rawdataCogState(:,TCodeINDEX),'DET'));
GML = find(ismember(rawdataCogState(:,TCodeINDEX),'GML'));
ISL = find(ismember(rawdataCogState(:,TCodeINDEX),'ISL'));
ISRL = find(ismember(rawdataCogState(:,TCodeINDEX),'ISRL'));
OCL = find(ismember(rawdataCogState(:,TCodeINDEX),'OCL'));
ONB = find(ismember(rawdataCogState(:,TCodeINDEX),'ONB'));

IDN_Matrix = vertcat(IDN_Matrix,rawdataCogState(IDN,:));
DET_Matrix = vertcat(DET_Matrix,rawdataCogState(DET,:));
GML_Matrix = vertcat(GML_Matrix,rawdataCogState(GML,:));
ISL_Matrix = vertcat(ISL_Matrix,rawdataCogState(ISL,:));
ISRL_Matrix = vertcat(ISRL_Matrix,rawdataCogState(ISRL,:));
OCL_Matrix = vertcat(OCL_Matrix,rawdataCogState(OCL,:));        
ONB_Matrix = vertcat(ONB_Matrix,rawdataCogState(ONB,:));


CogStateStructRAW.IDN = IDN_Matrix;
CogStateStructRAW.DET = DET_Matrix;
CogStateStructRAW.GML = GML_Matrix;
CogStateStructRAW.ISL = ISL_Matrix;
CogStateStructRAW.ISRL = ISRL_Matrix;
CogStateStructRAW.OCL = OCL_Matrix;
CogStateStructRAW.ONB = ONB_Matrix;

CogStateStructNamesRAW = fieldnames(CogStateStructRAW);

%% CogStateStruct Creation (NumbersOnly)

CogStateStructNUM.IDN = IDN_Matrix;
CogStateStructNUM.DET = DET_Matrix;
CogStateStructNUM.GML = GML_Matrix;
CogStateStructNUM.ISL = ISL_Matrix;
CogStateStructNUM.ISRL = ISRL_Matrix;
CogStateStructNUM.OCL = OCL_Matrix;
CogStateStructNUM.ONB = ONB_Matrix;

CogStateStructNamesNUM = fieldnames(CogStateStructNUM);


for ii = 1:length(CogStateStructNamesRAW)
    hand_Sex_Session=[];
    RightINDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,4),'Right'));
    LeftINDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,4),'Left'));
    MaleINDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,5),'Male'));
    FemaleINDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,5),'Female'));
    PracticeINDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,8),'Practice'));
    Session1INDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,8),'Session 1'));
    Session2INDEX = find(ismember(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,8),'Session 2'));

    partNumb = cell2mat(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,2));
    partNumb2 = str2num(partNumb(:,5:end));
    birthDate = cell2mat(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,3));
    SessionDate = cell2mat(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,6));
    
    part_SD_BD=[partNumb2,SessionDate,birthDate];
            
    hand_Sex_Session(RightINDEX,1) = 1;
    hand_Sex_Session(MaleINDEX,2) = 1;
    hand_Sex_Session(Session1INDEX,3) = 1;
    hand_Sex_Session(Session2INDEX,3) = 2;
    
    responseData = cell2mat(CogStateStructRAW.(CogStateStructNamesRAW{ii})(:,10:end));
    CogStateStructNUM.(CogStateStructNamesNUM{ii})=[part_SD_BD,hand_Sex_Session,responseData];
    
end


%% Pruning 106, 312, 317, PRACTICE, and mean +/- 3SD

%NOTE: 106 has two scan days but only 1 cogstate session

oneSessionREMOVE=[65,150,106,233,312,317]';
IDN_DET_ONB=["IDN", "DET", "ONB"];
ISL_ISRL=["ISL", "ISRL"];

allOffParticipants.IDN = [];
allOffParticipants.DET = [];
allOffParticipants.GML = [];
allOffParticipants.ISL = [];
allOffParticipants.ISRL = [];
allOffParticipants.OCL = [];
allOffParticipants.ONB = [];
allOffParticipantsName = fieldnames(allOffParticipants);


 for ii = 1:length(CogStateStructNamesNUM)

    %Remove participants that have only 1 session
    oneSessionINDEX = find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),oneSessionREMOVE));
    CogStateStructNUM.(CogStateStructNamesNUM{ii})(oneSessionINDEX,:)=[];

    if contains(CogStateStructNamesNUM{ii},IDN_DET_ONB)%IDN DET ONB = 14 lmn
    
        %The column depends on the measure (mean+3STD)
        cogMean=mean(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,14));
        cogSTD=std(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,14));
        outliersThreshPLUS=cogMean+(cogSTD*3);
        outliersThreshNEG=cogMean-(cogSTD*3);
        %outliers 3sd +/- mean INDEX
        outliersPLUS = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,14)>outliersThreshPLUS);
        outliersNEG = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,14)<outliersThreshNEG);
        %outliers 3sd +/- mean
        partOutPLUS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(outliersPLUS,1);
        partOutNEG=CogStateStructNUM.(CogStateStructNamesNUM{ii})(outliersNEG,1);
        
        %Finding the participants instead of ONLY the sessions (to nix both sessions)
        OutlierPlusINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutPLUS));
        OutlierNegINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutNEG));
        
        %Removing the rows as specified
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierPlusINDEX,:)=[];
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierNegINDEX,:)=[];

    elseif contains(CogStateStructNamesNUM{ii},'OCL')%OCL = 16 acc
        
        cogMean=mean(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,16));
        cogSTD=std(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,16));
        outliersThreshPLUS=cogMean+(cogSTD*3);
        %outliers 3sd + mean INDEX
        outliersPLUS = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,16)>outliersThreshPLUS);        
        zerosINDEX = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,16)==0);      
        %outliers 3sd + mean
        partOutPLUS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(outliersPLUS,1);
        partOutZEROS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(zerosINDEX,1);

        %Finding the participants instead of ONLY the sessions (to nix both sessions)
        OutlierPlusINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutPLUS));
        OutlierZerosINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutZEROS));

        %Removing the rows as specified
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierPlusINDEX,:)=[];
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierZerosINDEX,:)=[];
        
    elseif contains(CogStateStructNamesNUM{ii},ISL_ISRL)%ISL_ISRL = 17 cor
        
        cogMean=mean(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,17));
        cogSTD=std(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,17));
        outliersThreshPLUS=cogMean+(cogSTD*3);
        %outliers 3sd + mean INDEX
        outliersPLUS = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,17)>outliersThreshPLUS);        
        zerosINDEX = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,17)==0);      
        %outliers 3sd + mean
        partOutPLUS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(outliersPLUS,1);
        partOutZEROS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(zerosINDEX,1);

        %Finding the participants instead of ONLY the sessions (to nix both sessions)
        OutlierPlusINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutPLUS));
        OutlierZerosINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutZEROS));

        %Removing the rows as specified
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierPlusINDEX,:)=[];
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierZerosINDEX,:)=[];
        
    elseif contains(CogStateStructNamesNUM{ii},'GML')%GML =  10 ter
                
        cogMean=mean(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,10));
        cogSTD=std(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,10));
        outliersThreshPLUS=cogMean+(cogSTD*3);
        %outliers 3sd + mean INDEX
        outliersPLUS = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,10)>outliersThreshPLUS);        
        zerosINDEX = find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,10)==0);      
        %outliers 3sd + mean
        partOutPLUS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(outliersPLUS,1);
        partOutZEROS=CogStateStructNUM.(CogStateStructNamesNUM{ii})(zerosINDEX,1);

        %Finding the participants instead of ONLY the sessions (to nix both sessions)
        OutlierPlusINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutPLUS));
        OutlierZerosINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),partOutZEROS));

        %Removing the rows as specified
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierPlusINDEX,:)=[];
        CogStateStructNUM.(CogStateStructNamesNUM{ii})(OutlierZerosINDEX,:)=[];
    end
    
    %REMOVE Practice 
    practice=find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,6)==0);
    CogStateStructNUM.(CogStateStructNamesNUM{ii})(practice,:)=[];

    %Remove mismatch participants
    [U, I] = unique(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1), 'first');
    proplemParticipantsINDEX=find(diff(I)<2);
    proplemParticipants=U(proplemParticipantsINDEX);
    
    allOffParticipants.(allOffParticipantsName{ii})=proplemParticipants';%Good participants that must be omitted
    
    proplemParticipantsFINALINDEX=find(ismember(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,1),proplemParticipants));
    CogStateStructNUM.(CogStateStructNamesNUM{ii})(proplemParticipantsFINALINDEX,:)=[];
    
 end
 
 
%% Compartmentalizing Session and treatment group

pCELL=cell(7);
hCELL=cell(7);
avgsCELL=cell(7);

table1p = {'Task','Session','Top1 vs Top2','Plb1 vs Plb2','Top1 vs Plb2','Top1 vs Plb1','Top2 vs Plb2'};
table1h = {'Task','Session','Top1 vs Top2','Plb1 vs Plb2','Top1 vs Plb2','Top1 vs Plb1','Top2 vs Plb2'};

tableAvgs = {'Task','Session1','Session2','TOP1','TOP2','PLB1','PLB2'};


for ii = 3:length(CogStateStructNamesNUM)
    
    pCELL(ii,1)=CogStateStructNamesNUM(ii);
    hCELL(ii,1)=CogStateStructNamesNUM(ii);
    avgsCELL(ii,1)=CogStateStructNamesNUM(ii);
    
    %Session 1&2
    s1=find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,6)==1);
    s2=find(CogStateStructNUM.(CogStateStructNamesNUM{ii})(:,6)==2);

    Session1Matrix = CogStateStructNUM.(CogStateStructNamesNUM{ii})(s1,:);
    Session2Matrix = CogStateStructNUM.(CogStateStructNamesNUM{ii})(s2,:);

    %Participants: Top/Plb
    topPartINDEX1=find(ismember(Session1Matrix(:,1),TopParticipantList));
    plbPartINDEX1=find(ismember(Session1Matrix(:,1),PlaceboParticipantList));
    topPartINDEX2=find(ismember(Session2Matrix(:,1),TopParticipantList));
    plbPartINDEX2=find(ismember(Session2Matrix(:,1),PlaceboParticipantList));


    if contains(CogStateStructNamesNUM{ii},IDN_DET_ONB)%IDN DET ONB = 14 lmn
        
        %%%%%%%%% AVERAGES %%%%%%%%%
        
        %Average of Session1
        avgs(ii,1) = mean(Session1Matrix(:,14));
        %Average of Session2
        avgs(ii,2) = mean(Session2Matrix(:,14));

        %Average of Top1
        avgs(ii,3) = mean(Session1Matrix(topPartINDEX1,14));
        %Average of Top2
        avgs(ii,4) = mean(Session2Matrix(topPartINDEX2,14));
        
        %Average of PLB1
        avgs(ii,5) = mean(Session1Matrix(plbPartINDEX1,14));
        %Average of PLB2
        avgs(ii,6) = mean(Session2Matrix(plbPartINDEX2,14));
        
        %%%%%%%%% SEM %%%%%%%%%
        
        %SEM of Session1
        sems(ii,1) = std(Session1Matrix(:,14))/sqrt(length(Session1Matrix(:,10)));
        %SEM of Session2
        sems(ii,2) = std(Session2Matrix(:,14))/sqrt(length(Session2Matrix(:,10)));

        %SEM of Top1
        sems(ii,3) = std(Session1Matrix(topPartINDEX1,14))/sqrt(length(Session1Matrix(topPartINDEX1,14)));
        %SEM of Top2
        sems(ii,4) = std(Session2Matrix(topPartINDEX2,14))/sqrt(length(Session2Matrix(topPartINDEX2,14)));
        
        %SEM of PLB1
        sems(ii,5) = std(Session1Matrix(plbPartINDEX1,14))/sqrt(length(Session1Matrix(plbPartINDEX1,14)));
        %SEM of PLB2
        sems(ii,6) = std(Session2Matrix(plbPartINDEX2,14))/sqrt(length(Session2Matrix(plbPartINDEX2,14)));
        
        %%%%%%%%% TTEST %%%%%%%%%
        
        %ttests SESSION
        [h(ii,1),p(ii,1)] = ttest((Session1Matrix(:,14)),(Session2Matrix(:,14)));

        %ttest Top1 vs Top2
        [h(ii,2),p(ii,2)] = ttest((Session1Matrix(topPartINDEX1,14)),(Session2Matrix(topPartINDEX2,14)));

        %ttest Plb1 vs Plb2
        [h(ii,3),p(ii,3)] = ttest((Session1Matrix(plbPartINDEX1,14)),(Session2Matrix(plbPartINDEX2,14)));

        %ttest Top1 vs Plb2
        [h(ii,4),p(ii,4)] = ttest2((Session1Matrix(topPartINDEX1,14)),(Session2Matrix(plbPartINDEX1,14)));

        %ttest Top1 vs Plb1
        [h(ii,5),p(ii,5)] = ttest2((Session1Matrix(topPartINDEX1,14)),(Session1Matrix(plbPartINDEX1,14)));

        %ttest Top2 vs Plb2
        [h(ii,6),p(ii,6)] = ttest2((Session2Matrix(topPartINDEX2,14)),(Session2Matrix(plbPartINDEX2,14)));
        
    elseif contains(CogStateStructNamesNUM{ii},'OCL')%OCL = 16 acc
       
        %%%%%%%%% AVERAGES %%%%%%%%%
        
        %Average of Session1
        avgs(ii,1) = mean(Session1Matrix(:,16));
        %Average of Session2
        avgs(ii,2) = mean(Session2Matrix(:,16));

        %Average of Top1
        avgs(ii,3) = mean(Session1Matrix(topPartINDEX1,16));
        %Average of Top2
        avgs(ii,4) = mean(Session2Matrix(topPartINDEX2,16));
        
        %Average of PLB1
        avgs(ii,5) = mean(Session1Matrix(plbPartINDEX1,16));
        %Average of PLB2
        avgs(ii,6) = mean(Session2Matrix(plbPartINDEX2,16));
        
        %%%%%%%%% SEM %%%%%%%%%
        
        %SEM of Session1
        sems(ii,1) = std(Session1Matrix(:,16))/sqrt(length(Session1Matrix(:,16)));
        %SEM of Session2
        sems(ii,2) = std(Session2Matrix(:,16))/sqrt(length(Session2Matrix(:,16)));

        %SEM of Top1
        sems(ii,3) = std(Session1Matrix(topPartINDEX1,16))/sqrt(length(Session1Matrix(topPartINDEX1,16)));
        %SEM of Top2
        sems(ii,4) = std(Session2Matrix(topPartINDEX2,16))/sqrt(length(Session2Matrix(topPartINDEX2,16)));
        
        %SEM of PLB1
        sems(ii,5) = std(Session1Matrix(plbPartINDEX1,16))/sqrt(length(Session1Matrix(plbPartINDEX1,16)));
        %SEM of PLB2
        sems(ii,6) = std(Session2Matrix(plbPartINDEX2,16))/sqrt(length(Session2Matrix(plbPartINDEX2,16)));
        
        %%%%%%%%% TTEST %%%%%%%%%  
        
        
        %ttests SESSION
        [h(ii,1),p(ii,1)] = ttest((Session1Matrix(:,16)),(Session2Matrix(:,16)));

        %ttest Top1 vs Top2
        [h(ii,2),p(ii,2)] = ttest((Session1Matrix(topPartINDEX1,16)),(Session2Matrix(topPartINDEX2,16)));

        %ttest Plb1 vs Plb2
        [h(ii,3),p(ii,3)] = ttest((Session1Matrix(plbPartINDEX1,16)),(Session2Matrix(plbPartINDEX2,16)));

        %ttest Top1 vs Plb2
        [h(ii,4),p(ii,4)] = ttest2((Session1Matrix(topPartINDEX1,16)),(Session2Matrix(plbPartINDEX1,16)));

        %ttest Top1 vs Plb1
        [h(ii,5),p(ii,5)] = ttest2((Session1Matrix(topPartINDEX1,16)),(Session1Matrix(plbPartINDEX1,16)));

        %ttest Top2 vs Plb2
        [h(ii,6),p(ii,6)] = ttest2((Session2Matrix(topPartINDEX2,16)),(Session2Matrix(plbPartINDEX2,16)));
        
        
    elseif contains(CogStateStructNamesNUM{ii},ISL_ISRL)%ISL_ISRL = 17 cor
    
        %%%%%%%%% AVERAGES %%%%%%%%%
        
        %Average of Session1
        avgs(ii,1) = mean(Session1Matrix(:,17));
        %Average of Session2
        avgs(ii,2) = mean(Session2Matrix(:,17));

        %Average of Top1
        avgs(ii,3) = mean(Session1Matrix(topPartINDEX1,17));
        %Average of Top2
        avgs(ii,4) = mean(Session2Matrix(topPartINDEX2,17));
        
        %Average of PLB1
        avgs(ii,5) = mean(Session1Matrix(plbPartINDEX1,17));
        %Average of PLB2
        avgs(ii,6) = mean(Session2Matrix(plbPartINDEX2,17));
        
        %%%%%%%%% SEM %%%%%%%%%
        
        %SEM of Session1
        sems(ii,1) = std(Session1Matrix(:,17))/sqrt(length(Session1Matrix(:,17)));
        %SEM of Session2
        sems(ii,2) = std(Session2Matrix(:,17))/sqrt(length(Session2Matrix(:,17)));

        %SEM of Top1
        sems(ii,3) = std(Session1Matrix(topPartINDEX1,17))/sqrt(length(Session1Matrix(topPartINDEX1,17)));
        %SEM of Top2
        sems(ii,4) = std(Session2Matrix(topPartINDEX2,17))/sqrt(length(Session2Matrix(topPartINDEX2,17)));
        
        %SEM of PLB1
        sems(ii,5) = std(Session1Matrix(plbPartINDEX1,17))/sqrt(length(Session1Matrix(plbPartINDEX1,17)));
        %SEM of PLB2
        sems(ii,6) = std(Session2Matrix(plbPartINDEX2,17))/sqrt(length(Session2Matrix(plbPartINDEX2,17)));
        
        %%%%%%%%% TTEST %%%%%%%%%
        
        %ttests SESSION
        [h(ii,1),p(ii,1)] = ttest((Session1Matrix(:,17)),(Session2Matrix(:,17)));

        %ttest Top1 vs Top2
        [h(ii,2),p(ii,2)] = ttest((Session1Matrix(topPartINDEX1,17)),(Session2Matrix(topPartINDEX2,17)));

        %ttest Plb1 vs Plb2
        [h(ii,3),p(ii,3)] = ttest((Session1Matrix(plbPartINDEX1,17)),(Session2Matrix(plbPartINDEX2,17)));

        %ttest Top1 vs Plb2
        [h(ii,4),p(ii,4)] = ttest2((Session1Matrix(topPartINDEX1,17)),(Session2Matrix(plbPartINDEX1,17)));

        %ttest Top1 vs 1
        [h(ii,5),p(ii,5)] = ttest2((Session1Matrix(topPartINDEX1,17)),(Session1Matrix(plbPartINDEX1,17)));

        %ttest Top2 vs Plb2
        [h(ii,6),p(ii,6)] = ttest2((Session2Matrix(topPartINDEX2,17)),(Session2Matrix(plbPartINDEX2,17)));
        
    
    elseif contains(CogStateStructNamesNUM{ii},'GML')%GML =  10 ter

        %%%%%%%%% AVERAGES %%%%%%%%%
        
        %Average of Session1
        avgs(ii,1) = mean(Session1Matrix(:,10));
        %Average of Session2
        avgs(ii,2) = mean(Session2Matrix(:,10));

        %Average of Top1
        avgs(ii,3) = mean(Session1Matrix(topPartINDEX1,10));
        %Average of Top2
        avgs(ii,4) = mean(Session2Matrix(topPartINDEX2,10));
        
        %Average of PLB1
        avgs(ii,5) = mean(Session1Matrix(plbPartINDEX1,10));
        %Average of PLB2
        avgs(ii,6) = mean(Session2Matrix(plbPartINDEX2,10));
       
        %%%%%%%%% SEM %%%%%%%%%
        
        %SEM of Session1
        sems(ii,1) = std(Session1Matrix(:,10))/sqrt(length(Session1Matrix(:,10)));
        %SEM of Session2
        sems(ii,2) = std(Session2Matrix(:,10))/sqrt(length(Session2Matrix(:,10)));

        %SEM of Top1
        sems(ii,3) = std(Session1Matrix(topPartINDEX1,10))/sqrt(length(Session1Matrix(topPartINDEX1,10)));
        %SEM of Top2
        sems(ii,4) = std(Session2Matrix(topPartINDEX2,10))/sqrt(length(Session2Matrix(topPartINDEX2,10)));
        
        %SEM of PLB1
        sems(ii,5) = std(Session1Matrix(plbPartINDEX1,10))/sqrt(length(Session1Matrix(plbPartINDEX1,10)));
        %SEM of PLB2
        sems(ii,6) = std(Session2Matrix(plbPartINDEX2,10))/sqrt(length(Session2Matrix(plbPartINDEX2,10)));
        
        %%%%%%%%% TTEST %%%%%%%%%
        
        %ttests SESSION
        [h(ii,1),p(ii,1)] = ttest((Session1Matrix(:,10)),(Session2Matrix(:,10)));

        %ttest Top1 vs Top2
        [h(ii,2),p(ii,2)] = ttest((Session1Matrix(topPartINDEX1,10)),(Session2Matrix(topPartINDEX2,10)));

        %ttest Plb1 vs Plb2
        [h(ii,3),p(ii,3)] = ttest((Session1Matrix(plbPartINDEX1,10)),(Session2Matrix(plbPartINDEX2,10)));

        %ttest Top1 vs Plb2
        [h(ii,4),p(ii,4)] = ttest2((Session1Matrix(topPartINDEX1,10)),(Session2Matrix(plbPartINDEX1,10)));

        %ttest Top1 vs Plb1
        [h(ii,5),p(ii,5)] = ttest2((Session1Matrix(topPartINDEX1,10)),(Session1Matrix(plbPartINDEX1,10)));

        %ttest Top2 vs Plb2
        [h(ii,6),p(ii,6)] = ttest2((Session2Matrix(topPartINDEX2,10)),(Session2Matrix(plbPartINDEX2,10)));
        
    end 
end

pCELLFinal = [pCELL(:,1),num2cell(p)];
hCELLFinal = [hCELL(:,1),num2cell(h)];

table1p = vertcat(table1p,pCELLFinal);
table1h = vertcat(table1h,hCELLFinal);

%Averages tale
avgsCELLFinal = [avgsCELL(:,1),num2cell(avgs)];

tableAvgs = vertcat(tableAvgs,avgsCELLFinal);


%Headers

% SubjID, TestDate, BirthYear, handedness (right=1), Sex
% (male=1),Session#(practice=0; session1=1; session2=2), response data:
% GMLidx | mps | dur | ter | ler | rer | per | lmn | lsd | acc | cor | err | presnt | cmv | rth | sti | cfo | res
% 
% 
% temp = (avgTop1-avgPlb1)/std(Session1Matrix(:,14))
% 
% temp = (avgTop2-avgPlb2)/std(Session2Matrix(:,14))



















