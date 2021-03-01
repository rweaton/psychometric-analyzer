function FlattenedDataTable = EliminateEntries(InputTable, ColumnIndex ,RangeOfAcceptableVals)

FlattenedDataTable = InputTable;
RangeOfAcceptableVals = RangeOfAcceptableVals(:);

j = 1;
TestVal = FlattenedDataTable(j, ColumnIndex);
[TerminationIndex, nParams] = size(FlattenedDataTable);
    
while j <= TerminationIndex
    
    if (TestVal > RangeOfAcceptableVals(1)) && (TestVal < RangeOfAcceptableVals(2))
    
        j = j + 1;
       
    else
          
        FlattenedDataTable(j,:) = [];
        TerminationIndex = TerminationIndex - 1;
            
    end;

    if j <= TerminationIndex
        
        TestVal = FlattenedDataTable(j, ColumnIndex);
        
    end
    
end;