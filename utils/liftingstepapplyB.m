function xnew=liftingstepapplyB(lambda,x)
  N=length(x);
  for k=2:2:(N-1)
    x(k)=x(k)+lambda*(x(k-1)+x(k+1)); % This saves one multiplication
  end
  if mod(N,2)==0
      x(N)=x(N)+2*lambda*x(N-1);
  end
  xnew=x;