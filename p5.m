function w = p5(X_train, Y_train, iterNum)
%intialize variables
w_tmp = [];
error = 101;

%Perform iterNum iterations
for i=1:iterNum
    %Generate random matrix with # of X_train columns + 1
    randMatrix = randn(size(X_train,2)+1,1);
    
    %Perform linear classification with random weights
    C = p4(randMatrix,X_train);
    
    %Check the error of the random weights
    [err,CONF] = p2(C,Y_train);
    
    %Check if error is less and update
    if(err < error)
        error = err;
        w_tmp = randMatrix;
    end
end

%return the best randomized weights
w = w_tmp;
end

