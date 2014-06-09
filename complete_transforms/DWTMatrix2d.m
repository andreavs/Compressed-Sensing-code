function [ DWT ] = DWTMatrix2d( N,m )
%DWTMATRIX2D Summary of this function goes here
%   Detailed explanation goes here
vector_to_matrix_map = zeros(N^2,2);
for i=0:(N^2-1)
    vector_to_matrix_map(i+1,1) = floor(i/N)+1;
    vector_to_matrix_map(i+1,2) = rem(i,N)+1;
end 

DWTl = DWTlevel(N,1);
DWT = kron(DWTl,DWTl);
for i=2:m
   upper_left_corner = zeros(N^2);
   for j = 1:N^2
       if vector_to_matrix_map(j,1) <= N/2^(i-1) && vector_to_matrix_map(j,2) <= N/2^(i-1)
            upper_left_corner(j) = 1;
       end
   end
   upper_left_corner_idx = find(upper_left_corner==1);
   
   DWTl = DWTlevel(N/2^(i-1),1);
   DWTtemp = kron(eye(N), eye(N));
   DWTtemp(upper_left_corner_idx, upper_left_corner_idx) = kron(DWTl,DWTl);
   DWT = DWTtemp*DWT; 
end


end

