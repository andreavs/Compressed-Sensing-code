function [ y ] = partialIDWTHaar( Q,idx, m, N, x, mode )
%PARTIALDWTHAAR Summary of this function goes here
%   Detailed explanation goes here

if mode==1
    y = IDWTHaarImpl(x,m);
    y = Q*y;
    y = y(idx);
else
    
    y = zeros(N,1);
    y(idx) = x; 
    y = Q'*y;
    y = DWTHaarImpl(y,m);
end

end

