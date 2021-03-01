function [ind_image, cmap] = rgb2indexed(rgb_image, nColors)

    cmap = colormap(RGB(nColors));
    
    diff = nonzeros(cmap(2,:) - cmap(1,:));
    
    [nRows, nColumns, junk] = size(rgb_image);
    
    ind_image = zeros([nRows, nColumns]);
    
    TotalPixels = nRows*nColumns;
    
    ConvCount = 0;
    
    for i = 1:nRows
        
        for j = 1:nColumns
            
            test = cmap(1,:);
            rgb_vec = squeeze(rgb_image(i,j,:))';
%            fprintf('.\n');
            
            for k = 1:nColors
                                
                
                if (sum((rgb_vec - cmap(k,:)).^2) < sum((rgb_vec - test).^2))
                    
                    test = cmap(k,:);
                    ind_image(i,j) = k;
                                        
                end

            end;
            
            ConvCount = ConvCount + 1;
            if (mod(ConvCount,500) == 0)
                fprintf('%d out of %d pixels have been converted.\n', ConvCount, TotalPixels);
            end
         
        end

    end

end