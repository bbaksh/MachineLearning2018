function C = p3(X_train, Y_train, X_test, k)

%initialization
X_test_rows = size(X_test,1);
X_train_rows = size(X_train,1);
C_tmp = [];

%Go through each item in X_test
for X_cur = 1:X_test_rows %Can potentially get rid of this by using 3D matrix?
    %Create test matrix using repmat
    X_cur_testMatrix = repmat(X_test(X_cur,:), X_train_rows,1);
    
    %Calculate the distance between current item and X_train
    dist = sum(abs(X_train-X_cur_testMatrix),2);
    
    %Get index of the top k distances
    [Y,I] = sort(dist);
    neighborsInd = I(1:k);
    neighbors = Y_train(neighborsInd);
    
    %Classify X_cur as the mode of neighbors
    C_tmp = vertcat(C_tmp,mode(neighbors)); 
end

%Return the classification vector
C = C_tmp;
end

