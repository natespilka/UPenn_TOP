%% TOP CogStateGraphs
%8/20/19
%Run "CogtateAnalysis" prior to running this

%% FigureSpecs

Line1Color=[0 0 0];
Line2Color=[0.53 0.53 0.53];
lineWidth=3.5;
xTickLabelLocation=[2,8]; %location for the "week1" "week6" on the x axis
markerSize=10;
yFontSize=46;
xFontSize=18;
xFontSizeTick=36;
titleFontSize=50;
arrowFontSize=18;

cd /project/psychimg3/Reagan/Top/offMagnetData/CogStateData/CogStateFigs %Save the Figures here
%% Identification Task 
% 
% figure('Position', [10 10 3000 2000],'visible','off');
% 
% s(1) = errorbar(xTickLabelLocation,avgs(1,3:4),sems(1,3:4),'-o',...%CHANGE
%     'LineWidth',lineWidth,...
%     'MarkerSize',markerSize,...
%     'MarkerEdgeColor',Line1Color,...
%     'MarkerFaceColor',Line1Color);
% s(1).Color=Line1Color;
% 
% ylabel('Speed of Performance (log10 msec)','FontSize',yFontSize);%CHANGE
% ylim([2.5 3]);%CHANGE
% xlim([0 10]);
% 
% hold on
% 
% s(2) = errorbar(xTickLabelLocation,avgs(1,5:6),sems(1,5:6),'-o',...%CHANGE
%     'LineWidth',lineWidth,...
%     'MarkerSize',markerSize,...
%     'MarkerEdgeColor',Line2Color,...
%     'MarkerFaceColor',Line2Color);
% s(2).Color= Line2Color;
% 
% xArrowDown = [0.035 0.035];
% yArrowDown = [0.42 0.12];
% an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
% an1.FontSize = arrowFontSize;
% 
% xArrowUp = [0.035 0.035];
% yArrowUp = [0.6 .90];
% an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
% an2.FontSize = arrowFontSize;
% 
% xlabelNames={'Week 1','Week 6'};
% set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);
% 
% clear xlabel
% xlabel('(No Medication)','FontSize',xFontSize);%
%     
%     handle = get(gca,'xlabel'); % handle to the label object
%     handle.Position=[2,2.472,-1];
% 
% title('Identification Task (Attention)','fontweight','bold','FontSize',titleFontSize)
% 
% legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
% set(gcf,'color','w');
% box off
% 
% %print(gcf,'IDNfigure.png','-dpng','-r300'); 
% 
% hold off
% 
% %% Detection Task
% 
% figure('Position', [10 10 3000 2000],'visible','off');
% 
% s(1) = errorbar(xTickLabelLocation,avgs(2,3:4),sems(2,3:4),'-o',...%CHANGE
%     'LineWidth',lineWidth,...
%     'MarkerSize',markerSize,...
%     'MarkerEdgeColor',Line1Color,...
%     'MarkerFaceColor',Line1Color);
% s(1).Color=Line1Color;
% 
% ylabel('Speed of Performance (log10 msec)','FontSize',yFontSize);%CHANGE
% ylim([2.35 2.75]);%CHANGE
% xlim([0 10]);
% 
% hold on
% 
% s(2) = errorbar(xTickLabelLocation,avgs(2,5:6),sems(2,5:6),'-o',...%CHANGE
%     'LineWidth',lineWidth,...
%     'MarkerSize',markerSize,...
%     'MarkerEdgeColor',Line2Color,...
%     'MarkerFaceColor',Line2Color);
% s(2).Color= Line2Color;
% 
% xArrowDown = [0.035 0.035];
% yArrowDown = [0.42 0.12];
% an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
% an1.FontSize = arrowFontSize;
% 
% xArrowUp = [0.035 0.035];
% yArrowUp = [0.6 .90];
% an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
% an2.FontSize = arrowFontSize;
% 
% xlabelNames={'Week 1','Week 6'};
% set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);
% 
% clear xlabel
% xlabel('(No Medication)','FontSize',xFontSize);%
%     
%     handle = get(gca,'xlabel'); % handle to the label object
%     handle.Position=[2,2.33,-1];
% 
% title('Detection Task (Psychomotor Function)','fontweight','bold','FontSize',titleFontSize)
% 
% legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
% set(gcf,'color','w');
% box off
% 
% %print(gcf,'DETfigure.png','-dpng','-r300'); 
% 
% hold off

