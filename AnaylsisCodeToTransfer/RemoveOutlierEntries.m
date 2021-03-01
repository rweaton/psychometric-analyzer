function OutputStruct = RemoveOutlierEntries(UnfilteredList, ColumnToExamine)

Binsize = .1;

figure(1);
[BinCenters, BinBounds, Frequencies] = PlotHistogram( ...
  UnfilteredList(:,ColumnToExamine), Binsize);

UserOutput = menu('Regroup Data and Show Resulting Histogram?', 'Yes', 'No');

while UserOutput ~= 2
 
    OutputCell = inputdlg('Enter new Bin Width');
    eval(['Binsize = ', OutputCell{1}]);
    %Binsize
    
    figure(1);
    [BinCenters, BinBounds, Frequencies] = PlotHistogram( ...
        UnfilteredList(:,ColumnToExamine), Binsize); 
    
    UserOutput = menu('Regroup Data and Show Resulting Histogram?', 'Yes', 'No');
    
end;

 OutputCell = inputdlg('Keep List Entries in Range i.e.[Floor, Ceiling]:');
 eval(['RangeOfAcceptableValues = ', OutputCell{1}]);
 %RangeOfAcceptableValues

FilteredList = EliminateEntries(UnfilteredList, ColumnToExamine, ...
                   RangeOfAcceptableValues);

OutputStruct.FilteredList = FilteredList;
OutputStruct.InclusionRange = RangeOfAcceptableValues;

end