function [ IDWTl ] = IDWTlevel( N,m )
%IDWTLEVEL Summary of this function goes here
%   Detailed explanation goes here

factor = 1/sqrt(2);
IDWTl = eye(N); 
for i=1:2:N/2^(m-1)-1
    IDWTl(i,i) = factor;
    IDWTl(i,i+1) = factor;
    IDWTl(i+1,i) = factor;
    IDWTl(i+1,i+1) = -factor;

end

P = zeros(N);
l=N/2^(m-1);
for n=1:l/2
       P(2*n-1,n) = 1;
       P(2*n, n+l/2) = 1;
end
for n = (l+1):N
       P(n,n) = 1; 
end
IDWTl = IDWTl*P;
end

