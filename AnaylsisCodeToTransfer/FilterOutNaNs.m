function FlattenedDataTable = FilterOutNaNs(InputTable)


FlattenedDataTable = InputTable;

j = 1;
TestVal = FlattenedDataTable(j);
TerminationIndex = length(FlattenedDataTable);
    
while j <= TerminationIndex
    
    if ~isnan(TestVal)
    
        FlattenedDataTable(j) = TestVal;
        j = j + 1;
       
    else
          
        FlattenedDataTable(j) = [];
        TerminationIndex = TerminationIndex - 1;
            
    end;

    if j <= TerminationIndex
        
        TestVal = FlattenedDataTable(j);
        
    end
    
end;
