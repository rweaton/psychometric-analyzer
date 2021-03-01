function CIvImg = InterleaveRGBImages(CIm1, CIm2, W1, W2)

    clear i;
    
    CIvImg = zeros(size(CIm1));
    
    CIm1 = double(CIm1)/255;
    CIm2 = double(CIm2)/255;
    
    for j = 1:3
        
        Im1FT = fft2(CIm1(:,:,j));
        Im2FT = fft2(CIm2(:,:,j));

        Mag1FT = sqrt(Im1FT.*conj(Im1FT));
        Mag2FT = sqrt(Im2FT.*conj(Im2FT));

        Ang1FT = (-i)*log(Im1FT./Mag1FT);
        Ang2FT = (-i)*log(Im2FT./Mag2FT);
    
        
        CombinedFT = (1/(W1+W2))*(W1*Mag1FT + W2*Mag2FT).*exp(i*(W1*Ang1FT + W2*Ang2FT)/(W1+W2));
        
        CIvImg(:,:,j) = real(ifft2(CombinedFT));
        
        CIvImg(:,:,j) = (CIvImg(:,:,j) - min(min(CIvImg(:,:,j)))*ones(size(CIvImg(:,:,j)))) / (max(max(CIvImg(:,:,j))) - min(min(CIvImg(:,:,j))));
        
    end;
    
    %figure
    %image(CIvImg);
    
end