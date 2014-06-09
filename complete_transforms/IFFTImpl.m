function x = IFFTImpl(y)
%ITImpl(x) Inverse Fast Fourier Transform
  %   calculates the IDFT of x by using O(N log(N)) calculations
  %   recursively. 
  %   
  %   y is the vector which is transformed. Must be of length 2^n

%assert(log2(size(y)) == round(log2(size(y))))
N = length(y);
if N == 1 
    x = y(1);
else
    ye = y(1:2:(N-1));
    yo = y(2:2:N);
    xe = IFFTImpl(ye);
    xo = IFFTImpl(yo);
    D=exp(2*pi*1j*(0:N/2-1)'/N);
    x=[ xe + xo.*D; xe - xo.*D]/sqrt(2);
end