%% TOP Cowa Graphs
%9/1/19
%Run "Top_COWA" prior to running this

%% FigureSpecs

Line1Color=[0 0 0];
Line2Color=[0.53 0.53 0.53];
lineWidth=3.5;
xTickLabelLocation=[2,8]; %location for the "Screening" "Visit 10" on the x axis
markerSize=10;
yFontSize=46;
xFontSize=18;
xFontSizeTick=36;
titleFontSize=50;1
arrowFontSize=18;

cd /project/psychimg3/Reagan/Top/offMagnetData/COWA %Save the Figures here

%% Total Average Scores

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,2),CowaNumDataSEMall(:,2),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Total Score','FontSize',yFontSize);%CHANGE
ylim([35 55]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,9),CowaNumDataSEMall(:,9),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,33.8,-1];

title('COWA Total Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_AvgScore_Figure.png','-dpng','-r300'); 

hold off


%% Total Average Corected Scores

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,3),CowaNumDataSEMall(:,3),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Corrected Score','FontSize',yFontSize);%CHANGE
ylim([35 55]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,10),CowaNumDataSEMall(:,10),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,33.8,-1];

title('COWA Corrected Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_AvgCorScores_Figure.png','-dpng','-r300'); 

hold off

%% COWA Percentile Score

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,4),CowaNumDataSEMall(:,4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Percentile','FontSize',yFontSize);%CHANGE
ylim([0 100]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,11),CowaNumDataSEMall(:,11),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,-5,-1];

title('COWA Percentile Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_PrcntileScore_Figure.png','-dpng','-r300'); 

hold off

%% T-Score

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,5),CowaNumDataSEMall(:,5),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('T-Score','FontSize',yFontSize);%CHANGE
ylim([45 65]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,12),CowaNumDataSEMall(:,12),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','*','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','*','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,43.8,-1];

title('COWA Average T-Scores: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_tScore_Figure.png','-dpng','-r300'); 

hold off

%% Average Errors

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,6),CowaNumDataSEMall(:,6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Number of Errors','FontSize',yFontSize);%CHANGE
ylim([0 2.5]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,13),CowaNumDataSEMall(:,13),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,-.13,-1];

title('COWA Average Errors: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_AvgErr_Figure.png','-dpng','-r300'); 

hold off

%% Average Reps or Pers

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,7),CowaNumDataSEMall(:,7),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Number of Reps or Pers','FontSize',yFontSize);%CHANGE
ylim([0 2.5]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,CowaNumDataMEANSall(:,14),CowaNumDataSEMall(:,14),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,-.13,-1];

title('COWA Average Number of Reps or Pers: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'COWA_AvgRepsPers_Figure.png','-dpng','-r300'); 

hold off

