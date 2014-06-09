function [ C ] = vectocurve( x, map )
%VECTOCURVE Summary of this function goes here
%   Detailed explanation goes here
c = 0; 
for i=1:length(map)
    map_content = map{i};
    [nx, ny] = size(map_content);
    for j = 1:(nx*ny)
        [lx, ly] = size(map{i}{j});
        map{i}{j} = vectomat(x(c+1:c+lx*ly),lx,ly);
        c = c+lx*ly;
    end
end
C = map;
end

