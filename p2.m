function [err,CONF] = p2(C,T)
%Get the height and misclassified samples
[h,w] = size(C);
misclassified = sum(C~=T);

%Find max integer in C and T and build confusion matrix
M = max(max(C),max(T));
CONF_tmp = zeros(M,M);

%Compute CONF matrix using a pair (T,C) as accessor for accumarray
CONF_tmp = accumarray([T,C], 1, size(CONF_tmp));

%Return output
err = misclassified/h;
CONF = CONF_tmp;
end

