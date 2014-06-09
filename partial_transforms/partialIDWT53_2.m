function [ IDWT_us ] = partialIDWT53_2( Q,idx,m,N,x,mode )
if mode==1
    Y=(vectomat(x',N,N))';
    X=IDWT2Impl53(Y,m);
    X=Q*X*Q';
    IDWT_us=(mattovec(X'))';
    IDWT_us=IDWT_us(idx);
else
    X=zeros(N^2,1);
    X(idx)=x;
    X=(vectomat(X',N,N))';
    X=Q'*X*Q;
    Y=IDWT2Impl53transpose(X,m);
    IDWT_us=(mattovec(Y'))';
end



