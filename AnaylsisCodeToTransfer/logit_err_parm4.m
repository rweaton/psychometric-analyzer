function err = logit_err_parm4(q)
% logit_err(q) returns the negative of the log likelihood of
%    obtaining Data in the global arrays given a logistic model with
%    parameters in vector Q.
%	The data is in columns such that Data(:,1) is ones (you must specify
%	it though.  Data(:,[2:m-1]) are the values for the other observed
%	variables. and Data(:,m) is a 1 or a 0.
%
global Data Plothandle LapseRateLimit

% fake data for debugging
%$$$ Data = [1 0 .5 0;
%$$$     1 2 .5 0
%$$$     1 2 .5 0
%$$$     1 2 .5 0
%$$$     1 2 .5 1
%$$$     1 2 1 1
%$$$     1 2 1 1
%$$$     1 2 1 0
%$$$     1 4 1 1]
%$$$ q = [0 1 2]

% Constrain Floor and Ceiling parameters.
% Be sure to assign these this out of loop
% if the optimization procedure lists them out of
% the below specified ranges

% if q(3) > LapseRateLimit
%     q(3) = LapseRateLimit;
% end;
% 
% if q(3) < 0
%    q(3) = 0; 
% end;
% 
% if q(4) < (1 - LapseRateLimit)
%     q(4) = 1 - LapseRateLimit;
% end;
% 
% if q(4) > 1
%    q(4) = 1; 
% end;

[m n] = size(Data);
qcol = q(1:2);	% we need a column vector of params
minpar1=exp(q(3));
maxpar1=exp(q(4));
minpar=minpar1./(1+minpar1);
maxpar=maxpar1./(1+maxpar1);
z = exp(Data(:,1:n-1) * qcol);		% mxn * nx1 = mx1 column vector
p1 = minpar+(maxpar-minpar).*(z ./ (1 + z));			% calculate the prob of getting a 1
% for each data entry. 
% Now calculate the joint probability of obtaining the data set conceived as
% a list of Bernoulli trials.  This is just p1 for trials = 1 and 1-p1 for
% trials of 0.

p = [p1(Data(:,n)==1); 1-p1(Data(:,n)==0)];
err = -sum(log(p));			% minus log likelihood
