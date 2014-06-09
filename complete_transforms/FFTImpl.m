function y = FFTImpl(x)
%FFTImpl(x) Fast Fourier Transform
  %   calculates the DFT of x by using O(N log(N)) calculations
  %   recursively. 
  %   
  %   x is the vector which is transformed. Must be of length 2^n

%assert(log2(size(x)) == round(log2(size(x))))
N = length(x);
if N == 1 
    y = x(1);
else
    xe = x(1:2:(N-1));
    xo = x(2:2:N);
    ye = FFTImpl(xe);
    yo = FFTImpl(xo);
    D=exp(-2*pi*1j*(0:N/2-1)'/N);
    y = [ ye + yo.*D; ye - yo.*D]/sqrt(2);
end