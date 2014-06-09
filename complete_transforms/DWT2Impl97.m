function Xnew=DWT2Impl97(X,m)
  [l1,l2]=size(X);
  for mres=1:m
    for s=1:l2
      X(1:l1,s)=DWTImpl97(X(1:l1,s),1);
    end
    X=X';
    
    for s=1:l1
      X(1:l2,s)=DWTImpl97(X(1:l2,s),1);
    end
    X=X';
    l1=ceil(l1/2);
    l2=ceil(l2/2);
  end
  Xnew=X;