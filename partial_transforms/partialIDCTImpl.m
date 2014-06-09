function [ y ] = partialIFFTImpl( idx, N, x, mode )
%PARTIALIFFTIMPL Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y = idct(x);
    y = y(idx);
else
    y = zeros(N,1);
    y(idx) = x; 
    y = dct(x);
end

end
