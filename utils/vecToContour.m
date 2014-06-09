function [ C ] = vecToContour( x, map )
%VECTOCONTOUR Summary of this function goes here
%   Detailed explanation goes here
C = map;


[lx, ly] = size(C{1}); 
C{1} = vectomat(x(1:lx*ly), lx, ly);
c = lx*ly;
for i=2:length(map)
    map_content = map{i};
    [nx, ny] = size(map_content);
    for j = 1:(nx*ny)
        [lx, ly] = size(map{i}{j});
        C{i}{j} = vectomat(x(c+1:c+lx*ly),lx,ly);
        c = c+lx*ly;
    end
end

end

