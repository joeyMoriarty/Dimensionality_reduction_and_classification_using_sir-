function [V, D] = pca(Data)
%  PCA Principal Component Analysis
[n p] = size(Data);
if p>=n
    [V, D] = eig(Data*Data', 'vector');
    [D, idx] = sort(D);
    D = flipud(D);
    V = V(:,flipud(idx));
    D = max(0,D);
    V = Data' * V * diag(D.^(-0.5));
else
    [V, D] = eig(cov(Data),'vector');
    [D, idx] = sort(D);
    V = V(:,flipud(idx));
    D = flipud(D);
end
end