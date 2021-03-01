function List = ExtractUniqueEntries(xlsFilePath)
    
    [num, text, FullList] = xlsread(xlsFilePath);
    
    [nRows, nColumns] = size(FullList)
    
    % Crop headers and row numbers
    subarray = FullList(2:nRows, 2:nColumns);
    
    % Convert numerical cells into string cells 
    for i = 1:(nRows - 1)
       
        ConvertedArray{i,1} = num2str(subarray{i,1}(1,1));
        ConvertedArray{i,2} = num2str(subarray{i,2}(1,1));
        ConvertedArray{i,3} = eval(subarray{i,3});
        
        subarray{i,1} = [ConvertedArray{i,1}, '.bmp'];
        subarray{i,2} = [ConvertedArray{i,2}, '.bmp'];
        subarray{i,3} = [ConvertedArray{i,3}, '.bmp'];
        
        CompVec{i,1} = [subarray{i,1},subarray{i,2},subarray{i,3}];
        
    end;
        
    [stuff, m, n] = unique(CompVec);
    
    for j = 1:length(m)
        
       List{j,1} = subarray{m(j),1};
       List{j,2} = subarray{m(j),2};
       List{j,3} = subarray{m(j),3};
       
    end

end