function  [xRange, ModelCurve] = PlotTwoParamPsychometricModel(xDataPoints, yDataPoints, ErrVec, Params)

    xRange = min(xDataPoints):1:max(xDataPoints);
    ModelCurve = get_2parm_fit_vals(Params, xRange);
    
    figure;
    hold on;
    
    h1 = plot(xRange,ModelCurve,'k');
    set(h1, 'LineWidth', 3.0);
    xlabel('SOAs (ms)', 'FontSize', 20);
    ylabel('Proportion Chose B', 'FontSize', 20);
    title('Two Parameter Psychometric','FontSize', 24);
    
    h2 = errorbar(xDataPoints, yDataPoints, ErrVec, 'ko');
    set(h2, 'MarkerSize', 10.0);
    
    
    hold off;
   
end