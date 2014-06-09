function [ x ] = contourToVec( C )
%CONTOURTOVEC Summary of this function goes here
%   Detailed explanation goes here

x = mattovec(C{1});
for i=2:length(C)
    C_content=C{i};
    for j=1:length(C_content)
       x = [x, mattovec(C_content{j})]; 
    end 
end

end

