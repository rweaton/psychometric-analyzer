% Generate Monte Carlo Simulated Time Corrolation Histograms 

cd('/Users/thug/Documents/JagadeeshRotation/GabeData/GBSOAM13/LearningAnalysisConds1to140')

PlotHeight = 0;

for j = 1:12
    if  (PlotHeight < max(TimeIndexCorrolationStatsCellArray(j).NormalizedFrequencyHistogram))
        PlotHeight = max(TimeIndexCorrolationStatsCellArray(j).NormalizedFrequencyHistogram);
    end
end;


for j = 2:12
    
    figure(1);
    hold on;
    
    h0 = bar( TimeIndexCorrolationStatsCellArray(j).BinCenters, ...
         TimeIndexCorrolationStatsCellArray(j).NormalizedFrequencyHistogram, ...
         'g');
    axis([-1.1 1.1 0 PlotHeight]);
    xlabel('Time Corrolation r value');
    ylabel('Normalized Frequency');
    title(['Simulated Time Corrolation for SOA ', num2str(SOAs(j))]);
     
     h1 = plot([EmpericalCorrCoeffArray(j), EmpericalCorrCoeffArray(j)], ...
         [0, PlotHeight],'r');
     set(h1, 'LineWidth', 3.0);
     
     h2 = plot( ...
          [TimeIndexCorrolationStatsCellArray(j).Conf025Limit, ...
           TimeIndexCorrolationStatsCellArray(j).Conf025Limit], ... 
           [0, PlotHeight],'k--');
       set(h2, 'LineWidth', 3.0);
     
     h3 = plot( ...
         [TimeIndexCorrolationStatsCellArray(j).Conf975Limit, ...
           TimeIndexCorrolationStatsCellArray(j).Conf975Limit], ... 
           [0, PlotHeight],'k--');
       set(h3, 'LineWidth', 3.0);
       
     
     hold off;
     
     Filename = ['MCTimeCorrolationHistoSOA',num2str(SOAs(j)),'.fig']
     saveas(figure(1), Filename, 'fig');
     close(figure(1));
     
     
end;

cd('/Users/thug/Documents/JagadeeshRotation/AnalysisCode');