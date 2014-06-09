function [ Y ] = partialIFFT_on_Haar( idx, x,N, mode, m )
%PARTIALIFFTIMPL Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    Y=(vectomat(x',N,N))';
    X=IFFTImpl2d(Y);
    X = DWT2HaarImpl(X,m);
    Y=(mattovec(X'))';
    Y=Y(idx);
else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    X = IDWTHaarImpl(X,m);
    Y=FFTImpl2d(X);
    Y=(mattovec(Y'))';
end

end

