function xnew=DWTHaarImpl(x,m)
  xnew=x;
  for mres=m:(-1):1
    len=length(xnew)/2^(m-mres);
    c=(xnew(1:2:(len-1))+xnew(2:2:len))/sqrt(2);
    w=(xnew(1:2:(len-1))-xnew(2:2:len))/sqrt(2);
    xnew(1:len)=[c w];
  end