function Mask = GenerateRGBRandomizedPixelMask(Im1, Im2, W1, W2)
    

    if (size(Im1) ~= size(Im2))
        fprintf('Images must be of equal size.');
    end;
    
    Im1 = double(Im1)/255;
    Im2 = double(Im2)/255;
    
    [xSize, ySize, zSize] = size(Im1);
    Mask = zeros([xSize, ySize, zSize]);
    
    CriterionMatrix = abs(W1)/(abs(W1) + abs(W2))*ones([xSize, ySize]);
        
    SelectionMatrix = (rand([xSize, ySize]) > CriterionMatrix);
    
    for i = 1:xSize
       for j = 1:ySize
           
           if SelectionMatrix(i, j) == 0
            Mask(i, j, :) = Im1(i, j, :);
           else
            Mask(i, j, :) = Im2(i, j, :);
           end
           
       end
    end;
     
end