function [ xn ] = quantize( x, tolerance )
%QUANTIZE(x, tolerance) quantizes a vector
%   sets all elements of a vector which has a ratio to the largest element
%   less than a given tolerance.
%
%   x is the input vector
%   
%   tolerance is the minimal ratio for an element now to be zeroed. 

m = max(max(abs(x)));
xn = x.*(abs(x) >= tolerance*m);



end

