function [ IDWT_us ] = partialIDWTHaar_2( Q,idx,m,N,x,mode, Qinv )
if nargin < 7
    Qinv = Q';
end
if mode==1
    Y=(vectomat(x',N,N))';
    X=IDWT2HaarImpl(Y,m);
    X=Q*X*Q';
    IDWT_us=(mattovec(X'))';
    IDWT_us=IDWT_us(idx);
else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    X=Qinv*X*Qinv';
    Y=DWT2HaarImpl(X,m);
    IDWT_us=(mattovec(Y'))';
end