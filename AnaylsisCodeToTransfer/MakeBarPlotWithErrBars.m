PooledStimulusSetsParamList = UnsortedEstimatedParamVals1to140;
CalcThresholdsRunScript;
MaskThresholdsArray{1} = ThresholdStatsArray(1);
PooledStimulusSetsParamList = UnsortedEstimatedParamVals85to112;
CalcThresholdsRunScript;
MaskThresholdsArray{2} = ThresholdStatsArray(1);
PooledStimulusSetsParamList = UnsortedEstimatedParamVals113to140;
CalcThresholdsRunScript;
MaskThresholdsArray{3} = ThresholdStatsArray(1);
PooledStimulusSetsParamList = UnsortedEstimatedParamVals1to28;
CalcThresholdsRunScript;
MaskThresholdsArray{4} = ThresholdStatsArray(1);
PooledStimulusSetsParamList = UnsortedEstimatedParamVals29to56;
CalcThresholdsRunScript;
MaskThresholdsArray{5} = ThresholdStatsArray(1);
PooledStimulusSetsParamList = UnsortedEstimatedParamVals57to84;
CalcThresholdsRunScript;
MaskThresholdsArray{6} = ThresholdStatsArray(1);


barEntries = abs([MaskThresholdsArray{1}.SampleAverage ...
                  MaskThresholdsArray{2}.SampleAverage ...
                  MaskThresholdsArray{3}.SampleAverage ...
                  MaskThresholdsArray{4}.SampleAverage ...
                  MaskThresholdsArray{5}.SampleAverage ... 
                  MaskThresholdsArray{6}.SampleAverage]);
              
barSEs = [MaskThresholdsArray{1}.StdErrRange/2 ...
          MaskThresholdsArray{2}.StdErrRange/2 ...
          MaskThresholdsArray{3}.StdErrRange/2 ...
          MaskThresholdsArray{4}.StdErrRange/2 ...
          MaskThresholdsArray{5}.StdErrRange/2 ...
          MaskThresholdsArray{6}.StdErrRange/2];

figure; bar(1,barEntries(1),'k'); hold on;
bar(2:6,barEntries(2:6)); 
errorbar(1:6, barEntries, barSEs, 'ko');