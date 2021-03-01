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
           
nBins = 20;

%%%%%%%%%%%%%%%%%%  Conditions 1 to 28 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 1:28;
MaskTypeDelimitingConditions = 1;
DataStruct1to28 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

BehavioralResponseTimeConfInts1to28 = ComputeConfidenceLimitsSAFE(...
    DataStruct1to28.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(3) = BehavioralResponseTimeConfInts1to28.SampleAverage;
BehRspTimeCeils(3) = BehavioralResponseTimeConfInts1to28.Conf68Limit;
BehRspTimeFloors(3) = BehavioralResponseTimeConfInts1to28.Conf32Limit;

%%%%%%%%%%%%%%%%%%  Conditions 29 to 56 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 29:56;
MaskTypeDelimitingConditions = 29;
DataStruct29to56 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

BehavioralResponseTimeConfInts29to56 = ComputeConfidenceLimitsSAFE(...
    DataStruct29to56.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(4) = BehavioralResponseTimeConfInts29to56.SampleAverage;
BehRspTimeCeils(4) = BehavioralResponseTimeConfInts29to56.Conf68Limit;
BehRspTimeFloors(4) = BehavioralResponseTimeConfInts29to56.Conf32Limit;

%%%%%%%%%%%%%%%%%%  Conditions 57 to 84 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 57:84;
MaskTypeDelimitingConditions = 57;
DataStruct57to84 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

BehavioralResponseTimeConfInts57to84 = ComputeConfidenceLimitsSAFE(...
    DataStruct57to84.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(5) = BehavioralResponseTimeConfInts57to84.SampleAverage;
BehRspTimeCeils(5) = BehavioralResponseTimeConfInts57to84.Conf68Limit;
BehRspTimeFloors(5) = BehavioralResponseTimeConfInts57to84.Conf32Limit;

%%%%%%%%%%%%%%%%%%  Conditions 85 to 112 Run Block %%%%%%%%%%%%%%%%%%%%%
      
ConditionsToInclude = 85:112;
MaskTypeDelimitingConditions = 85;
DataStruct85to112 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

BehavioralResponseTimeConfInts85to112 = ComputeConfidenceLimitsSAFE(...
    DataStruct85to112.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(2) = BehavioralResponseTimeConfInts85to112.SampleAverage;
BehRspTimeCeils(2) = BehavioralResponseTimeConfInts85to112.Conf68Limit;
BehRspTimeFloors(2) = BehavioralResponseTimeConfInts85to112.Conf32Limit;

%%%%%%%%%%%%%%%%%%  Conditions 113 to 140 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 113:140;
MaskTypeDelimitingConditions = 113;
DataStruct113to140 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);
  
BehavioralResponseTimeConfInts113to140 = ComputeConfidenceLimitsSAFE(...
    DataStruct113to140.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(1) = BehavioralResponseTimeConfInts113to140.SampleAverage;
BehRspTimeCeils(1) = BehavioralResponseTimeConfInts113to140.Conf68Limit;
BehRspTimeFloors(1) = BehavioralResponseTimeConfInts113to140.Conf32Limit;

%%%%%%%%%%%%%%%%%%  Conditions 1 to 140 Run Block %%%%%%%%%%%%%%%%%%%%%

ConditionsToInclude = 1:140;
MaskTypeDelimitingConditions = [1,29,57,85,113];
DataStruct1to140 = ConcatenateDataFilesExtractBehResp(path, filenames, ...
      SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList);

BehavioralResponseTimeConfInts1to140 = ComputeConfidenceLimitsSAFE(...
    DataStruct1to140.TrialBehavioralResponseTimes, nBins);

BehRspTimeMeans(6) = BehavioralResponseTimeConfInts1to140.SampleAverage;
BehRspTimeCeils(6) = BehavioralResponseTimeConfInts1to140.Conf68Limit;
BehRspTimeFloors(6) = BehavioralResponseTimeConfInts1to140.Conf32Limit;


