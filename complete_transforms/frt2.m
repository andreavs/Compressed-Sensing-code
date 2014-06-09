function [ RX ] = frt2( X )
%FRT2 Summary of this function goes here
%   Detailed explanation goes here
p = size(X);
p = p(1);
RX = zeros(p+1,p);
RX(1,:) = sum(X,1);
for k=2:p
    for l=2:p
        X(l,:)= circshift(X(l,:), [0,-(l-1)]);
    end
    RX(k,:) = sum(X);
end
RX(p+1,:) = sum(X,2);
RX = RX/sqrt(p);


