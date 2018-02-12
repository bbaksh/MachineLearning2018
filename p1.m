function [X_out,Y_out] = p1(X,Y,l1,l2)
%Find indexes in Y that equal l1 and l2
l1Indexes = find(Y==l1);
l2Indexes = find(Y==l2);

%Form X_out with the indexes from l1 and l2
X_tmp = vertcat(X(l1Indexes,:), X(l2Indexes,:));

%Form Y_out with the indexes from l1 and l2
Y_tmp = [Y(l1Indexes);Y(l2Indexes)];

%Replace the lower label with 1 and higher label with 2
if(l1 > l2)
    Y_tmp(Y_tmp==l1)=2;
    Y_tmp(Y_tmp==l2)=1;
else
    Y_tmp(Y_tmp==l1)=1;
    Y_tmp(Y_tmp==l2)=2;
end

%Return output
X_out = X_tmp;
Y_out = Y_tmp;
end

