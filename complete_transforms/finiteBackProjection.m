function [ X ] = finiteBackProjection( RX )
%FINITEBACKPROJECTION Summary of this function goes here
%   Detailed explanation goes here

[Nx, Ny] = size(RX);
X = zeros(Nx-1,Ny);
for i=0:(Nx-2)
   for j=0:(Ny-1)
       
       for k=0:(Nx-2)
           l=mod(j-k*i,Ny);
           X(i+1,j+1) = X(i+1,j+1) + RX(k+1,l+1);
           
       end
       X(i+1,j+1) = X(i+1,j+1) + RX(Nx,i+1);
   end
end
end

