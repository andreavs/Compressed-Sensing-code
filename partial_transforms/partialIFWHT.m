function [ y ] = partialIFWHT( idx, N, x, mode )
%PARTIALIFHT Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y = fwht(x)*sqrt(N);
    y = y(idx);
else
    y = zeros(N,1);
    y(idx) = x; 
    y = ifwht(y)/sqrt(N);
end


end

