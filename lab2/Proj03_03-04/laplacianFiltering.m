function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)
% Enhancement using the Laplacian
% input, output: 2D grayscale image, type single, range [0, 1]
% mask: a 2D mask, type single
% laplacianMask: a 2D Laplacian mask
% g(x, y) = f(x, y) + c [gradient^2 f(x, y)], where c = scale

scaledLaplacian = scale * spatialFiltering(input, laplacianMask);
output = input + scaledLaplacian;

end