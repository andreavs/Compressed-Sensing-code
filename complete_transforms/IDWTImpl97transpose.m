function x=IDWTImpl97transpose(x,m)
lambda1=-0.586134342059950;
lambda2=-0.668067171029734;
lambda3=0.070018009414994;
lambda4=1.200171016244178;
alpha=0.869864451624777;
beta=1.149604398860250;

len=length(x);
for mres=1:m
x(1:2:len)=x(1:2:len)*alpha;
x(2:2:len)=x(2:2:len)*beta;
x(1:len)=liftingstepapplyA(lambda4,x(1:len));
x(1:len)=liftingstepapplyB(lambda3,x(1:len));
x(1:len)=liftingstepapplyA(lambda2,x(1:len));
x(1:len)=liftingstepapplyB(lambda1,x(1:len));

% Reorganize the coefficients
l=x(1:2:len);
h=x(2:2:len);
x(1:len)=[l h];
len=ceil(len/2);
end
xnew=x;