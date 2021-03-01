function FourParamStruct = ConcatenateDataFiles4Param(path, filenames, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList)
    
    global max_trials;
    
    nFiles = length(filenames);
    nSOAs = length(SOAsToInclude);
    unfoldedsoas = reshape([-SOAsToInclude; SOAsToInclude], 1, 2*nSOAs);
    unfoldgrp=[[min(ConditionsToInclude):2:max(ConditionsToInclude)];[min(ConditionsToInclude)+1:2:max(ConditionsToInclude)]];
    
    ss1_cumul = [];
    tt1_cumul = [];
    
    for k = 1:nFiles
        
        max_trials = LastTrialList(k)
        [ss1, tt1] = CreateCortexObj(path, filenames{k}, unfoldgrp, unfoldedsoas, MaskTypeDelimitingConditions);
        
        ss1_cumul = [ss1_cumul; ss1];
        tt1_cumul = [tt1_cumul; tt1];
        
    end;
    
    global LapseRateLimit;
    LapseRateLimit = 0.1;

    [beh_p1,beheff1,xrange,beh_curve, llik]=make_4par_logistic5(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas);
    [ErrVec, n] = CalculateConfidenceIntervals(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas, .95);
    Deviance = ComputeDeviance4(unfoldedsoas, beheff1, n, beh_p1);
    
    % Calculate pseudo R^2 value from log likelihoods
    global Data;
    Data=[repmat(1, [length(ss1_cumul),1]) tt1_cumul];
    %InterceptOnlyLLik = logit_err_param4(beh_p1(1));
    %PseudoRSquaredVal = (InterceptOnlyLLik - llik)/InterceptOnlyLLik;
    clear Data;
    
    %Note: trial counts corresponding to SOA = 0 are DOUBLED!!!
    
    figure
    %plot(unfoldedsoas,beheff1,'mo');
    errorbar(unfoldedsoas,beheff1,ErrVec,'k.')
    hold on
    plot(xrange,beh_curve,'k');
    xlabel('soa, ms');
    ylabel('proportion chose B');
    text(100,.1,sprintf('alpha=%3.2f beta=%3.2f gamma=%3.2f lambda = %3.2f',beh_p1));
%     temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
%     toptitle(temp);


    FittedCurve = [xrange; beh_curve];
    DataPoints = [unfoldedsoas; beheff1];


    FourParamStruct.EstimatedParams = beh_p1;
%    FourParamStruct.EstimatedParamSEs = se';
    FourParamStruct.LogLikelihood = llik;
    FourParamStruct.Deviance = Deviance;
%    FourParamStruct.PseudoRSquaredVal = PseudoRSquaredVal;
    FourParamStruct.FittedCurve = FittedCurve;
    FourParamStruct.DataPoints = DataPoints;
    FourParamStruct.ConfidenceIntervalCeilings = beheff1 + ErrVec;
    FourParamStruct.ConfidenceIntervalFloors = beheff1 - ErrVec;
    FourParamStruct.NumTrialsPerSOA = n;
    
    %clear n;
    
%     [beh_p1,beheff1,xrange,beh_curve,se, llik]=make_4par_logistic5(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas);
%     [ErrVec, n, junk] = CalcErrorBars(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas);
%     
%     %Note: trial counts corresponding to SOA = 0 are DOUBLED!!!
%     
%     figure
%     %plot(unfoldedsoas,beheff1,'mo');
%     errorbar(unfoldedsoas,beheff1,ErrVec,'k.')
%     hold on
%     plot(xrange,beh_curve,'k');
%     xlabel('soa, ms');
%     ylabel('proportion chose B');
%     text(100,.1,sprintf('a=%3.2f b=%3.2f',beh_p1));
% %     temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
% %     toptitle(temp);
% 
%     FittedCurve = [xrange; beh_curve];
%     DataPoints = [unfoldedsoas; beheff1];
%     
%     FourParamStruct.EstimatedParams = beh_p1;
%     FourParamStruct.EstimatedParamSEs = se';
%     FourParamStruct.LogLikelihood = llik;
%     FourParamStruct.FittedCurve = FittedCurve;
%     FourParamStruct.DataPoints = DataPoints;
%     FourParamStruct.DataPointErr = ErrVec;
%     FourParamStruct.NumTrialsPerSOA = n;
    
    clear max_trials LapseRateLimits;

end
