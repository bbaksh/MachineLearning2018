%Load data
clear;
load('A1.mat');

%Use p2.m to test k=1
k1 = p3(X_train, Y_train, X_test, 1);
[err1,CONF1] = p2(k1, Y_test)

%Use p2.m to test k=3
k3 = p3(X_train, Y_train, X_test, 3);
[err3,CONF3] = p2(k3, Y_test)

%Use p2.m to test k=5
k5 = p3(X_train, Y_train, X_test, 5);
[err5,CONF5] = p2(k5, Y_test)

%Use p2.m to test k=7
k7 = p3(X_train, Y_train, X_test, 7);
[err7,CONF7] = p2(k7, Y_test)