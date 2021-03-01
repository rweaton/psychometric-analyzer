function PValue = PValCalculator(ZStat, alpha)
    
    IntegrationCeiling = 10;
    
    -sqrt(2)*erfcinv(2*alpha)
    
    function ProbDensity = NormalDistribution(z)
       
        ProbDensity = (1/sqrt(2*pi))*exp(-z.^2/2);
    
    end;
    
    PValue = quad(@NormalDistribution, abs(ZStat), IntegrationCeiling);
    
end