%% TOP phq9 Graphs
%9/1/19
%Run "Top_phq9Analysis" prior to running this

%% FigureSpecs

Line1Color=[0 0 0];
Line2Color=[0.53 0.53 0.53];
lineWidth=3.5;
xTickLabelLocation=[2,5,8]; %location for the "Screening" "week6" "week14"on the x axis
markerSize=10;
yFontSize=46;
xFontSize=18;
xFontSizeTick=36;
titleFontSize=50;
arrowFontSize=18;

cd /project/psychimg3/Reagan/Top/offMagnetData/PHQ9 %Save the Figures here

%% Total Average Scores

for ii = 1:14
    figure('Position', [10 10 3000 2000],'visible','off');

    s(1) = errorbar(xTickLabelLocation,phq9NumDataMEANSall(:,ii),phq9NumDataSEMall(:,ii),'-o',...%CHANGE
        'LineWidth',lineWidth,...
        'MarkerSize',markerSize,...
        'MarkerEdgeColor',Line1Color,...
        'MarkerFaceColor',Line1Color,...
        'CapSize',12);
    s(1).Color=Line1Color;

    ylabel('Total Score','FontSize',yFontSize);%CHANGE
   % ylim([0 1]);%CHANGE
    xlim([0 10]);

    hold on

    s(2) = errorbar(xTickLabelLocation,phq9NumDataMEANSall(:,ii+14),phq9NumDataSEMall(:,ii+14),'-o',...%CHANGE
        'LineWidth',lineWidth,...
        'MarkerSize',markerSize,...
        'MarkerEdgeColor',Line2Color,...
        'MarkerFaceColor',Line2Color,...
        'CapSize',12);
    s(2).Color= Line2Color;

    xArrowDown = [0.035 0.035];
    yArrowDown = [0.42 0.12];
    % an1=annotation('textarrow',xArrowDown,yArrowDown,'String','Better','LineWidth',4);%CHANGE
    % an1.FontSize = arrowFontSize;

    xArrowUp = [0.035 0.035];
    yArrowUp = [0.6 .90];
    % an2=annotation('textarrow',xArrowUp,yArrowUp,'String','Worse','LineWidth',4);%CHANGE
    % an2.FontSize = arrowFontSize;

    xlabelNames={'Screening','Week 6','Week 14'};
    set(gca,'ydir','normal','xtick',xTickLabelLocation,'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',xFontSizeTick);

   % clear xlabel
    %xlabel('(No Medication)','FontSize',xFontSize);%

     %   handle = get(gca,'xlabel'); % handle to the label object
      %  handle.Position=[2,-.1,-1];

    title(['PHQ9 Question ',num2str(ii),': Top vs Plb'],'fontweight','bold','FontSize',titleFontSize)

    legend([s(1),s(2)],{'Topiramate','Placebo'},'Location','northeastoutside')
    set(gcf,'color','w');
    box off
%saveas(gcf,sprintf('MCS_0%s.jpg',string(num2str(allParticipantsMCSid{ii,1})))) 
    print(gcf,sprintf('phq9_Question%s.jpg',string(num2str(ii))),'-dpng','-r300'); 

    hold off
end



