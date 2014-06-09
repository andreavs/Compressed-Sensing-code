function [ X ] = ifrt2( RX )
%IFRT2 Summary of this function goes here
%   Detailed explanation goes here
p = size(RX,2); 
X = zeros(p,p);
RXI = RX(1:p,1:p);
X(1,:) = sum(RXI,1);



for i=2:p
    for j=2:p
        RXI(j,:) = circshift(RXI(j,:), [0,(j-1)]);
        
    end
    X(i,:) = X(i,:) + sum(RXI);
end
for i=1:p
    X(:,i) = X(:,i) + (RX(end,:)');
    
end
X = (X-sum(RXI(1,:)));

X = X/sqrt(p);


