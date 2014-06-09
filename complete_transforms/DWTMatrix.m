function [ DWT ] = DWTMatrix( N,m )
%DWTMATRIX m-level DWT Haar transform matrix
%   Detailed explanation goes here
assert(N/2^m == round(N/2^m))
DWT = DWTlevel(N,1);
for i=2:m
    DWT = DWTlevel(N,i)*DWT;
end
end

