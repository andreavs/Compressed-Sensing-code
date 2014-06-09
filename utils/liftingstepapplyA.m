function xnew=liftingstepapplyA(lambda,x)
  N=length(x);
  x(1)=x(1)+2*lambda*x(2); % With symmetric extension
  for k=3:2:(N-1)
    x(k)=x(k)+lambda*(x(k-1)+x(k+1)); % This saves one multiplication
  end
  if mod(N,2)==1
      x(N)=x(N)+2*lambda*x(N-1);
  end
  xnew=x;
  