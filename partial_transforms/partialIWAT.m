function [ Y ] = partialIWAT( idx, x, N, mode)
%PARTIALIWAT Summary of this function goes here
%   Detailed explanation goes here

  pat = 'p';
  tp = 'ortho';
  
  if mode==1
    Y=(vectomat(x',N,N))';
    X=real(iwa2sym(Y,pat,tp));
    Y=(mattovec(X'))';
    Y=Y(idx);
  else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    Y=real(fwa2sym(X,pat,tp));
    size(Y)
    Y(:,:) = Y(:,:)';
    Y(:,:) = Y(:,:)';
    Y=(mattovec(Y));
    Y = Y';
  end

end

