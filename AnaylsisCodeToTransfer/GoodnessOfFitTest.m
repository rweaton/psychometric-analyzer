function [ChiSquaredAlpha, NullHyp] = GoodnessOfFitTest(ChiSquaredStatistic, DegreesOfFreedom, LevelOfSignificance)

    % Null Hypothesis:          Random variable (SOA) has logistic distribution with the fitted parameters.
    % Alternative Hypothesis:   Random variable does not have the fitted logistic distribution.
    % Level of Significance:    Must be expressed as a fraction.
    %                           Alpha = 1 - LevelOfSignificance
    % Criterion:                Reject the null hypothesis if:
    %
    %                          ChiSquaredStatistic > ChiSquared_Alpha
    %                            
    %                           where ChiSquaredAlpha is the integral of
    %                           the ChiSquared distribution (over the domain 
    %                           [0, Alpha]) for the specified degrees of 
    %                           freedom.
    %                           
    %                           ChiSquaredStatistic (Hosmer-Lemeshow 
    %                           Goodness of Fit Stat or Deviance) between 
    %                           the observed data and the predicted, or 
    %                           fitted, values.
    
    a = DegreesOfFreedom/2;
    NullHyp = 1;
    
    function Output = ChiSquaredDistribution(x);
        
        xLength = length(x);
        
        for k = 1:xLength
            if x(k) < 0
               x(k) = 0; 
            end
        end;
        
        alpha = DegreesOfFreedom;
        
        OnesVec = ones(size(x));
        
        Output = (OnesVec./((2^a).*gamma(a))).*(x.^(a-1)).*exp(-x/2);
      
        
    end;
    
    ChiSquaredAlpha = quad(@ChiSquaredDistribution, 0, LevelOfSignificance);
    
    if ChiSquaredStatistic > ChiSquaredAlpha
        NullHyp = 0;
    end
   

end