function StatStruc = RunTtests(StatList, StatListSEs)

    StatList = StatList(:);
    StatListSEs = StatListSEs(:);

    alpha = 0.025;
    delta = 0;

    Criterion = -sqrt(2)*erfcinv(2*alpha)
    
    nItems = length(StatList);
    
    for j = 1:nItems
       
        for k = 1:nItems
            
            TestStatsMat(j,k) = CalcZStatistic(StatList(j,1), StatList(k,1), StatListSEs(j,1), StatListSEs(k,1), delta);
            PValuesMat(j,k) = .5*erfc(-TestStatsMat(j,k)/sqrt(2));
            
        end
        
    end;
    
    SigMat = abs(TestStatsMat) >= abs(Criterion)*ones(size(TestStatsMat));
    
    StatStruc.TestStats = TestStatsMat;
    StatStruc.PValuesMat = PValuesMat;
    StatStruc.Significance = SigMat;

end