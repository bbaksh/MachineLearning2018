function C = p7(W,X)
%Add bias column in X
x = horzcat(ones(size(X,1),1), X);

%Calculate output of row in x for discriminant 
C_tmp = x*W.';

%Get max index of each row
[val, C_tmp] = max(C_tmp,[],2);

%Return index which denotes class
C = C_tmp;
end

