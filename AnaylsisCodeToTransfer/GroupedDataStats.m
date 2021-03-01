function [mean, variance] = GroupedDataStats(BinCenters, Frequencies)
    
    BinCenters = BinCenters(:);
    Frequencies = Frequencies(:);
    
    N = sum(Frequencies);
    
    InnerProduct = Frequencies'*BinCenters;
    
    xSquaredInnerProduct = Frequencies'*(BinCenters.^2);
    
    mean = InnerProduct/N;
    
    variance = (N*xSquaredInnerProduct - InnerProduct^2)/(N*(N-1));
    
end