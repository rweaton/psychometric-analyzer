%  Compute Estimated Parameter Confidence Limits
path = '/Users/thug/Documents/JagadeeshRotation/GabeData/GBSOAM13/';
filenames = {'GBSOAM13.1','GBSOAM13.2','GBSOAM13.3','GBSOAM13.4','GBSOAM13.5'};
SOAsToInclude = [0 20 40 80 160 320];
LastTrialList = 10000*ones([5, 1]);
nIterations = 2000;
nBins = 10;

%  Conditions 1 to 28 Run Block 

ConditionsToInclude = 1:28;

%FourParamStruct1to28 = ConcatenateDataFiles4Param(path, filenames, ...
%       SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals1to28 = EstimatedFourParameterMonteCarlo(...
           FourParamStruct1to28.DataPoints(2,:), ... 
           FourParamStruct1to28.DataPoints(1,:), ...
           FourParamStruct1to28.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals1to28, 1);

UnsortedEstimatedParamVals1to28 = OutputStruct.FilteredList;
        
EstimatedParamMCOutputArray1to28 = ComputeConfidenceLimits(...
    UnsortedEstimatedParamVals1to28, nBins);

EstimatedParams1to28 = [EstimatedParamMCOutputArray1to28(1).SampleAverage, ...
     EstimatedParamMCOutputArray1to28(2).SampleAverage, ...
     EstimatedParamMCOutputArray1to28(3).SampleAverage, ...
     EstimatedParamMCOutputArray1to28(4).SampleAverage];

SatModDeviance1to28 = ComputeDeviance4( ...
    FourParamStruct1to28.DataPoints(1,:), ...
    FourParamStruct1to28.DataPoints(2,:), ...
    FourParamStruct1to28.NumTrialsPerSOA, ...
    EstimatedParams1to28);
 
DevianceDistributionStruct1to28 = FourParamDevianceMonteCarlo( ...
    FourParamStruct1to28.DataPoints(1,:), ...
    FourParamStruct1to28.NumTrialsPerSOA, ...
    EstimatedParams1to28, nIterations, nBins);

Stim3ParamList{1}.Params = EstimatedParams1to28;

Stim3ParamList{1}.StdErr = [EstimatedParamMCOutputArray1to28(1).StdErrRange, ...
     EstimatedParamMCOutputArray1to28(2).StdErrRange, ...
     EstimatedParamMCOutputArray1to28(3).StdErrRange, ...
     EstimatedParamMCOutputArray1to28(4).StdErrRange];

%%%%%%%%%%%%%%%%%%%%%%%%  Conditions 29 to 56 Run Block %%%%%%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 29:56;

FourParamStruct29to56 = ConcatenateDataFiles4Param(path, filenames, ...
        SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals29to56 = EstimatedFourParameterMonteCarlo( ...
           FourParamStruct29to56.DataPoints(2,:), ... 
           FourParamStruct29to56.DataPoints(1,:), ...
           FourParamStruct29to56.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals29to56, 1);

UnsortedEstimatedParamVals29to56 = OutputStruct.FilteredList;
        
EstimatedParamMCOutputArray29to56 = ComputeConfidenceLimits(...
    UnsortedEstimatedParamVals29to56, nBins);

EstimatedParams29to56 = [EstimatedParamMCOutputArray29to56(1).SampleAverage, ...
     EstimatedParamMCOutputArray29to56(2).SampleAverage, ...
     EstimatedParamMCOutputArray29to56(3).SampleAverage, ...
     EstimatedParamMCOutputArray29to56(4).SampleAverage];

SatModDeviance29to56 = ComputeDeviance4( ...
    FourParamStruct29to56.DataPoints(1,:), ...
    FourParamStruct29to56.DataPoints(2,:), ...
    FourParamStruct29to56.NumTrialsPerSOA, ...
    EstimatedParams29to56);
 
DevianceDistributionStruct29to56 = FourParamDevianceMonteCarlo( ...
    FourParamStruct29to56.DataPoints(1,:), ...
    FourParamStruct29to56.NumTrialsPerSOA, ...
    EstimatedParams29to56, nIterations, nBins);

Stim3ParamList{2}.Params = EstimatedParams29to56;

Stim3ParamList{2}.StdErr = [EstimatedParamMCOutputArray29to56(1).StdErrRange, ...
     EstimatedParamMCOutputArray29to56(2).StdErrRange, ...
     EstimatedParamMCOutputArray29to56(3).StdErrRange, ...
     EstimatedParamMCOutputArray29to56(4).StdErrRange]; 
 

%%%%%%%%%%%%%%%%%%%%  Conditions 57 to 84 Run Block %%%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 57:84;

FourParamStruct57to84 = ConcatenateDataFiles4Param(path, filenames, ...
        SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals57to84 = 
    EstimatedFourParameterMonteCarlo(FourParamStruct57to84.DataPoints(2,:), ... 
           FourParamStruct57to84.DataPoints(1,:), ...
           FourParamStruct57to84.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals57to84, 1);

UnsortedEstimatedParamVals57to84 = OutputStruct.FilteredList;

        
        
EstimatedParamMCOutputArray57to84 = ...
    ComputeConfidenceLimits(UnsortedEstimatedParamVals57to84, nBins);

EstimatedParams57to84 = ...
    [EstimatedParamMCOutputArray57to84(1).SampleAverage, ...
     EstimatedParamMCOutputArray57to84(2).SampleAverage, ...
     EstimatedParamMCOutputArray57to84(3).SampleAverage, ...
     EstimatedParamMCOutputArray57to84(4).SampleAverage];
 
SatModDeviance57to84 = ComputeDeviance4( ...
    FourParamStruct57to84.DataPoints(1,:), ...
    FourParamStruct57to84.DataPoints(2,:), ...
    FourParamStruct57to84.NumTrialsPerSOA, ...
    EstimatedParams57to84)
 
DevianceDistributionStruct57to84 = ...
    FourParamDevianceMonteCarlo(FourParamStruct57to84.DataPoints(1,:), ... 
        FourParamStruct57to84.NumTrialsPerSOA, ...
        EstimatedParams57to84, nIterations, nBins);

Stim3ParamList{3}.Params = EstimatedParams57to84;

Stim3ParamList{3}.StdErr = ...
    [EstimatedParamMCOutputArray57to84(1).StdErrRange, ...
     EstimatedParamMCOutputArray57to84(2).StdErrRange, ...
     EstimatedParamMCOutputArray57to84(3).StdErrRange, ...
     EstimatedParamMCOutputArray57to84(4).StdErrRange];

 %%%%%%%%%%%%%%%%%%%%  Conditions 85 to 112 Run Block %%%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 85:112;

FourParamStruct85to112 = ConcatenateDataFiles4Param(path, filenames, ...
        SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals85to112 = EstimatedFourParameterMonteCarlo(...
           FourParamStruct85to112.DataPoints(2,:), ... 
           FourParamStruct85to112.DataPoints(1,:), ...
           FourParamStruct85to112.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals85to112, 1);

UnsortedEstimatedParamVals85to112 = OutputStruct.FilteredList;

        
        
EstimatedParamMCOutputArray85to112 = ComputeConfidenceLimits( ...
    UnsortedEstimatedParamVals85to112, nBins);

EstimatedParams85to112 = [EstimatedParamMCOutputArray85to112(1).SampleAverage, ...
     EstimatedParamMCOutputArray85to112(2).SampleAverage, ...
     EstimatedParamMCOutputArray85to112(3).SampleAverage, ...
     EstimatedParamMCOutputArray85to112(4).SampleAverage];
 
SatModDeviance85to112 = ComputeDeviance4( ...
    FourParamStruct85to112.DataPoints(1,:), ...
    FourParamStruct85to112.DataPoints(2,:), ...
    FourParamStruct85to112.NumTrialsPerSOA, ...
    EstimatedParams85to112)
 
DevianceDistributionStruct85to112 = FourParamDevianceMonteCarlo( ...
    FourParamStruct85to112.DataPoints(1,:), ... 
        FourParamStruct85to112.NumTrialsPerSOA, ...
        EstimatedParams85to112, nIterations, nBins);

Stim3ParamList{4}.Params = EstimatedParams85to112;

Stim3ParamList{4}.StdErr = [EstimatedParamMCOutputArray85to112(1).StdErrRange, ...
     EstimatedParamMCOutputArray85to112(2).StdErrRange, ...
     EstimatedParamMCOutputArray85to112(3).StdErrRange, ...
     EstimatedParamMCOutputArray85to112(4).StdErrRange];
 

 %%%%%%%%%%%%%%%%%%%%  Conditions 113 to 140 Run Block %%%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 113:140;

FourParamStruct113to140 = ConcatenateDataFiles4Param(path, filenames, ...
        SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals113to140 = EstimatedFourParameterMonteCarlo( ...
           FourParamStruct113to140.DataPoints(2,:), ... 
           FourParamStruct113to140.DataPoints(1,:), ...
           FourParamStruct113to140.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals113to140, 1);

UnsortedEstimatedParamVals113to140 = OutputStruct.FilteredList;
        
        
EstimatedParamMCOutputArray113to140 = ComputeConfidenceLimits( ...
    UnsortedEstimatedParamVals113to140, nBins);

EstimatedParams113to140 = [EstimatedParamMCOutputArray113to140(1).SampleAverage, ...
     EstimatedParamMCOutputArray113to140(2).SampleAverage, ...
     EstimatedParamMCOutputArray113to140(3).SampleAverage, ...
     EstimatedParamMCOutputArray113to140(4).SampleAverage];
 
SatModDeviance113to140 = ComputeDeviance4( ...
    FourParamStruct113to140.DataPoints(1,:), ...
    FourParamStruct113to140.DataPoints(2,:), ...
    FourParamStruct113to140.NumTrialsPerSOA, ...
    EstimatedParams113to140)
 
DevianceDistributionStruct113to140 = FourParamDevianceMonteCarlo( ...
        FourParamStruct113to140.DataPoints(1,:), ... 
        FourParamStruct113to140.NumTrialsPerSOA, ...
        EstimatedParams113to140, nIterations, nBins);

Stim3ParamList{5}.Params = EstimatedParams113to140;

Stim3ParamList{5}.StdErr = [EstimatedParamMCOutputArray113to140(1).StdErrRange, ...
     EstimatedParamMCOutputArray113to140(2).StdErrRange, ...
     EstimatedParamMCOutputArray113to140(3).StdErrRange, ...
     EstimatedParamMCOutputArray113to140(4).StdErrRange];
 
 
%%%%%%%%%%%%  Conditions 1 to 140 Run Block %%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 1:140;

FourParamStruct1to140 = ConcatenateDataFiles4Param(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, LastTrialList);

UnsortedEstimatedParamVals1to140 = EstimatedFourParameterMonteCarlo(...
           FourParamStruct1to140.DataPoints(2,:), ... 
           FourParamStruct1to140.DataPoints(1,:), ...
           FourParamStruct1to140.NumTrialsPerSOA, nIterations, nBins);

OutputStruct = RemoveOutlierEntries( ...
    UnsortedEstimatedParamVals1to140, 1);

UnsortedEstimatedParamVals1to140 = OutputStruct.FilteredList;
        
EstimatedParamMCOutputArray1to140 = ComputeConfidenceLimits(...
    UnsortedEstimatedParamVals1to140, nBins);

EstimatedParams1to140 = [EstimatedParamMCOutputArray1to140(1).SampleAverage, ...
     EstimatedParamMCOutputArray1to140(2).SampleAverage, ...
     EstimatedParamMCOutputArray1to140(3).SampleAverage, ...
     EstimatedParamMCOutputArray1to140(4).SampleAverage];

SatModDeviance1to140 = ComputeDeviance4( ...
    FourParamStruct1to140.DataPoints(1,:), ...
    FourParamStruct1to140.DataPoints(2,:), ...
    FourParamStruct1to140.NumTrialsPerSOA, ...
    EstimatedParams1to140);
 
DevianceDistributionStruct1to140 = FourParamDevianceMonteCarlo( ...
    FourParamStruct1to140.DataPoints(1,:), ...
    FourParamStruct1to140.NumTrialsPerSOA, ...
    EstimatedParams1to140, nIterations, nBins);

Stim3ParamList{1}.Params = EstimatedParams1to140;

Stim3ParamList{1}.StdErr = [EstimatedParamMCOutputArray1to140(1).StdErrRange, ...
     EstimatedParamMCOutputArray1to140(2).StdErrRange, ...
     EstimatedParamMCOutputArray1to140(3).StdErrRange, ...
     EstimatedParamMCOutputArray1to140(4).StdErrRange]; 
 
% EmpericalDataPoints = FourParamStruct1to28.DataPoints(2,:);
% SOAs = FourParamStruct1to28.DataPoints(1,:);
% nSamplesPerSOA = FourParamStruct1to28.NumTrialsPerSOA;
% nIterations = 2000;
% nBins = 10;
% EstimatedParamMC1to28Array = EstimatedFourParameterMonteCarlo(EmpericalDataPoints, SOAs, nSamplesPerSOA, nIterations, nBins);
% 
% 
% EmpericalDataPoints = FourParamStruct29to56.DataPoints(2,:);
% SOAs = FourParamStruct29to56.DataPoints(1,:);
% nSamplesPerSOA = FourParamStruct29to56.NumTrialsPerSOA;
% nIterations = 2000;
% nBins = 10;
% EstimatedParamMC29to56Array = EstimatedFourParameterMonteCarlo(EmpericalDataPoints, SOAs, nSamplesPerSOA, nIterations, nBins);
% 
% 
% EmpericalDataPoints = FourParamStruct57to84.DataPoints(2,:);
% SOAs = FourParamStruct57to84.DataPoints(1,:);
% nSamplesPerSOA = FourParamStruct57to84.NumTrialsPerSOA;
% nIterations = 2000;
% nBins = 10;
% EstimatedParamMC57to84Array = EstimatedFourParameterMonteCarlo(EmpericalDataPoints, SOAs, nSamplesPerSOA, nIterations, nBins);
% 
% 
% EmpericalDataPoints = FourParamStruct85to112.DataPoints(2,:);
% SOAs = FourParamStruct85to112.DataPoints(1,:);
% nSamplesPerSOA = FourParamStruct85to112.NumTrialsPerSOA;
% nIterations = 2000;
% nBins = 10;
% EstimatedParamMC85to112Array = EstimatedFourParameterMonteCarlo(EmpericalDataPoints, SOAs, nSamplesPerSOA, nIterations, nBins);
% 
% 
% EmpericalDataPoints = FourParamStruct113to140.DataPoints(2,:);
% SOAs = FourParamStruct113to140.DataPoints(1,:);
% nSamplesPerSOA = FourParamStruct113to140.NumTrialsPerSOA;
% nIterations = 2000;
% nBins = 10;
% EstimatedParamMC113to140Array = EstimatedFourParameterMonteCarlo(EmpericalDataPoints, SOAs, nSamplesPerSOA, nIterations, nBins);