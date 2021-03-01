% % Generate Rise Times plot
% 113 to 140
RiseTime113to140 = log(9)/EstimatedParamMCOutputArray113to140(2).SampleAverage;
RiseTimeFloor113to140 = log(9)/EstimatedParamMCOutputArray113to140(2).Conf68Limit;
RiseTimeCeil113to140 = log(9)/EstimatedParamMCOutputArray113to140(2).Conf32Limit;


RiseTimesArray(1) = RiseTime113to140;
RiseTimeCeilBarsArray(1) = (RiseTimeCeil113to140 - RiseTime113to140);
RiseTimeFloorBarsArray(1) =  (RiseTime113to140 - RiseTimeFloor113to140);

% 85 to 112

RiseTime85to112 = log(9)/EstimatedParamMCOutputArray85to112(2).SampleAverage;
RiseTimeFloor85to112 = log(9)/EstimatedParamMCOutputArray85to112(2).Conf68Limit;
RiseTimeCeil85to112 = log(9)/EstimatedParamMCOutputArray85to112(2).Conf32Limit;


RiseTimesArray(2) = RiseTime85to112;
RiseTimeCeilBarsArray(2) = RiseTimeCeil85to112 - RiseTime85to112;
RiseTimeFloorBarsArray(2) = RiseTime85to112 - RiseTimeFloor85to112;

% 1 to 28

RiseTime1to28 = log(9)/EstimatedParamMCOutputArray1to28(2).SampleAverage;
RiseTimeFloor1to28 = log(9)/EstimatedParamMCOutputArray1to28(2).Conf68Limit;
RiseTimeCeil1to28 = log(9)/EstimatedParamMCOutputArray1to28(2).Conf32Limit;


RiseTimesArray(3) = RiseTime1to28;
RiseTimeCeilBarsArray(3) = RiseTimeCeil1to28 - RiseTime1to28;
RiseTimeFloorBarsArray(3) = RiseTime1to28 - RiseTimeFloor1to28;

% 29 to 56

RiseTime29to56 = log(9)/EstimatedParamMCOutputArray29to56(2).SampleAverage;
RiseTimeFloor29to56 = log(9)/EstimatedParamMCOutputArray29to56(2).Conf68Limit;
RiseTimeCeil29to56 = log(9)/EstimatedParamMCOutputArray29to56(2).Conf32Limit;


RiseTimesArray(4) = RiseTime29to56;
RiseTimeCeilBarsArray(4) = RiseTimeCeil29to56 - RiseTime29to56;
RiseTimeFloorBarsArray(4) = RiseTime29to56 - RiseTimeFloor29to56;

% 57 to 84

RiseTime57to84 = log(9)/EstimatedParamMCOutputArray57to84(2).SampleAverage;
RiseTimeFloor57to84 = log(9)/EstimatedParamMCOutputArray57to84(2).Conf68Limit;
RiseTimeCeil57to84 = log(9)/EstimatedParamMCOutputArray57to84(2).Conf32Limit;


RiseTimesArray(5) = RiseTime57to84;
RiseTimeCeilBarsArray(5) = RiseTimeCeil57to84 - RiseTime57to84;
RiseTimeFloorBarsArray(5) = RiseTime57to84 - RiseTimeFloor57to84;

% 1 to 140

RiseTime1to140 = log(9)/EstimatedParamMCOutputArray1to140(2).SampleAverage;
RiseTimeFloor1to140 = log(9)/EstimatedParamMCOutputArray1to140(2).Conf68Limit;
RiseTimeCeil1to140 = log(9)/EstimatedParamMCOutputArray1to140(2).Conf32Limit;


RiseTimesArray(6) = RiseTime1to140;
RiseTimeCeilBarsArray(6) = RiseTimeCeil1to140 - RiseTime1to140;
RiseTimeFloorBarsArray(6) = RiseTime1to140 - RiseTimeFloor1to140;

% RiseTimesArray = BehRspTimeMeans;
% RiseTimeCeilBarsArray = BehRspTimeCeils - BehRspTimeMeans;
% RiseTimeFloorBarsArray = BehRspTimeFloors - BehRspTimeMeans;

PlotHeight = max(RiseTimeCeilBarsArray + RiseTimesArray);
figure; hold on;
axis([0 7 0 PlotHeight]);

xlabel('Mask Type', 'FontSize', 20);
ylabel('Rise Times (ms SOA)', 'FontSize', 20);
title('Adj. 25% to 75% Threshold Rise Times', 'FontSize', 24);

for j = 1:6
    
    bar(j,RiseTimesArray(j),'k');
    errorbar(j, RiseTimesArray(j), RiseTimeFloorBarsArray(j), RiseTimeCeilBarsArray(j), 'ko');
   
    
end;

Labels = {'No Mask', 'Arbitrary', 'Scrambled', 'Fourier', 'Rndm Pixel', 'All'};
set(gca, 'XTick', 1:6);
set(gca, 'XTickLabel', Labels, 'FontSize', 12);