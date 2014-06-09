function [ IDWT ] = IDWTMatrix( N, m )
%IDWTMATRIX m-level DWT Haar transform matrix
%   Detailed explanation goes here
assert(N/2^m == round(N/2^m))
IDWT = IDWTlevel(N,m);
for i=m-1:-1:1
   IDWT = IDWTlevel(N,i)*IDWT;
end
end



