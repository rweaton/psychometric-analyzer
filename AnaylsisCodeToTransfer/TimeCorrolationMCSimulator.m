function  CorrCoeffDistributionsForSOAs = TimeCorrolationMCSimulator(SOAs, DataPointsArray, NumSamplesArray, FitParams, nIterations)
    
    %  This function creates Monte Carlo generated distribtions of
    %  data point proportions, and with these, distributions associated
    %  deviance residuals. Using these simulated deviance residuals, it 
    %  then computes the distributions of corresponding time-correlation 
    %  coefficients from which time-correlation significance can be determined.
    
    %  Monte Carlo simulated proportions are determined by summing the same
    %  number of randomly generated numbers whose values are less than the
    %  observed proportion chose B values.  In each iteration: 1) an array of Monte 
    %  Carlo generated proportions (each column containing the simulated 
    %  proportions for each SOA listed in the input arguement 'SOAs' 
    %  and each row representing the simulated proportions for each time 
    %  index) was generated, 2) Deviance residuals of the simulated proportions
    %  were then computed so that, 3) Correlation coefficients for the 
    %  absolute value of each column were calculated.  
    
    %  Each column of the output arguement 'CorrCoeffDistributionForSOAs'
    %  contains the corresponding correlation coeffiecients for each SOA.
    %  Each row are those values simulated for a particular iteration.
 
   
    
    
    nSOAs = length(SOAs);

    [nTimeIndices, nDataPoints] = size(DataPointsArray);
    
    CorrCoeffDistributionsForSOAs = NaN*ones([nIterations, nDataPoints]);
    
    TimeIndices = (1:nTimeIndices);

    for j = 1:nIterations
        
        DevianceResidualsArray = NaN*ones([nTimeIndices, nDataPoints]);
        
        for k = 1:nTimeIndices
            
            SimulatedDataPoints = NaN*ones([nSOAs,1]);
            
            for ll = 1:nSOAs
                
                Criterion = DataPointsArray(k,ll);
                
                SimulatedProportion = sum( ...
                    (rand([1,NumSamplesArray(k,ll)]) < Criterion))/NumSamplesArray(k,ll);
                
                SimulatedDataPoints(ll) = SimulatedProportion;
                
            end;
        
            
            DevianceStruct = ComputePointwiseDevianceResiduals( ...
                SOAs, SimulatedDataPoints, NumSamplesArray(k,:), FitParams); 
            
            DevianceResidualsArray(k,:) = (DevianceStruct.DevianceResiduals)';
            
        end;
        
        for ll = 1:nSOAs
           
            CorrCoeffOutput = corrcoef(TimeIndices, abs(DevianceResidualsArray(:,ll)));
            % Absolute value added to correlate deviance deflection
            % magnitudes with time instead of signed deviance residuals.
            CorrCoeffArray(1,ll) = CorrCoeffOutput(1,2);
            
        end;
        
        
        CorrCoeffDistributionsForSOAs(j,:) = CorrCoeffArray;
    
    end
    
   
end


