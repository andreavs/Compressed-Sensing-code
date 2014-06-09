function [ IDWT_us ] = partialIDWTHaarnew_2( idx,m,N,x,mode )
if mode==1
    Y=(vectomat(x',N,N))';
    X=IDWT2HaarImpl(Y,m);
    X=fnt2d(X);
    IDWT_us=(mattovec(X'))';
    IDWT_us=IDWT_us(idx);
else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    X=ifnt2d(X);
    Y=DWT2HaarImpl(X,m);
    IDWT_us=(mattovec(Y'))';
end