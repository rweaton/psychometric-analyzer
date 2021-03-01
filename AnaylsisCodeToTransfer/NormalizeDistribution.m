function Output = NormalizeDistribution(Frequencies, BinLimits)


    %  Note:  BinLimits needs to be one element longer than Frequencies
    %         The additional element is the right bin boundary of the
    %         final frequency group
    
    
    Frequencies = Frequencies(:);
    
    BinLimits = BinLimits(:);
    
    BinWidths = abs(diff(BinLimits));
    %TotalAreaOfDistn = Frequencies'*BinWidths;
    %Output = (1/TotalAreaOfDistn)*Frequencies;
    Output = Frequencies/sum(Frequencies);
    

end