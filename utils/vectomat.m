function [ X ] = vectomat( Y, l1, l2 )
%VECTOMAT Summary of this function goes here
%   Detailed explanation goes here
assert(l1*l2 == length(Y))
X = zeros(l1,l2);
if l1 > 0 || l2 > 0
    X(1,1) = Y(1);
    c = 1;
    for i=1:l1
        for j=1:l2
           X(i,j) = Y(c);
           c = c+1;
        end
    end
end
end

