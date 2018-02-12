%Load data
clear; clc;
load('A1.mat');

%Get data for digit 3 and 8 labeled 1 and 2 respectively
[X_out_train, Y_out_train] = p1(X_train,Y_train,4,9);
[X_out_test, Y_out_test] = p1(X_test,Y_test,4,9);

%set learning rate
alpha = 0.1;

%set w
wInit = ones(size(X_out_train,2)+1,1);

%set iterations
iterNum = 30;

%compute training errors
w = p6(X_out_train, Y_out_train, iterNum, wInit, alpha);
C = p4(w, X_out_train);
[errTrain, CONFTrain] = p2(C, Y_out_train);
disp("err on train")
disp(errTrain)

C = p4(w, X_out_test);
[errTest, CONFTest] = p2(C, Y_out_test);
disp("err on test")
disp(errTest)