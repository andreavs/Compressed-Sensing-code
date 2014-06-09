function x=IDWTImpl97(xnew,m)
  lambda1=-0.586134342059950;
  lambda2=-0.668067171029734;
  lambda3=0.070018009414994;
  lambda4=1.200171016244178;
  alpha=0.869864451624777;
  beta=1.149604398860250;
  
  lenall=zeros(m+1,1);
  lenall(1)=length(xnew);
  for mres=1:m
      lenall(mres+1)=ceil(lenall(mres)/2);
  end
  % lenall is now the lengths of the (lowpass,highpass) sections of xnew
  
  for mres=m:(-1):1
    % Reorganize the coefficients first
    l=xnew(1:lenall(mres+1));
    h=xnew((lenall(mres+1)+1):lenall(mres));
    xnew(1:2:lenall(mres))=l;
    xnew(2:2:lenall(mres))=h;
    
    xnew(1:lenall(mres))=liftingstepapplyA(lambda1,xnew(1:lenall(mres)));
    xnew(1:lenall(mres))=liftingstepapplyB(lambda2,xnew(1:lenall(mres)));
    xnew(1:lenall(mres))=liftingstepapplyA(lambda3,xnew(1:lenall(mres)));
    xnew(1:lenall(mres))=liftingstepapplyB(lambda4,xnew(1:lenall(mres)));
    xnew(1:2:lenall(mres))=xnew(1:2:lenall(mres))*alpha;
    xnew(2:2:lenall(mres))=xnew(2:2:lenall(mres))*beta;
  end
  x=xnew;