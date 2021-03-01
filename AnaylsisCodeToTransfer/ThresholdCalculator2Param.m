function Thresholds = ThresholdCalculator2Param(Params, ThreshLevel)
    
    [nEntries, nParams] = size(Params);
    OnesVec = ones([nEntries, 1]);
    Thresholds = (OnesVec*log(ThreshLevel/(1-ThreshLevel)) - Params(:,1))./Params(:,2);
    
end