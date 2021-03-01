function Probability = FindProbFromCumulative(n, k, DataProportion)

    function y = CumulativeProb(p1, n1, k1)

        OnesVec = ones(size(p1));
    
        y = OnesVec - betainc(p1, k1+1, n1-k1);

    end;
    
    function DiffSquared = FuncToMinimize(p2)
        
        DiffSquared = (DataProportion - feval(@CumulativeProb, p2, n, k))^2
        
    end;
    
%     feval(@FuncToMinimize, .5)
%     feval(@betainc, .5, 301, 200)
%     feval(@CumulativeProb, .5, 500, 300)
     
    Probability = fminsearch(@FuncToMinimize, .5);

end