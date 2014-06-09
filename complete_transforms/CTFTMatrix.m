function [ FN ] = CTFTMatrix( w, t )
%CTCFIMPL(w,t) continuous time continuous frequency fourier transform
%   returns a matrix which calculates the integral
%   F (\omega) = \int_{-\infty}^\infty f(t)exp(-i \omega t) dt 
%   to be multiplied by a vector f. 
%   
%   w is the frequences to use in the integral
% 
%   t is a vector of the sample time

dt = t(2)- t(1);
FN = -1j*w'*t;
FN = dt*exp(FN);
end

