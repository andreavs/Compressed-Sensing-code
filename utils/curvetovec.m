function [ x ] = curvetovec( C )
%CURVETOVEC Summary of this function goes here
%   Detailed explanation goes here
x = [];
for i=1:length(C)
    C_content = C{i};
    [nx,ny] = size(C_content);
    for j = 1:(nx*ny)
        C_content_content = C_content{j};
        x = [x, mattovec(C_content_content)];
    end
end

end

