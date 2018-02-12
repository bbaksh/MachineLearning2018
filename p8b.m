%Load data
clear;
load('A1.mat');

%Set learning rate
alpha = 0.01;

%Set iterations
iterNum = 100;

%Generate random wInit
WInit = randn(max(Y_train), size(X_train,2)+1);
%train with p8
W = p8(X_train, Y_train, iterNum, WInit, alpha);

%Report error of W against train data
C = p7(W, X_train);
[errTrain, confTrain] = p2(C,Y_train)

%Report error of W against test data
C = p7(W, X_test);
[errTest, confTest] = p2(C,Y_test)