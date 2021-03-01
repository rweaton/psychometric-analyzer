% Compute Estimated Parameter Confidence Limits
path = '/Users/thug/Documents/JagadeeshRotation/GabeData/';

filenames = {'GBSOAM13/GBSOAM13.1', ...
             'GBSOAM13/GBSOAM13.2', ...
             'GBSOAM13/GBSOAM13.3', ...
             'GBSOAM13/GBSOAM13.4', ...
             'GBSOAM13/GBSOAM13.5', ...
             'GBSOAM12/GBSOAM12.1', ...
             'GBSOAM12/GBSOAM12.2', ...
             'GBSOAM12/GBSOAM12.3', ...
             'GBSOAM11/GBSOAM11.1', ...
             'GBSOAM11/GBSOAM11.2', ...
             'GBSOAM11/GBSOAM11.3'};
         
SOAsToInclude = [0 20 40 80 160 320];
%SOAsToInclude = [0 20 40 80 160];
LastTrialList = [10000 10000 10000 10000 10000 ...
                 10000 10000 10000 ...
                 2713 220 1072];
             
nIterations = 2000;
nBins = 10;

%%%%%%%%%%%%%%%%%%  Conditions 1 to 28 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 1:28;
MaskTypeDelimitingConditions = 1;
TwoParamStruct1to28 = ConcatenateDataFiles2Param(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

UnsortedEstimatedParamVals1to28 = EstimatedTwoParameterMonteCarlo(...
           TwoParamStruct1to28.DataPoints(2,:), ... 
           TwoParamStruct1to28.DataPoints(1,:), ...
           TwoParamStruct1to28.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals1to28, 1);

UnsortedEstimatedParamVals1to28 = OutputStruct.FilteredList;
        
EstimatedParamMCOutputArray1to28 = ComputeConfidenceLimitsSAFE(...
    UnsortedEstimatedParamVals1to28, nBins);

EstimatedParams1to28 = [EstimatedParamMCOutputArray1to28(1).SampleAverage, ...
     EstimatedParamMCOutputArray1to28(2).SampleAverage];

SatModDeviance1to28 = ComputeDeviance2( ...
    TwoParamStruct1to28.DataPoints(1,:), ...
    TwoParamStruct1to28.DataPoints(2,:), ...
    TwoParamStruct1to28.NumTrialsPerSOA, ...
    EstimatedParams1to28);
 
DevianceDistributionStruct1to28 = TwoParamDevianceMonteCarlo( ...
    TwoParamStruct1to28.DataPoints(1,:), ...
    TwoParamStruct1to28.NumTrialsPerSOA, ...
    EstimatedParams1to28, nIterations, nBins);

StimParamList{1}.Params = EstimatedParams1to28;

StimParamList{1}.StdErr = [EstimatedParamMCOutputArray1to28(1).StdErrRange/2, ...
     EstimatedParamMCOutputArray1to28(2).StdErrRange/2];

%%%%%%%%%%%%%%%%%%%%%%%%  Conditions 29 to 56 Run Block %%%%%%%%%%%%%%%%%%%%%%%%%

% ConditionsToInclude = 29:56;
% MaskTypeDelimitingConditions = 29;
% TwoParamStruct29to56 = ConcatenateDataFiles2Param(path, filenames, ...
%         SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);
% 
% UnsortedEstimatedParamVals29to56 = EstimatedTwoParameterMonteCarlo( ...
%            TwoParamStruct29to56.DataPoints(2,:), ... 
%            TwoParamStruct29to56.DataPoints(1,:), ...
%            TwoParamStruct29to56.NumTrialsPerSOA, nIterations, nBins);
% 
% OutputStruct = RemoveOutlierEntries( ...
%     UnsortedEstimatedParamVals29to56, 1);
% 
% UnsortedEstimatedParamVals29to56 = OutputStruct.FilteredList;
%         
% EstimatedParamMCOutputArray29to56 = ComputeConfidenceLimits(...
%     UnsortedEstimatedParamVals29to56, nBins);
% 
% EstimatedParams29to56 = [EstimatedParamMCOutputArray29to56(1).SampleAverage, ...
%      EstimatedParamMCOutputArray29to56(2).SampleAverage];
% 
% SatModDeviance29to56 = ComputeDeviance2( ...
%     TwoParamStruct29to56.DataPoints(1,:), ...
%     TwoParamStruct29to56.DataPoints(2,:), ...
%     TwoParamStruct29to56.NumTrialsPerSOA, ...
%     EstimatedParams29to56);
%  
% DevianceDistributionStruct29to56 = TwoParamDevianceMonteCarlo( ...
%     TwoParamStruct29to56.DataPoints(1,:), ...
%     TwoParamStruct29to56.NumTrialsPerSOA, ...
%     EstimatedParams29to56, nIterations, nBins);
% 
% StimParamList{2}.Params = EstimatedParams29to56;
% 
% StimParamList{2}.StdErr = [EstimatedParamMCOutputArray29to56(1).StdErrRange/2, ...
%      EstimatedParamMCOutputArray29to56(2).StdErrRange/2]; 
%  
% 
% %%%%%%%%%%%%%%%%%%%%  Conditions 57 to 84 Run Block %%%%%%%%%%%%%%%%%%%%%%
% 
% ConditionsToInclude = 57:84;
% MaskTypeDelimitingConditions = 57;
% TwoParamStruct57to84 = ConcatenateDataFiles2Param(path, filenames, ...
%         SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);
% 
% UnsortedEstimatedParamVals57to84 = EstimatedTwoParameterMonteCarlo( ...
%            TwoParamStruct57to84.DataPoints(2,:), ... 
%            TwoParamStruct57to84.DataPoints(1,:), ...
%            TwoParamStruct57to84.NumTrialsPerSOA, nIterations, nBins);
% 
% OutputStruct = RemoveOutlierEntries( ...
%     UnsortedEstimatedParamVals57to84, 1);
% 
% UnsortedEstimatedParamVals57to84 = OutputStruct.FilteredList;
% 
%         
%         
% EstimatedParamMCOutputArray57to84 = ComputeConfidenceLimits( ...
%     UnsortedEstimatedParamVals57to84, nBins);
% 
% EstimatedParams57to84 = [EstimatedParamMCOutputArray57to84(1).SampleAverage, ...
%      EstimatedParamMCOutputArray57to84(2).SampleAverage];
%  
% SatModDeviance57to84 = ComputeDeviance2( ...
%     TwoParamStruct57to84.DataPoints(1,:), ...
%     TwoParamStruct57to84.DataPoints(2,:), ...
%     TwoParamStruct57to84.NumTrialsPerSOA, ...
%     EstimatedParams57to84)
%  
% DevianceDistributionStruct57to84 = TwoParamDevianceMonteCarlo(...
%         TwoParamStruct57to84.DataPoints(1,:), ... 
%         TwoParamStruct57to84.NumTrialsPerSOA, ...
%         EstimatedParams57to84, nIterations, nBins);
% 
% StimParamList{3}.Params = EstimatedParams57to84;
% 
% StimParamList{3}.StdErr = [EstimatedParamMCOutputArray57to84(1).StdErrRange/2, ...
%      EstimatedParamMCOutputArray57to84(2).StdErrRange/2];
% 
%  %%%%%%%%%%%%%%%%%%%%  Conditions 85 to 112 Run Block %%%%%%%%%%%%%%%%%%%%%%
% 
% ConditionsToInclude = 85:112;
% MaskTypeDelimitingConditions = 85;
% TwoParamStruct85to112 = ConcatenateDataFiles2Param(path, filenames, ...
%         SOAsToInclude, ConditionsToInclude, LastTrialList);
% 
% UnsortedEstimatedParamVals85to112 = EstimatedTwoParameterMonteCarlo(...
%            TwoParamStruct85to112.DataPoints(2,:), ... 
%            TwoParamStruct85to112.DataPoints(1,:), ...
%            TwoParamStruct85to112.NumTrialsPerSOA, nIterations, nBins);
% 
% OutputStruct = RemoveOutlierEntries( ...
%     UnsortedEstimatedParamVals85to112, 1);
% 
% UnsortedEstimatedParamVals85to112 = OutputStruct.FilteredList;
% 
%         
%         
% EstimatedParamMCOutputArray85to112 = ComputeConfidenceLimits( ...
%     UnsortedEstimatedParamVals85to112, nBins);
% 
% EstimatedParams85to112 = [EstimatedParamMCOutputArray85to112(1).SampleAverage, ...
%      EstimatedParamMCOutputArray85to112(2).SampleAverage];
%  
% SatModDeviance85to112 = ComputeDeviance2( ...
%     TwoParamStruct85to112.DataPoints(1,:), ...
%     TwoParamStruct85to112.DataPoints(2,:), ...
%     TwoParamStruct85to112.NumTrialsPerSOA, ...
%     EstimatedParams85to112)
%  
% DevianceDistributionStruct85to112 = TwoParamDevianceMonteCarlo( ...
%         TwoParamStruct85to112.DataPoints(1,:), ... 
%         TwoParamStruct85to112.NumTrialsPerSOA, ...
%         EstimatedParams85to112, nIterations, nBins);
% 
% StimParamList{4}.Params = EstimatedParams85to112;
% 
% StimParamList{4}.StdErr = [EstimatedParamMCOutputArray85to112(1).StdErrRange/2, ...
%      EstimatedParamMCOutputArray85to112(2).StdErrRange/2];
%  
% 
%  %%%%%%%%%%%%%%%%%%%%  Conditions 113 to 140 Run Block %%%%%%%%%%%%%%%%%%%%%%
% 
% ConditionsToInclude = 113:140;
% MaskTypeDelimitingConditions = 113;
% TwoParamStruct113to140 = ConcatenateDataFiles2Param(path, filenames, ...
%         SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);
% 
% UnsortedEstimatedParamVals113to140 = EstimatedTwoParameterMonteCarlo( ...
%            TwoParamStruct113to140.DataPoints(2,:), ... 
%            TwoParamStruct113to140.DataPoints(1,:), ...
%            TwoParamStruct113to140.NumTrialsPerSOA, nIterations, nBins);
% 
% OutputStruct = RemoveOutlierEntries( ...
%     UnsortedEstimatedParamVals113to140, 1);
% 
% UnsortedEstimatedParamVals113to140 = OutputStruct.FilteredList;
%         
%         
% EstimatedParamMCOutputArray113to140 = ComputeConfidenceLimits( ...
%     UnsortedEstimatedParamVals113to140, nBins);
% 
% EstimatedParams113to140 = [EstimatedParamMCOutputArray113to140(1).SampleAverage, ...
%      EstimatedParamMCOutputArray113to140(2).SampleAverage];
%  
% SatModDeviance113to140 = ComputeDeviance2( ...
%     TwoParamStruct113to140.DataPoints(1,:), ...
%     TwoParamStruct113to140.DataPoints(2,:), ...
%     TwoParamStruct113to140.NumTrialsPerSOA, ...
%     EstimatedParams113to140)
%  
% DevianceDistributionStruct113to140 = TwoParamDevianceMonteCarlo( ...
%         TwoParamStruct113to140.DataPoints(1,:), ... 
%         TwoParamStruct113to140.NumTrialsPerSOA, ...
%         EstimatedParams113to140, nIterations, nBins);
% 
% StimParamList{5}.Params = EstimatedParams113to140;
% 
% StimParamList{5}.StdErr = [EstimatedParamMCOutputArray113to140(1).StdErrRange/2, ...
%      EstimatedParamMCOutputArray113to140(2).StdErrRange/2];
 
 
%%%%%%%%%%%%  Conditions 1 to 140 Run Block %%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 1:140;
MaskTypeDelimitingConditions = [1, 29, 57, 85, 113];
TwoParamStruct1to140 = ConcatenateDataFiles2Param(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

UnsortedEstimatedParamVals1to140 = EstimatedTwoParameterMonteCarlo(...
           TwoParamStruct1to140.DataPoints(2,:), ... 
           TwoParamStruct1to140.DataPoints(1,:), ...
           TwoParamStruct1to140.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals1to140, 1);

UnsortedEstimatedParamVals1to140 = OutputStruct.FilteredList;
        
EstimatedParamMCOutputArray1to140 = ComputeConfidenceLimitsSAFE(...
    UnsortedEstimatedParamVals1to140, nBins);

EstimatedParams1to140 = [EstimatedParamMCOutputArray1to140(1).SampleAverage, ...
     EstimatedParamMCOutputArray1to140(2).SampleAverage];

SatModDeviance1to140 = ComputeDeviance2( ...
    TwoParamStruct1to140.DataPoints(1,:), ...
    TwoParamStruct1to140.DataPoints(2,:), ...
    TwoParamStruct1to140.NumTrialsPerSOA, ...
    EstimatedParams1to140);
 
DevianceDistributionStruct1to140 = TwoParamDevianceMonteCarlo( ...
    TwoParamStruct1to140.DataPoints(1,:), ...
    TwoParamStruct1to140.NumTrialsPerSOA, ...
    EstimatedParams1to140, nIterations, nBins);

StimParamList{6}.Params = EstimatedParams1to140;

StimParamList{6}.StdErr = [EstimatedParamMCOutputArray1to140(1).StdErrRange/2, ...
     EstimatedParamMCOutputArray1to140(2).StdErrRange/2]; 
 