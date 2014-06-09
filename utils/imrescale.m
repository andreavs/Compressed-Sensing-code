function [ Y ] = imrescale( X )
%IMRESCALE convert data to ints between 0 and 255
%   Detailed explanation goes here
big = max(max(X));
small = min(min(X));
Y = (X -small)/(big-small)*255;
Y = uint8(Y);
end

