function [ Y ] = FFTImpl2d( X )
%FFTIMPL2D Summary of this function goes here
%   Detailed explanation goes here
[xlen, ylen] = size(X);
Y = zeros(xlen, ylen);
for i=1:ylen
    Y(i,:) = fft(X(i,:));
end
Y = Y.'/sqrt(ylen);
for i=1:xlen
    Y(i,:) = fft(Y(i,:));
end
Y = Y.'/sqrt(xlen);
end

