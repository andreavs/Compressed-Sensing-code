function [ IFN ] = ICTFTImpl( w,t )
%ICTCFIMPL(w,t) inverse continuous time continuous frequency fourier transform
%   returns a matrix which calculates the integral
%   f(t) = \int_{-\infty}^\infty F(\omega)exp(i \omega t) dt 
%   to be multiplied by a vector f. 
%   
%   w is the frequences to use in the integral
% 
%   t is a vector of the sample time

dw = w(2)- w(1);
IFN = 1j*t'*w;
IFN = (2/pi)*dw*exp(IFN);
end

