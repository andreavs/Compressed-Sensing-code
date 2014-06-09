function X=IDWT2Impl53(Xnew,m)
  lenall1=zeros(m+1,1);
  lenall2=zeros(m+1,1);
  lenall1(1)=size(Xnew,1);
  lenall2(1)=size(Xnew,2);
  for mres=1:m
      lenall1(mres+1)=ceil(lenall1(mres)/2);
      lenall2(mres+1)=ceil(lenall2(mres)/2);
  end
  % lenall is now the lengths of the (lowpass,highpass) sections of xnew
  
  for mres=m:(-1):1
    for s=1:lenall2(mres)
      Xnew(1:lenall1(mres),s)=IDWTImpl53(Xnew(1:lenall1(mres),s),1);
    end
    Xnew=Xnew';
    
    for s=1:lenall1(mres)
      Xnew(1:lenall2(mres),s)=IDWTImpl53(Xnew(1:lenall2(mres),s),1);
    end
    Xnew=Xnew';
  end
  X=Xnew;