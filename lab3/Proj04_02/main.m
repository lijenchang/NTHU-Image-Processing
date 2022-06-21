clear;
close all;

input = imread("Fig0441(a)(characters_test_pattern).tif");
input = im2single(input);

[M, N] = size(input);

img_mean = 0;

% 1. Zero padding to the double size
input = padarray(input, [M N], 'post');
% 2. Multiply the input image by (-1)^(x+y) to center the transform for filtering
for x = 1 : 2 * M
    for y = 1 : 2 * N
        img_mean = img_mean + input(x, y);
        input(x, y) = input(x, y) * (-1)^(x + y);
    end
end
img_mean = img_mean / (M * N);
% 3. DFT
output = abs(fft2(input));

fprintf("Mean from image: %f\n", img_mean);
fprintf("Mean from DC: %f\n", output(1 + M, 1 + N) / (M * N));

% Log transformation and scaling to [0, 255]
out_max = log(1 + max(output, [], 'all'));
output = uint8(round(log(1 + output) / out_max * 255));
fprintf("%f\n", out_max);
imshow(output);

imwrite(output, "Fig0441_b.png");
