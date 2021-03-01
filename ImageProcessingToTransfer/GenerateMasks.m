function [Im1FileList, Im2FileList, FMaskFileList, RPMaskFileList, OldMaskFileList] = GenerateMasks(W1, W2, ImgFileList,SrcImgDirPath,FMaskDestDirName,RPMaskDestDirName)

    [nEntries, nColumns] = size(ImgFileList);
    DestParentDir = '/Users/thug/Documents/JagadeeshRotation/ImageSet/';
    mkdir(DestParentDir, FMaskDestDirName);
    mkdir(DestParentDir, RPMaskDestDirName);
    
    for i = 1:nEntries
        
        %Assemble complete file paths
        Fpath1 = [SrcImgDirPath, ImgFileList{i,1}];
        Im1FileList{i,1} = Fpath1;
        
        Fpath2 = [SrcImgDirPath, ImgFileList{i,2}];
        Im2FileList{i,1} = Fpath2;
        
        Im1 = imread(Fpath1,'bmp');
        Im2 = imread(Fpath2,'bmp');
        
        MaskImg = InterleaveRGBImages(Im1, Im2, W1, W2);
        Fname = ['fmsk-', num2str(i),'.bmp'];
        imwrite(MaskImg,[DestParentDir, FMaskDestDirName, '/', Fname],'bmp');
        FMaskFileList{i,1} = [DestParentDir, FMaskDestDirName, '/', Fname];
        
        MaskImg = GenerateRGBRandomizedPixelMask(Im1, Im2, W1, W2);
        Fname = ['rpmsk-', num2str(i),'.bmp'];
        imwrite(MaskImg,[DestParentDir, RPMaskDestDirName, '/', Fname],'bmp');
        RPMaskFileList{i,1} = [DestParentDir, RPMaskDestDirName, '/', Fname];
        
        OldMaskFileList{i,1} = [SrcImgDirPath, ImgFileList{i,3}];
        
    end;

end