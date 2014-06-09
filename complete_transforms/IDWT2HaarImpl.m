function X=IDWT2HaarImpl(Xnew,m)
  for mres=m:(-1):1
    l1=size(Xnew,1)/2^(mres-1);
    l2=size(Xnew,2)/2^(mres-1);
    for s=1:l2
      Xnew(1:l1,s)=IDWTHaarImpl(Xnew(1:l1,s),1);
    end
    Xnew=Xnew';
    
    for s=1:l1
      Xnew(1:l2,s)=IDWTHaarImpl(Xnew(1:l2,s),1);
    end
    Xnew=Xnew';
  end
  X=Xnew;