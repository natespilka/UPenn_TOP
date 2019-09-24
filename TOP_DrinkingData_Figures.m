%% TOP DrinkingData Graphs
%9/1/19

%Run "Top_DrinkingDataAnalysis" prior to running this

%% FigureSpecs

Line1Color=[0 0 0];
Line2Color=[0.53 0.53 0.53];
lineWidth=3.5;
xTickLabelLocation=[2,4,6,8]; %location for the "Screening" "BaseLine" "Visit 7" and "Visit 10" on the x axis
markerSize=10;
yFontSize=46;
xFontSize=18;
xFontSizeTick=36;
titleFontSize=50;
arrowFontSize=18;

cd /project/psychimg3/Reagan/Top/offMagnetData/DrinkingData/DrinkingDataFigures %Save the Figures here

%% Average Drinks per drinking day

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,1),DrinkingNumDataSEMall(:,1),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Average Drinks Per Drinking Day','FontSize',yFontSize);%CHANGE
ylim([1 10]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,4),DrinkingNumDataSEMall(:,4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Fewer','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','More','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','BaseLine','Week 7-8','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

% clear xlabel
% xlabel('(No Medication)','FontSize',xFontSize);%
%     
%     handle = get(gca,'xlabel'); % handle to the label object
%     handle.Position=[2,0,-1];

title('Average Drinks Per Drinking Day: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'AvgDrinksTopFigure.png','-dpng','-r300'); 

hold off


%% Percent of drinking days

figure('Position', [10 10 3000 2000])%'visible','off');

s(1) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,2)*100,DrinkingNumDataSEMall(:,2)*100,'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Percent of Drinking Days','FontSize',yFontSize);%CHANGE
ylim([50 100]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,5)*100,DrinkingNumDataSEMall(:,5)*100,'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Lower','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Higher','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','BaseLine','Week 7-8','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

% clear xlabel
% xlabel('(No Medication)','FontSize',xFontSize);%
%     
%     handle = get(gca,'xlabel'); % handle to the label object
%     handle.Position=[2,0,-1];

title('Percent of Drinking Days: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'PrcntDrinkingDaysTopFigure.png','-dpng','-r300'); 

hold off

%% Percent of HEAVY drinking days

figure('Position', [10 10 3000 2000])%'visible','off');

s(1) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,3)*100,DrinkingNumDataSEMall(:,3)*100,'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Percent of Heavy Drinking Days','FontSize',yFontSize);%CHANGE
ylim([0 100]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DrinkingNumDataMEANSall(:,6)*100,DrinkingNumDataSEMall(:,6)*100,'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color,...
    'CapSize',12);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Lower','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Higher','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Screening','BaseLine','Week 7-8','Week 14'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

% clear xlabel
% xlabel('(No Medication)','FontSize',xFontSize);%
%     
%     handle = get(gca,'xlabel'); % handle to the label object
%     handle.Position=[2,0,-1];

title('Percent of Heavy Drinking Days: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

%print(gcf,'PrcntHeavyDrinkingDaysTopFigure.png','-dpng','-r300'); 

hold off



