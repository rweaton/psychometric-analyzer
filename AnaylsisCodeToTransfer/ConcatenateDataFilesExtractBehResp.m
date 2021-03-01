function TrialListStruct = ConcatenateDataFilesExtractBehResp(path, filenames, SOAsToInclude, ConditionsToInclude, MaskTypeDelimitingConditions, LastTrialList)
    
    % Function concatenates trial data contained within each file of the 
    % input argument cell array 'filenames'.  Each specified file must reside in the
    % directory specified by 'path'.  Corrupted data files are processed 
    % up to one line before the line containing the error (which must be 
    % determinined, outside of this function, by the user).  The number of
    % the last line to be processed for each file, must be specified in 
    % the same order in input arguement 'LastTrialList', as filenames are 
    % listed in 'filenames'.
    %
    % Processing of corrupted files requires a modified version of the 
    % 'Loadraw.m' (that includes a loop break command issued for the global 
    % 'max_trials'), as well as the cortex code version 'giu60323'.
    % 
    %
    % From the concatenated data pool, the function extracts trials with
    % the condition numbers specified by 'ConditionsToInclude' and with
    % the starting condition number, for each set of conditions, specified
    % by each element of the input arguement array 'MaskTypeDelimitingCondititions'.
    % 
    % The function outputs the output struct 'TrialListStruct' that
    % contains the following fields:
    %   1) .NumTrialsPerSOA: the number of trials completed for each SOA
    %      condition.  Elements of the array correspond to SOAs listed in
    %      unfoldedsoas.
    
    %   2) .TrialSOAs: the SOA coresponding to each trial in the cumulative
    %      list of trials.
    
    %   3) .TrialChoices:  the cumulative list of stimulus selections made 
    %       by the monkey '0' denotes a choice of stimulus A, '1' denotes
    %       stimulus B was chosen.
    
    %   4) .TrialBehavioralResponseTimes:  The corresponding behavioral
    %       response times (time from cue to the onset of the saccade) for the
    %       cumulative list of trials.
    %   
    %   This function uses the subroutine 'CreateCortexObjExtractBehResp'
    %   to call the cortex code and generate the cortex objects for each of
    %   the listed data files.
    
    global max_trials;
    
    nFiles = length(filenames);
    nSOAs = length(SOAsToInclude);
    unfoldedsoas = reshape([-SOAsToInclude; SOAsToInclude], 1, 2*nSOAs);
    unfoldgrp=[[min(ConditionsToInclude):2:max(ConditionsToInclude)];[min(ConditionsToInclude)+1:2:max(ConditionsToInclude)]];
    
    ss1_cumul = [];
    tt1_cumul = [];
    uu1_cumul = [];
    
    for k = 1:nFiles
        
        max_trials = LastTrialList(k)
        [ss1, tt1, uu1] = CreateCortexObjExtractBehResp(path, filenames{k}, unfoldgrp, unfoldedsoas, MaskTypeDelimitingConditions);
        
        ss1_cumul = [ss1_cumul; ss1];
        tt1_cumul = [tt1_cumul; tt1];
        uu1_cumul = [uu1_cumul; uu1];
        
    end;
    
    global LapseRateLimit;
    LapseRateLimit = 0.1;

    %[beh_p1,beheff1,xrange,beh_curve, llik]=make_4par_logistic5(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas);
    [ErrVec, n] = CalculateConfidenceIntervals(ss1_cumul, tt1_cumul, tt1_cumul, unfoldedsoas, .95);
    %Deviance = ComputeDeviance4(unfoldedsoas, beheff1, n, beh_p1);
    
    % Calculate pseudo R^2 value from log likelihoods
    global Data;
    %Data=[repmat(1, [length(ss1_cumul),1]) tt1_cumul];
    %InterceptOnlyLLik = logit_err_param4(beh_p1(1));
    %PseudoRSquaredVal = (InterceptOnlyLLik - llik)/InterceptOnlyLLik;
    clear Data;
    
%     figure
%     %plot(unfoldedsoas,beheff1,'mo');
%     errorbar(unfoldedsoas,beheff1,ErrVec,'k.')
%     hold on
%     plot(xrange,beh_curve,'k');
%     xlabel('soa, ms');
%     ylabel('proportion chose B');
%     text(100,.1,sprintf('alpha=%3.2f beta=%3.2f gamma=%3.2f lambda = %3.2f',beh_p1));
%     temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
%     toptitle(temp);


%     FittedCurve = [xrange; beh_curve];
%     DataPoints = [unfoldedsoas; beheff1];


%    FourParamStruct.EstimatedParams = beh_p1;
%    FourParamStruct.EstimatedParamSEs = se';
%    FourParamStruct.LogLikelihood = llik;
%    FourParamStruct.Deviance = Deviance;
%    FourParamStruct.PseudoRSquaredVal = PseudoRSquaredVal;
%    FourParamStruct.FittedCurve = FittedCurve;
%     FourParamStruct.DataPoints = DataPoints;
%     FourParamStruct.ConfidenceIntervalCeilings = beheff1 + ErrVec;
%     FourParamStruct.ConfidenceIntervalFloors = beheff1 - ErrVec;
    TrialListStruct.NumTrialsPerSOA = n;
    TrialListStruct.TrialSOAs = ss1_cumul;
    TrialListStruct.TrialChoices = tt1_cumul;
    TrialListStruct.TrialBehavioralResponseTimes = uu1_cumul;
    
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
