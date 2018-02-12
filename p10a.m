function [net, valErr] = p10a(X_train, Y_train, H, regularizerWeight)
%init NN
net = patternnet(H);
%init ratios
net.divideParam.testRatio = 0;
net.divideParam.valRatio = 0.3;
net.divideParam.trainRatio = 0.7;
%set regularization strength
net.performParam.regularization = regularizerWeight;
%Set X and Y to the correct format
X = X_train.';
Y = zeros(max(Y_train),size(Y_train,1));
Y_i = 1:size(Y_train,1);
Y_j = Y_train;
Y = Y + accumarray([Y_j(:),Y_i(:)],1,size(Y));
%train the network
[net, tr] = train(net,X,Y);
%classify using valid index from tr
C = net(X(:,tr.valInd));
%get label
[val, ind] = max(C,[],1);
%check errors of classification vs the tr.valind
[h, w] = size(ind.');
misclassified = sum(ind.'~=Y_train(tr.valInd));
valErr = misclassified/h;
end

