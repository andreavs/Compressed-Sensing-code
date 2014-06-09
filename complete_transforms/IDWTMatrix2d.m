function [ IDWT ] = IDWTMatrix2d( N,m )
%IDWTMATRIX2D Summary of this function goes here
%   Detailed explanation goes here

vector_to_matrix_map = zeros(N^2,2);
for i=0:(N^2-1)
    vector_to_matrix_map(i+1,1) = floor(i/N)+1;
    vector_to_matrix_map(i+1,2) = rem(i,N)+1;
end 


IDWT = kron(eye(N),eye(N));

for i=m:-1:1
   upper_left_corner = zeros(N^2);
   for j = 1:N^2
       if vector_to_matrix_map(j,1) <= N/2^(i-1) && vector_to_matrix_map(j,2) <= N/2^(i-1)
            upper_left_corner(j) = 1;
       end
   end
   upper_left_corner_idx = find(upper_left_corner==1);
   IDWTl = IDWTlevel(N/2^(i-1),1);
   IDWTtemp = kron(eye(N), eye(N));
   IDWTtemp(upper_left_corner_idx, upper_left_corner_idx) = kron(IDWTl,IDWTl);
   IDWT = IDWTtemp*IDWT; 
end




end

