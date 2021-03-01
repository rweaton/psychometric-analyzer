function RGB8 = TrueColor2RGB8(ImageArray)
    RGB8 = (double(ImageArray) + ones(size(ImageArray)))/256;
end