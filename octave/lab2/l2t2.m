function result=l2t2(l, k, r, h, G, R)
  % To get the length of metal tubes
  % We'll substruct the required resistance from the formula
  % thus we'll get an equation: R(l) - R' = 0
  % Then we just use fzero to get desired root
  L = l .* k;
  result = (log((L .^ 2)./(2 .* r .* h)) + 4.95)./(2 .* pi .* L .* G) - R;
end
