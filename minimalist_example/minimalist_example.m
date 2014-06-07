% This code shows, in a minimalist way, the reconstruction principle of 
% Compressed Sensing. We create a 3-sparse vector of length 10, make 
% 8 random measurements of it, and attempt to restore it by 
% l1-minimization. 
%
% Requires:
%   spgl1: http://www.cs.ubc.ca/~mpf/spgl1/
%
% Author:
%   Andreas Våvang Solbrå

rng(3) % set seed for reproducability

x = [0, 0, 0, 1.41, 0, 0, -2.35, 0.64, 0, 0]' % k-sparse vector
A = randn(8,10); % random measurement matrix
b = A*x; % measurements used in restoration

% b is now a vecor of length 8. there are infinitely many vectors y such
% that A*y = b. Can we restore x? 

o.verbosity = 0; % removes output from spgl1
x_restored = spg_bp(A,b, o); % call to l1-minimizer

x_restored

