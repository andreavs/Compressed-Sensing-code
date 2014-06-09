function Xnew=DWT2HaarImpl(X,m)
  for mres=1:m
    l1=size(X,1)/2^(mres-1);
    l2=size(X,2)/2^(mres-1);
    for s=1:l2
      X(1:l1,s)=DWTHaarImpl(X(1:l1,s),1);
    end
    X=X';
    
    for s=1:l1
      X(1:l2,s)=DWTHaarImpl(X(1:l2,s),1);
    end
    X=X';
  end
  Xnew=X;