function Thresholds = ThresholdCalculator4Param(Params, ThreshLevel)
    
    [nEntries, nParams] = size(Params);
    OnesVec = ones([nEntries, 1]);
    
    RescaledThrLvls = (ThreshLevel*OnesVec - Params(:,3))./(Params(:,4) - Params(:,3));
    
    Thresholds = (log(RescaledThrLvls./(OnesVec - RescaledThrLvls)) - Params(:,1)) ./ Params(:,2);
    
end