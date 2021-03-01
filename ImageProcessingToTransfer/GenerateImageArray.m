function GenerateImageArray(varargin)
    
    figure
    hold on;
    
%     DirInfo = [];
%     for j = 1:length(varargin(1,:))
%         
%         [pathstr, name, ext, versn] = fileparts(varargin{1,j}{1,1});
%         DirStrucToAdd = dir(pathstr);
%         DirInfo = [DirInfo; DirStrucToAdd];
%         
%     end;
%     
%     DirInfo
%     
%     for k = 1:length(DirInfo)
%         filelist{k} = DirInfo(k).name;
%     end;
%     
%     filelist
    
    for i=1:length(varargin{1,1})
        for j = 1:length(varargin(1,:))
            
            %ImName = varargin{1,j}(i,1);
            ImName = varargin{1,j}{i,1};
            [pathstr, name, ext, versn] = fileparts(ImName);
            
            ImNames = struct2cell(dir(pathstr));
            fname = cellstr([name,ext]);
            
            if ismember(fname, ImNames(1,:))
            
                Im = imread(ImName);
                Im = double(Im)/255;
                subplot(length(varargin{:,1}),length(varargin(1,:)),(i-1)*length(varargin(1,:))+j); image(Im);
                axis image off;
            
            end
            
        end
    end
end