clear;
close all;

input = imread("Fig0338(a)(blurry_moon).tif");
input = single(input) / 255;   % uint8 with range [0, 255] -> single with range [0, 1]

% Use laplacian to reproduce 4/e Fig3.46 (a, b, c, d)
laplacian_kernel = single([0, 1, 0; 1, -4, 1; 0, 1, 0]);   % 4/e Fig3.45(a)
scale = single(-1);
[output, scaledLaplacian] = laplacianFiltering(input, laplacian_kernel, scale);
imwrite(scaledLaplacian, "Fig0346(b).png");
imwrite(output, "Fig0346(c).png");

laplacian_kernel2 = single([1, 1, 1; 1, -8, 1; 1, 1, 1]);   % 4/e Fig3.45(b)
[output2, scaledLaplacian2] = laplacianFiltering(input, laplacian_kernel2, scale);
imwrite(output2, "Fig0346(d).png");

% Use 5x5 kernel
laplacian_kernel3 = single([0,0,1,0,0; 0,1,2,1,0; 1,2,-16,2,1; 0,1,2,1,0; 0,0,1,0,0]);
[output3, scaledLaplacian3] = laplacianFiltering(input, laplacian_kernel3, scale);
imwrite(output3, "Fig0346_5x5.png");

% Try scale = -3
scale2 = single(-3);
[output4, scaledLaplacian4] = laplacianFiltering(input, laplacian_kernel, scale2);
imwrite(output4, "Fig0346_scale_-3.png");
