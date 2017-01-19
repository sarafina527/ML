
function res = normr(data)
res = data./ repmat( sqrt(sum(data.^2,2)), 1, size(data,2) ) ;