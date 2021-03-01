%%%function to "unlogit" the parameters from 4-parm logistic fitting function
%%each number in a list will be returned "unlogited"

function [return_list]=unlogit_sra(input_matrix);

%input_matrix=[2.1 35];

par1=exp(input_matrix);
return_list=par1./(1+par1);
