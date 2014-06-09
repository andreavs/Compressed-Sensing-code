function [ Y ] = IFFTImpl2d( X )
%IFFTIM Summary of this function goes here
%   Detailed explanation goes here
[xlen, ylen] = size(X);
Y = zeros(xlen, ylen);
for i=1:ylen
    Y(i,:) = ifft(X(i,:));
end
Y = Y.'*sqrt(ylen);
for i=1:xlen
    Y(i,:) = ifft(Y(i,:));
end
Y = Y.'*sqrt(xlen);
end

