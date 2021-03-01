function  Curve = TwoParamLogitFun(x, a, b)

    OnesVec = ones(size(x));

    Curve = OnesVec./(OnesVec + exp(-(a*OnesVec + b*x)));

end