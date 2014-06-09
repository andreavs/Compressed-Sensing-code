function [ DWT ] = DWTMatrix2d1( N )
%DWTMATRIX2D Summary of this function goes here
%   Detailed explanation goes here
vector_to_matrix_map = zeros(N^2,2);
for i=0:(N^2-1)
    vector_to_matrix_map(i+1,1) = floor(i/N)+1;
    vector_to_matrix_map(i+1,2) = rem(i,N)+1;
end 
factor = 1/sqrt(2);
DWTl = DWTMatrix(N,1);
DWT = kron(DWTl, DWTl);
DWTl = eye(N); 
for i=1:2:N/2-1
    DWTl(i,i) = factor;
    DWTl(i,i+1) = factor;
    DWTl(i+1,i) = factor;
    DWTl(i+1,i+1) = -factor;

end

P = zeros(N);
l=N/2;
for n=1:l/2
       P(n, 2*n-1) = 1;
       P(n+l/2, 2*n) = 1;
end
for n = (l+1):N
       P(n,n) = 1; 
end
DWTl = P*DWTl;
DWT = kron(DWTl,DWTl)*DWT;


end

