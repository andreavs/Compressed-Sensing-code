function [ Y ] = mattovec( X )
%MATTOVEC Summary of this function goes here
%   Detailed explanation goes here
l = size(X);
Y = zeros(1,l(1)*l(2));
b =1;
for i=1:l(1)
    c = 1;
    for j=1:l(2)
        Y(b)=X(i,c);
        c= c+1;
        b = b+1;
    end
end

end

