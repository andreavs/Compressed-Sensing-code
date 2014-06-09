function [ RX ] = FRAT( X )
%FRAT Summary of this function goes here
%   Detailed explanation goes here
[Nx, Ny] = size(X);
RX = zeros(Nx+1,Ny);
for k=0:(Nx)
   for l=0:(Ny-1)
       if k<Nx
           is = 0:(Nx-1);
           js = mod(k*is+l,Ny);
           is = is+1;
           js = js+1;
       else
           is = linspace(l+1,l+1,Nx);
           js = 1:(Nx);
       end

       s = 0;
       for n=1:Nx
          s = s+X(is(n), js(n));
       end
       RX(k+1,l+1) = s;
       
   end
end

end

