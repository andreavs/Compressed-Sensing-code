function [ y ] = partialICurvelet( Q,idx, x, N, mode, map )
%PARTIALICURVELET Summary of this function goes here
%   Detailed explanation goes here

if mode==1
    C = vectocurve(x,map);
    y = ifdct_usfft(C,0);
    y=Q*y*Q';
    y = mattovec(y); 
    y = y(idx).';

else
    y = zeros(N^2,1);
    y(idx) = x;
    y = vectomat(y, N,N);
    y=Q'*y*Q;
    y = fdct_usfft(y); 
    y = curvetovec(y).';
end

