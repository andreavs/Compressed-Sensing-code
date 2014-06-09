function x=IDWTImpl53(xnew,m)
  lambda1=-1;
  lambda2=0.125;
  alpha=0.5;
  beta=2;
  
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
    xnew(1:2:lenall(mres))=xnew(1:2:lenall(mres))*alpha;
    xnew(2:2:lenall(mres))=xnew(2:2:lenall(mres))*beta;
  end
  x=xnew;