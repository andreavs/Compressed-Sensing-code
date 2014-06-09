function [ DWTl ] = DWTlevel( N,m )
%DWTLEVEL Compute the mth level transform matrix for a dwt transform
%   Detailed explanation goes here
factor = 1/sqrt(2);
DWTl = eye(N); 
for i=1:2:N/2^(m-1)-1
    DWTl(i,i) = factor;
    DWTl(i,i+1) = factor;
    DWTl(i+1,i) = factor;
    DWTl(i+1,i+1) = -factor;

end

P = zeros(N);
l=N/2^(m-1);
for n=1:l/2
       P(n, 2*n-1) = 1;
       P(n+l/2, 2*n) = 1;
end
for n = (l+1):N
       P(n,n) = 1; 
end
DWTl = P*DWTl;
end

