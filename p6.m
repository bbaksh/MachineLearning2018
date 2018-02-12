function w = p6(X_train, Y_train, iterNum, wInit, alpha)
% LOGISTIC REGRESSION 
% w = w + alpha*SUM(y^i - sigmoid(a^t * z^i))*z^i

%add ones column to take into account bias weight
Z = horzcat(ones(size(X_train,1),1),X_train);
%Relabel class 2 to 0
Y_train(Y_train == 2) = 0;
%init the weights to be updated
a = wInit;

%Go through iterations for gradient descent
for i=1:iterNum
    %compute a' * z^i for all (Z*a)
    atzi = Z*a;
    %apply sigmoid
    sig_atzi = arrayfun(@(x) sigmoid(x), atzi);
    %batch rule update
    update = Y_train-sig_atzi;
    %multiply and sum
    batch_update = sum(repmat(update,1,size(a,1)).*Z,1);
    %update weights
    a = a + alpha*batch_update.';
end
%return the weight
w = a;
end

function sig = sigmoid(x)
    sig = 1/(1+ exp(-x));
end