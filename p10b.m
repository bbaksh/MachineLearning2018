function [err,CONF] = p10b(X_test,Y_test, net)
%Classify X with the NN
C = net(X_test.');

%Get the classification in column form
[val, ind] = max(C, [], 1);
C = ind.';

%Find max integer in C and T and build confusion matrix
M = max(max(C),max(Y_test));
CONF_tmp = zeros(M,M);

%Compute CONF matrix using a pair (T,C) as accessor for accumarray
CONF_tmp = accumarray([Y_test,C], 1, size(CONF_tmp));

%Find misclassified results
[h,w] = size(C);
misclassified = sum(C~=Y_test);

%Return output
CONF=CONF_tmp;
err = misclassified/h;
end

