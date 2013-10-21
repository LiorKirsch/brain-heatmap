function [expressionAsColors, scale, colorScale]= mapExpressionToColorScale(expressionLevel, colorScale)
% example :
% expressionAsColors = mapExpressionToColorScale([14,1,4,4.5,3,11,3,8,2.3,6.4,3.4,5.5], hot);
%
% first we normalize to one using minmax, then we map to the colors


    colorScaleSize = size(colorScale,1);
    normalized_expression = (expressionLevel - min(expressionLevel) ) / (max(expressionLevel) - min(expressionLevel) );
    [~,bins] = histc(normalized_expression, 0:1/(colorScaleSize -1):1);
    
    
    expressionAsColors = colorScale(bins , :);
    scale = [0:1/(colorScaleSize -1):1] *  (max(expressionLevel) - min(expressionLevel) ) + min(expressionLevel)  ;
end