function AvgABrgb = GenerateAndPlotAvgRGBValueImage(Im1Name, Im2Name)

% Images Im1Name and Im2Name must be exactly the same size
% Function currently set to read in jpg formatted images
% Function writes generated image to current directory

A = imread(Im1Name,'jpg')
B = imread(Im2Name,'jpg');

Argb = double(A)/255;
Brgb = double(B)/255;



AvgABrgb = (Argb+Brgb)/2;
imwrite(AvgABrgb,[Im1Name,'+',Im2Name,'Avg.jpg'],'jpg');

image(AvgABrgb); axis image; axis off;

end