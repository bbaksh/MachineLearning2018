function C = p4(w,X)
%Extract bias
bias = w(1);

%Create vector of weights without bias
weights = w(2:end);

%Perform matrix multiplication between weights and X
C_tmp = X*weights;

%Add bias
C_tmp = C_tmp+bias;

%Label outcomes
C_tmp(C_tmp>0) = 1;
C_tmp(C_tmp<0) = 2;

%Return classification output
C = C_tmp;
end

