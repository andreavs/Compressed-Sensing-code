function [ IFFT_us ] = partialIFFTImpl_2(idx, x, N, mode)
%PARTIALIFFTIMP Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    Y=(vectomat(x',N,N))';
    X=IFFTImpl2d(Y);
    IFFT_us=(mattovec(X'))';
    IFFT_us=IFFT_us(idx);
else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    Y=FFTImpl2d(X);
    IFFT_us=(mattovec(Y'))';
end

