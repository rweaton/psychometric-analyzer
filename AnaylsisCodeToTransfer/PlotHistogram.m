function [BinCenters, BinBounds, Frequencies] = PlotHistogram(Data, Binsize)

    BinBounds = (min(Data)-Binsize):Binsize:(max(Data)+Binsize);
    
    [Frequencies, Bins] = histc(Data, BinBounds);
    
    BinCenters = BinBounds + (1/2)*Binsize*ones(size(BinBounds));
    
%     size(Frequencies);
%     size(BinCenters);
    
     %figure;
     bar(BinCenters, Frequencies);

end