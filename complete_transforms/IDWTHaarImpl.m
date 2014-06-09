function x=IDWTHaarImpl(xnew,m)
  x=xnew;
  for mres=1:m
    len=length(x)/2^(m-mres);
    ev=(x(1:(len/2))+x((len/2+1):len))/sqrt(2);
    od=(x(1:(len/2))-x((len/2+1):len))/sqrt(2);
    x(1:2:(len-1))=ev;
    x(2:2:len)=od;
  end
