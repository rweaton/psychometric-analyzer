%%from the parameters, return the curve;

function yvals=get_4parm_fit_vals(parms, xrange);

temp1=exp(parms(1)+parms(2)*xrange);
yvals=0+(1-0).*(temp1./(1+temp1));


