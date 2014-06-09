function [ y ] = partialIDCTandIDWTHaar( idx, m, N, x, mode)
%PARTIALDCTANDDWTHAAR Summary of this function goes here
%   Detailed explanation goes here
if mode==1
    y1 = idct(x(1:N));
    y1 = y1(idx);
    y2 = IDWTImpl97(x(N+1:end),m);
    y2 = y2(idx);
    y = y1 + y2;
    %y = y';
else
    y1 = zeros(N,1);
    y1(idx) = x; 
    y1 = dct(y1);
    y2 = zeros(N,1);
    y2(idx) = x; 
    y2 = IDWTImpl97transpose(y2,m);
    y = [y1;y2];
end


end

