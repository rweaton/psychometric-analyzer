function [beta,llik,pred] = logistfit(data)
% LOGISTFIT  fits a logistic function to data using maximum likelihood
%	maximization under binomial assumptions.  It uses LOGIST_ERR for
%	error calculation.  Data must be organized as rows of observations.
%	The 1st column should be a 1 if you want to estimate a 'bias' term,
%	columns 2 thru n-1 are the values for the independent variables, and
%	the last column contains 1 or 0 for the choice.
%
%	usage: [beta,llik,pred,se] = logistfit(data)
%	Return values are
%	   BETA, the coefficients corresponding to columns 1:m-1 of data.
%	   LLIK, the log likelihood of the fit
%	   PRED, a vector representing the prob(y=1) under the fit.
%     SE,   a vector of the standard errors of the estimated parameters
%

% M Shadlen 9/17/94
% 3/22/2001 update for new matlab (replace fmins)
% 4/6/2001 standard errors added (JD)
% 9/17/2001 bug removed; initial guess was used instead of optimal parameters
%           for calculating the SEs (JD)

global Data;
Data = data;

global LapseRateLimit

% generate guess
[m n] = size(data);
% to generate a 1st guess, we will simply convert all the 1's to .99 and
% all the 0's to .01's and do a quick regression on the logits.  This is
% roughly converting the 1's to logit of 3 and 0's to logit of -3
y = (6 * Data(:,n)) - 3;

q = Data(:,1:n-1)\y;			% this is a 1st guess



q2=[q;-5;5];
first_guess = q;
%logit_err_parm4(q2);
logit_err(q);
% trace = 0;
% tol = .01;


beta = fminsearch('logit_err_parm4',q2);  % was fmins

%  Assign correct ceiling and floor values if 
%  fminsearch moved beta(3) and beta(4) out of their 
%  prospective, LapseRateLimit defined ranges 
% if beta(3) > LapseRateLimit
%     beta(3) = LapseRateLimit;
% end;
% 
% if beta(3) < 0
%    beta(3) = 0; 
% end;
% 
% if beta(4) < (1 - LapseRateLimit)
%     beta(4) = 1 - LapseRateLimit;
% end;
% 
% if beta(4) > 1
%    beta(4) = 1; 
% end;

%beta = fminsearch('logit_err',q);  % was fmins
%feval('logit_err_parm4', q2);
if nargout > 1
  llik = -logit_err_parm4(beta);
end
if nargout > 2
  % calculate the predicted prob(resp=1) values for each observation.
  qcol = beta(1:2);			% we need a column vector of params
  z = exp(Data(:,1:n-1) * qcol); 	% mxn * nx1 = mx1 column vector
  minpar = beta(3);
  maxpar = beta(4);
  pred = minpar+(maxpar-minpar).*(z ./ (1 + z));				% calculate the prob of getting a 1
end

% standard errors
% The covariance matrix is the negative of the inverse of the hessian of the natural logarithm
% of the probability of observing the data set given the optimal parameters.
% if (nargout>3)
% 	qcol = beta(:);
% 	z = exp(Data(:,1:n-1) * qcol);
% 	temp = z ./ (1 + z).^2;
%    hessian=[];
%    for i=1:n-1
%       for j=1:i
%          hessian(i,j)=-sum(temp.*Data(:,i).*Data(:,j));
%          hessian(j,i)=hessian(i,j);
%       end;
%    end;
%    cov_mat=-hessian^(-1);
%    se=sqrt(diag(cov_mat));
% end;
