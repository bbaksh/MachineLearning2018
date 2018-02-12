function W = p9(X_train, Y_train, iterNum, WInit, alpha)
%Initialize
W_tmp = WInit;
X = horzcat(ones(size(X_train,1),1),X_train);

%Perform iterNum iterations
for i=1:iterNum
    %Perform single sample
    for j=1:size(X,1)
        %Compute Wx
        Wx = W_tmp*X(j,:).';
        
        %Get softmax of Wx
        softmaxWx = arrayfun(@(x) softmax(x, Wx), Wx);
        
        %Generate correct class
        y = zeros(size(W_tmp,1),1);
        y(Y_train(j)) = 1;
        
        %Update
        W_tmp = W_tmp + alpha.*((y-softmaxWx)*X(j,:));
    end
end

%return softmax weights
W=W_tmp;
end

function soft = softmax(x, X)
    soft = exp(x)/sum(exp(X));
end