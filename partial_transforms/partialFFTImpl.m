function [ y ] = partialFFTImpl( idx, N, x, mode )
%PARTIALIFFTIMPL Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y = fft(x)/sqrt(N);
    y = y(idx);
else
    y = zeros(N,1);
    y(idx) = x; 
    y = ifft(y)*sqrt(N);
end

end

