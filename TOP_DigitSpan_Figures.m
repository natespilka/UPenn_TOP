%% TOP Digit Span Graphs
%8/29/19
%Run "Top_DigSpanAnalysis" prior to running this

%% FigureSpecs

Line1Color=[0 0 0];
Line2Color=[0.53 0.53 0.53];
lineWidth=3.5;
xTickLabelLocation=[2,8]; %location for the "Screening" "Visit 10" on the x axis
markerSize=10;
yFontSize=46;
xFontSize=18;
xFontSizeTick=36;
titleFontSize=50;
arrowFontSize=18;

cd /project/psychimg3/Reagan/Top/offMagnetData/DigitSpan %Save the Figures here

%% Forward Digit Score 

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,1),DigSpanNumDataSEMall(:,1),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Score','FontSize',yFontSize);%CHANGE
ylim([9 15]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,4),DigSpanNumDataSEMall(:,4),'-o',...%CHANGE
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
    handle.Position=[2,8.7,-1];

title('Digit Span Forward Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'DigSpan_FrwdScore_Figure.png','-dpng','-r300'); 

hold off

%% Backward Digit Score 

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,2),DigSpanNumDataSEMall(:,2),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Score','FontSize',yFontSize);%CHANGE
ylim([5 11]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,5),DigSpanNumDataSEMall(:,5),'-o',...%CHANGE
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
    handle.Position=[2,4.7,-1];

title('Digit Span Backward Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'DigSpan_BckwdScore_Figure.png','-dpng','-r300'); 

hold off

%% Total Digit Score 

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,3),DigSpanNumDataSEMall(:,3),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color,...
    'CapSize',12);
s(1).Color=Line1Color;

ylabel('Total Score','FontSize',yFontSize);%CHANGE
ylim([15 25]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,DigSpanNumDataMEANSall(:,6),DigSpanNumDataSEMall(:,6),'-o',...%CHANGE
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
    handle.Position=[2,14.4,-1];

title('Digit Span Total Score: Top vs Plb','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'DigSpan_TotalScore_Figure.png','-dpng','-r300'); 

hold off
