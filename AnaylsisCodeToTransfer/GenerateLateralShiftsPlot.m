% Generate Lateral shifts plot

LateralShifts = UnsortedEstimatedParamVals113to140(:,1)./UnsortedEstimatedParamVals113to140(:,2);
LateralShifts113to140ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(1) = LateralShifts113to140ConfIntStruct.SampleAverage;
LateralShiftErrArray(1) = LateralShifts113to140ConfIntStruct.StdErrRange/2;

LateralShifts = UnsortedEstimatedParamVals85to112(:,1)./UnsortedEstimatedParamVals85to112(:,2);
LateralShifts85to112ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(2) = LateralShifts85to112ConfIntStruct.SampleAverage;
LateralShiftErrArray(2) = LateralShifts85to112ConfIntStruct.StdErrRange/2;

LateralShifts = UnsortedEstimatedParamVals1to28(:,1)./UnsortedEstimatedParamVals1to28(:,2);
LateralShifts1to28ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(3) = LateralShifts1to28ConfIntStruct.SampleAverage;
LateralShiftErrArray(3) = LateralShifts1to28ConfIntStruct.StdErrRange/2;

LateralShifts = UnsortedEstimatedParamVals29to56(:,1)./UnsortedEstimatedParamVals29to56(:,2);
LateralShifts29to56ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(4) = LateralShifts29to56ConfIntStruct.SampleAverage;
LateralShiftErrArray(4) = LateralShifts29to56ConfIntStruct.StdErrRange/2;

LateralShifts = UnsortedEstimatedParamVals57to84(:,1)./UnsortedEstimatedParamVals57to84(:,2);
LateralShifts57to84ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(5) = LateralShifts57to84ConfIntStruct.SampleAverage;
LateralShiftErrArray(5) = LateralShifts57to84ConfIntStruct.StdErrRange/2;

LateralShifts = UnsortedEstimatedParamVals1to140(:,1)./UnsortedEstimatedParamVals1to140(:,2);
LateralShifts1to140ConfIntStruct = ComputeConfidenceLimitsSAFE(LateralShifts,20);
LateralShiftsArray(6) = LateralShifts1to140ConfIntStruct.SampleAverage;
LateralShiftErrArray(6) = LateralShifts1to140ConfIntStruct.StdErrRange/2;

PlotHeight = max(LateralShiftsArray+LateralShiftErrArray);
figure; hold on;
axis([0 7 0 PlotHeight]);

xlabel('Mask Type', 'FontSize', 20);
ylabel('Adj. 50% Threshold SOA  (ms)', 'FontSize', 20);
title('Centerpoint Lateral Shift', 'FontSize', 24);

for j = 1:6
    
    bar(j,LateralShiftsArray(j),'k');
   
   
    
end;
 
errorbar(1:6, LateralShiftsArray(1:6), LateralShiftErrArray(1:6), 'ko');

Labels = {'No Mask', 'Arbitrary', 'Scrambled', 'Fourier', 'Rndm Pixel', 'All'};
set(gca, 'XTick', 1:6);
set(gca, 'XTickLabel', Labels, 'FontSize', 12);