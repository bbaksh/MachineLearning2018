function W = p8(X_train,Y_train, iterNum, WInit, alpha)
%initialize and add bias column
W_tmp = WInit;
X = horzcat(ones(size(X_train,1),1), X_train);

%Perform iterNum iterations
for i=1:iterNum
    %Perform single sample operations
    for j=1:size(X,1)
        %Get correct class of x^j
        class = Y_train(j);

        %Calculate Wx for the approriate row
        Wx = W_tmp*X(j,:).';

        %Calculate loss
        actualValue = Wx(class);
        [largestValue, index] = max(Wx);
        loss = largestValue-actualValue;
        
        %Update weights
        if(loss~=0)
            W_update = zeros(size(W_tmp));
            W_update(index,:) = -X(j,:);
            W_update(class,:) = X(j,:);
            W_tmp = W_tmp + alpha.*W_update;
        end
    end
end
%Return the weights
W = W_tmp;
end

