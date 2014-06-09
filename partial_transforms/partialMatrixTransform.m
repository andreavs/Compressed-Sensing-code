function [ A_idx ] = partialMatrixTransform( A, idx )
%PARTIALMATRIXTRANSFORM(A, idx) General basis transform undersample
%   Returns the rows of A corresponding to undersampled data.
    A_idx = A(idx,:);
end

