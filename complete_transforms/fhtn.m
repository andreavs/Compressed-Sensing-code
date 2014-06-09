function y = fhtn(x)

% n-dimesional hartley tranform using fft

if ~isreal(x)
  error('n-d hartley transform: input must be real')
end
y = fftn(x);
y = real(y) - imag(y);
end