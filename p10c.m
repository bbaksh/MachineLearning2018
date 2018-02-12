%Load data
clear;
load('A1.mat');

setdemorandstream(pi); 

%Set params
H = [100];
regularizerWeight = 0.8;

%Train NN and report valErr
[net, valErr] = p10a(X_train, Y_train, H, regularizerWeight);
valErr

%Testing trained network and report testErr
[err, CONF] = p10b(X_test, Y_test, net);
err