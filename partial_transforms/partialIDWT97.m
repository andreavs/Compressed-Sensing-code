function [ y ] = partialIDWT97( Q, idx, m, N, x, mode  )
%PARTIALIDWT97 Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y = IDWTImpl97(x,m);
    y = Q*y;
    y = y(idx);
else
    
    y = zeros(N,1);
    y(idx) = x; 
    y = Q'*y;
    y = IDWTImpl97transpose(y,m);
end
end

