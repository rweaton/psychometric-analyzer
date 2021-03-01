function [FilteredSOAs, FilteredResps] = FilterDataset(SOAs, BinaryResps, SOAs2Filter)

    EndIndex = length(SOAs);
    FilteredSOAs = [];
    FilteredResps = [];
    
    for j = 1:EndIndex
        
       if ~ismember(SOAs(j), SOAs2Filter)
       
           FilteredSOAs = [FilteredSOAs, SOAs(j)];
           
           FilteredResps = [FilteredResps, BinaryResps(j)];
           
       end
           
           
    end
    

end