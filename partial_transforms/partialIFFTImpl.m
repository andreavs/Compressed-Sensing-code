function [ y ] = partialIFFTImpl( idx, N, x, mode )
%PARTIALIFFTIMPL Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y = ifft(x)*sqrt(N);
    y = y(idx);
else
    y = zeros(N,1);
    y(idx) = x; 
    y = fft(y)/sqrt(N);
end

end

