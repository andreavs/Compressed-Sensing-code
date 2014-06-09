function [ irad ] = partialRadonFFT(idx, x, xlen, ylen, ts, mode)
%PARTIALRADONFFT Summary of this function goes here
%   Detailed explanation goes here

if mode==1
    l = length(x')
    xlen = l/ylen;
    size(x)
    xlen*ylen
    Y=(vectomat(x',xlen,ylen));
    X = ifft2(Y);
    X=iradon(X,ts);
    irad=(mattovec(X));
    irad = irad(2:end, 2:end);
    irad=irad(idx);
    a=  size(irad)
else
    X=zeros(ylen*ylen,1);
    length(x)
    length(X)
    length(idx)
    X(idx)=x;
    size(X)
    X=(vectomat(X',ylen,ylen));
    b = size(X)
    Y= fft2(radon(X,ts));
    b = size(Y)
    irad=(mattovec(Y));
    b = size(irad)

end

