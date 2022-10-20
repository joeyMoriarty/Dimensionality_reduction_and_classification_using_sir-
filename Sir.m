function z = Sir(Inputs,Targets, m)
%  LDA Linear Discriminant Analysis
% Inputs = Data(:,1:end-1);
% Targets = Data(:,end);
%Inputs = Inputs - mean(Inputs,2);
%size(Inputs)
%size(mean(Inputs,2))
Nclass = length(unique(Targets));
C_sir=zeros(length(mean(Inputs,2)));
% Sw = zeros(size(Inputs'*Inputs));
% Sb = zeros(size(Sw));
for i = 1:Nclass
    idx = find(Targets==i);
    class_mean = mean(Inputs(:,idx));
    C_sir=C_sir+class_mean*class_mean';
%     Sw = Sw + cov(Inputs(idx,:));
%     Sb = Sb + length(idx)*(class_mean'*class_mean);
end
%[V, D] = eig(inv(Sw)*Sb,'vector');
%size(C_sir)
[V, D] = eig(C_sir,'vector');
[D, idx] = sort(D);
V = V(:,flipud(idx));
z = V(:,1:m);
end