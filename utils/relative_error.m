function [ e ] = relative_error( X,Y )
%RELATIVE_ERROR(X,Y) Relative error of X wrt. Y. 
e = norm(X-Y)/norm(Y);
end

