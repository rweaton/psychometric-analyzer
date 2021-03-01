% Generate Monte Carlo Simulated Time Corrolation Histogram Subplot 

cd('/Users/thug/Documents/JagadeeshRotation/GabeData/GBSOAM13/LearningAnalysisConds1to140')
%load('LearningAnalysisWorkspace.mat')

PlotHeight = 0;

for j = 1:12
    if  (PlotHeight < max(TimeIndexCorrolationStatsCellArray(j).NormalizedFrequencyHistogram))
        PlotHeight = max(TimeIndexCorrolationStatsCellArray(j).NormalizedFrequencyHistogram);
    end
end;
Indices = 1:length(SOAs);
SortedSOAarray = sortrows([SOAs(1,2:length(SOAs))',Indices(1,2:length(SOAs))']);
SortedSOAs = SortedSOAarray(:,1)';
SortedIndices = SortedSOAarray(:,2)';
figure;
hold on;

for j = 1:length(SortedSOAs)
    

    subplot(1,length(SOAs),j);
    h0 = bar( TimeIndexCorrolationStatsCellArray(SortedIndices(j)).BinCenters, ...
         TimeIndexCorrolationStatsCellArray(SortedIndices(j)).NormalizedFrequencyHistogram, ...
         'g'); 
    axis([-1.1 1.1 0 PlotHeight]);
    axis off;
    % xlabel('Time Corrolation r value');
    % ylabel('Normalized Frequency');
    title(['SOA ', num2str(SortedSOAs(j))]);
    hold on;
     
     h1 = plot([EmpericalCorrCoeffArray(SortedIndices(j)), EmpericalCorrCoeffArray(SortedIndices(j))], ...
         [0, PlotHeight],'r'); 
     % set(h1, 'LineWidth', 3.0);
    axis off;
    hold on;
    
     h2 = plot( ...
          [TimeIndexCorrolationStatsCellArray(SortedIndices(j)).Conf025Limit, ...
           TimeIndexCorrolationStatsCellArray(SortedIndices(j)).Conf025Limit], ... 
           [0, PlotHeight],'k--');
       % set(h2, 'LineWidth', 3.0);
     axis off;
     hold on;
     
     h3 = plot( ...
         [TimeIndexCorrolationStatsCellArray(SortedIndices(j)).Conf975Limit, ...
          TimeIndexCorrolationStatsCellArray(SortedIndices(j)).Conf975Limit], ... 
           [0, PlotHeight],'k--');
       % set(h3, 'LineWidth', 3.0);
       axis off;
            
end;
hold off;
cd('/Users/thug/Documents/JagadeeshRotation/AnalysisCode');