%% Groton Maze Learning Task

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,avgs(3,3:4),sems(3,3:4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color);
s(1).Color=Line1Color;

ylabel('Total Errors ','FontSize',yFontSize);%CHANGE
ylim([20 70]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,avgs(3,5:6),sems(3,5:6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color);
s(2).Color= Line2Color;

xArrowDown = [0.035 0.035];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.035 0.035];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Week 1','Week 6'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,17.5,-1];

title('Groton Maze Learning Task (Executive Function)','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'GMLfigure_WithIntChk.png','-dpng','-r300'); 

hold off

%% International Shopping List Task

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,avgs(4,3:4),sems(4,3:4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color);
s(1).Color=Line1Color;

ylabel('Correct Responses ','FontSize',yFontSize);%CHANGE
ylim([20 35]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,avgs(4,5:6),sems(4,5:6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color);
s(2).Color= Line2Color;

xArrowDown = [0.037 0.037];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.037 0.037];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Week 1','Week 6'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,19.2,-1];

title('International Shopping List Task (Verbal Learning)','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'ISLfigure_WithIntChk.png','-dpng','-r300'); 

hold off

%% International Shopping List Delayed Recall Task

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,avgs(5,3:4),sems(5,3:4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color);
s(1).Color=Line1Color;

ylabel('Correct Responses ','FontSize',yFontSize);%CHANGE
ylim([6.5 11]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,avgs(5,5:6),sems(5,5:6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color);
s(2).Color= Line2Color;

xArrowDown = [0.037 0.037];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.037 0.037];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Week 1','Week 6'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,6.266,-1];

title('ISL Delayed Recall (Memory)','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'ISRLfigure_WithIntChk.png','-dpng','-r300'); 

hold off

%% One Card Learning Task

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,avgs(6,3:4),sems(6,3:4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color);
s(1).Color=Line1Color;

ylabel('Accuracy of Performance','FontSize',yFontSize);%CHANGE
ylim([.85 1.15]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,avgs(6,5:6),sems(6,5:6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color);
s(2).Color= Line2Color;

xArrowDown = [0.037 0.037];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Worse','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.037 0.037];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Better','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Week 1','Week 6'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,.833,-1];

title('One Card Learning Task (Visual Learning)','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'OCLfigure_WithIntChk.png','-dpng','-r300'); 

hold off


%% One Back Task

figure('Position', [10 10 3000 2000],'visible','off');

s(1) = errorbar(xTickLabelLocation,avgs(7,3:4),sems(7,3:4),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line1Color,...
    'MarkerFaceColor',Line1Color);
s(1).Color=Line1Color;

ylabel('Speed of Performance (log10 msec)','FontSize',yFontSize);%CHANGE
ylim([2.7 3.1]);%CHANGE
xlim([0 10]);

hold on

s(2) = errorbar(xTickLabelLocation,avgs(7,5:6),sems(7,5:6),'-o',...%CHANGE
    'LineWidth',lineWidth,...
    'MarkerSize',markerSize,...
    'MarkerEdgeColor',Line2Color,...
    'MarkerFaceColor',Line2Color);
s(2).Color= Line2Color;

xArrowDown = [0.037 0.037];
yArrowDown = [0.42 0.12];
an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
an1.FontSize = arrowFontSize;

xArrowUp = [0.037 0.037];
yArrowUp = [0.6 .90];
an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
an2.FontSize = arrowFontSize;

xlabelNames={'Week 1','Week 6'};
set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

clear xlabel
xlabel('(No Medication)','FontSize',xFontSize);%
    handle = get(gca,'xlabel'); % handle to the label object
    handle.Position=[2,2.68,-1];

title('One Back Task (Working Memory)','fontweight','bold','FontSize',titleFontSize)

legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
set(gcf,'color','w');
box off

print(gcf,'ONBfigure_WithIntChk.png','-dpng','-r300'); 

hold off

