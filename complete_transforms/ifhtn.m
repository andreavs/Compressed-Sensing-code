function x = ifhtn(y)

% n-dimensional inverse hartley tranform using fft

if ~isreal(y)
  error('n-d inverse hartley transform: input must be real')
end
x = fftn(y);
x = (real(x) - imag(x))/prod(size(x));
end