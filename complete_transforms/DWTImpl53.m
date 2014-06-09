function xnew=DWTImpl53(x,m)
lambda1=-1;
lambda2=0.125;
alpha=0.5;
beta=2;

len=length(x);
for mres=1:m
  x(1:2:len)=x(1:2:len)/alpha;
  x(2:2:len)=x(2:2:len)/beta;
  x(1:len)=liftingstepapplyB(-lambda2,x(1:len));
  x(1:len)=liftingstepapplyA(-lambda1,x(1:len));

  % Reorganize the coefficients
  l=x(1:2:len);
  h=x(2:2:len);
  x(1:len)=[l h];
  len=ceil(len/2);
end
xnew=x;