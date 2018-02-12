%Load data
load('A1.mat');

%Get data for digit 3 and 8 labeled 1 and 2 respectively
[X_out_train, Y_out_train] = p1(X_train,Y_train,4,9);
[X_out_test, Y_out_test] = p1(X_test,Y_test,4,9);

%Train on p5 using 100 and report error
w100 = p5(X_out_train,Y_out_train,100);
C = p4(w100, X_out_train);
[err, CONF] = p2(C,Y_out_train);
disp("train on 100")
disp(err)
C = p4(w100, X_out_test);
[err, CONF] = p2(C,Y_out_test);
disp("test on 100")
disp(err)

%Train on p5 using 1000 and report error
w1000 = p5(X_out_train,Y_out_train,1000);
C = p4(w1000, X_out_train);
[err, CONF] = p2(C,Y_out_train);
disp("train on 1000")
disp(err)
C = p4(w1000, X_out_test);
[err, CONF] = p2(C,Y_out_test);
disp("test on 1000")
disp(err)

%Train on p5 using 10000 and report error
w10000 = p5(X_out_train,Y_out_train,10000);
C = p4(w10000, X_out_train);
[err, CONF] = p2(C,Y_out_train);
disp("train on 10000")
disp(err)
C = p4(w10000, X_out_test);
[err, CONF] = p2(C,Y_out_test);
disp("test on 10000")
disp(err)
