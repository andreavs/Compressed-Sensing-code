function [ xn ] = quantizepercent( x, p )
%QUANTIZEPERCENT(x,percent) zeroes out the small elements of a vector
%   returns a vector such that the smallest p*N elements is zero
%
%   x is the input vector
%
%   p is the ratio of elements set to zero.

[nx, ny] = size(x);
N = nx*ny;

x = mattovec(x); 
[xn, idx] = sort(abs(x));
N0 = round(p*N);
idx0 = idx(1:N0);
xn = x; 
xn(idx0) = 0;
xn = vectomat(xn,nx,ny);
end

