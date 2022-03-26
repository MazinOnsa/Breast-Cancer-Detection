function [opt_sigma, P] = sigma_selection_for_svdd(x, m)

if nargin < 1 error('no enough input arguments!'); end
if nargin < 2 sigmas = 0.01:0.01:10; end

K_s = zeros; K_mean = zeros;
sigmas=m;
n = length(sigmas);
v = sum(x.^2,2);
N = length(v);
uv = bsxfun(@plus,v,v')-2*(x*x');

for i = 1:n
    iSigma = sigmas(i);
    K = exp(-(1/(2*iSigma^2))*uv);
    K(1:N+1:end) = [];
    K_mean(i) = mean(K);
    K_s(i) = var(K);
end

P = K_s./(K_mean.^0.5);
[~, idx] = max(P);
opt_sigma = sigmas(idx);
% opt_K = exp(-(1/(2*opt_sigma^2))*uv);

end