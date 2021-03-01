function y = CumulativeProb(p, n, k)

    OnesVec = size(p);
    
    y = OnesVec - betainc(p, k+1, n-k);

end