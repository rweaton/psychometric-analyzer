function DevianceDistributionStruct = FourParamDevianceMonteCarlo(SOAs, nSamplesPerSOA, Params, nIterations, nBins)
    
    % This function generates the distribution of the Monte Carlo simulated
    % Deviance summary statistic for the given curve fit specified in the
    % input arguement 'Params'.  This function should be run after simulation
    % of curve fit paramters 'EstimatedFourParameterMonteCarlo' and each
    % value of 'Params' should be corresponding mean of each output
    % distribution for each parameter.
    
    nSOAs = length(SOAs);
    
    ModelVals = get_4parm_fit_vals(Params, SOAs);
    
    UnsortedDevianceVals = NaN*ones([nIterations,1]);
    
    warning off all;
    
    for j = 1:nIterations
        
        for k = 1:nSOAs
            
            Criterion = ModelVals(k)*ones([1,nSamplesPerSOA(k)]);
            
            DataPoints(k) = sum(rand([1,nSamplesPerSOA(k)]) < Criterion)/sum(nSamplesPerSOA(k));
            
        end;
        
        UnsortedDevianceVals(j,1) = ComputeDeviance4(SOAs, DataPoints, nSamplesPerSOA, Params);
        
    end;
    
    warning on all;
    
    UnsortedDevianceVals = FilterOutNaNs(UnsortedDevianceVals);
    
    Binsize = (max(UnsortedDevianceVals) - min(UnsortedDevianceVals))/nBins;
    
    [BinCenters, BinBounds, DevianceFrequencies] = PlotHistogram(UnsortedDevianceVals, Binsize);
    DevianceHistogram = NormalizeDistribution(DevianceFrequencies,[BinBounds, BinBounds(length(BinBounds))+Binsize]);
    
    SortedDevianceVals = sortrows(UnsortedDevianceVals);
    NormalizedSortedDevianceVals = SortedDevianceVals/sum(UnsortedDevianceVals);
    
    CumulativeDeviance(1) = NormalizedSortedDevianceVals(1);
    
    for ll = 2:length(NormalizedSortedDevianceVals)
        
        CumulativeDeviance(ll) = CumulativeDeviance(ll-1) + NormalizedSortedDevianceVals(ll);
        
    end;
    
    Conf95Value = interp1(CumulativeDeviance, SortedDevianceVals, 0.95);
    
    
    DevianceDistributionStruct.NormalizedDevianceHistogram = DevianceHistogram'; 
    DevianceDistributionStruct.BinCenters = BinCenters;
    DevianceDistributionStruct.BinSize = Binsize;
    DevianceDistributionStruct.NormalizedCumulativeDeviance = CumulativeDeviance;
    DevianceDistributionStruct.SortedDevianceValues = SortedDevianceVals';
    DevianceDistributionStruct.Conf95Value = Conf95Value;
    


end