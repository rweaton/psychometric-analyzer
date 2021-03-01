% % Test for Perceptual Learning Runscript

%FitParams = FitParams1to140;
FitParams = FitParams57to84;
nIterations = 5000;
nBins = 50;

path = '/Users/thug/Documents/JagadeeshRotation/GabeData/';
%ConditionsToInclude = 1:140;
ConditionsToInclude = 57:84;
%MaskTypeDelimitingConditions = [1, 29, 57, 85, 113];
MaskTypeDelimitingConditions = 57;
SOAsToInclude = [0 20 40 80 160 320];
LastTrialList = [10000 10000 10000 10000 10000];

filename = {'GBSOAM13/GBSOAM13.1'};
FourParamStructT1 = ConcatenateDataFiles4Param( ...
    path, filename, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

EmpericalProportionsArray(1,:) = FourParamStructT1.DataPoints(2,:);
NumSamplesArray(1,:) = FourParamStructT1.NumTrialsPerSOA;
SOAs = FourParamStructT1.DataPoints(1,:);

filename = {'GBSOAM13/GBSOAM13.2'};
FourParamStructT2 = ConcatenateDataFiles4Param( ...
    path, filename, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

EmpericalProportionsArray(2,:) = FourParamStructT2.DataPoints(2,:);
NumSamplesArray(2,:) = FourParamStructT2.NumTrialsPerSOA;


filename = {'GBSOAM13/GBSOAM13.3'};
FourParamStructT3 = ConcatenateDataFiles4Param( ...
    path, filename, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

EmpericalProportionsArray(3,:) = FourParamStructT3.DataPoints(2,:);
NumSamplesArray(3,:) = FourParamStructT3.NumTrialsPerSOA;


filename = {'GBSOAM13/GBSOAM13.4'};
FourParamStructT4 = ConcatenateDataFiles4Param( ...
    path, filename, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

EmpericalProportionsArray(4,:) = FourParamStructT4.DataPoints(2,:);
NumSamplesArray(4,:) = FourParamStructT4.NumTrialsPerSOA;


filename = {'GBSOAM13/GBSOAM13.5'};
FourParamStructT5 = ConcatenateDataFiles4Param( ...
    path, filename, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

EmpericalProportionsArray(5,:) = FourParamStructT5.DataPoints(2,:);
NumSamplesArray(5,:) = FourParamStructT5.NumTrialsPerSOA;


warning off all;

SimulatedCorrCoeffDistributionsBySOA = TimeCorrolationMCSimulator( ...
    SOAs, EmpericalProportionsArray, NumSamplesArray, FitParams, nIterations);

%warning on all;

TimeIndexCorrolationStatsCellArray = ComputeConfidenceLimitsSAFE( ...
   SimulatedCorrCoeffDistributionsBySOA, nBins);

clear EmpericalDevianceResidualsArray;

%warning off all;
for j = 1:5
    
    OutputStruct = ComputePointwiseDevianceResiduals( ...
         SOAs, EmpericalProportionsArray(j,:), NumSamplesArray(j,:), FitParams); 
     
     EmpericalDevianceResidualsArray(j,:) = OutputStruct.DevianceResiduals;
    
end;

warning on all;
clear OutputStruct;

for ll = 1:length(SOAs)
           
     CorrCoeffOutput = corrcoef(1:5, abs(EmpericalDevianceResidualsArray(:,ll)));
     % Absolute value added to correlate deviance deflection
     % magnitudes with time - instead of signed deviance residuals.
     EmpericalCorrCoeffArray(1,ll) = CorrCoeffOutput(1,2);
            
end;