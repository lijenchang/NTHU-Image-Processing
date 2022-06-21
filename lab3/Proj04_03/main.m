clear;
close all;

input = imread("Fig0441(a)(characters_test_pattern).tif");
input = im2single(input);

[M, N] = size(input);

% 1. Zero padding to the double size
input = padarray(input, [M N], 'post');
% 2. Multiply the input image by (-1)^(x+y) to center the transform for filtering
for x = 1 : 2 * M
    for y = 1 : 2 * N
        input(x, y) = input(x, y) * (-1)^(x + y);
    end
end
% 3. DFT
output = fft2(input);
% 4. Multiply the resulting (complex) array by a real filter function
D0 = 10;     % Try 10, 30, 60, 160, 460
filter = myGLPF(D0, 2 * M, 2 * N);
output = filter .* output;
% 5. IDFT
output = ifft2(output);
% 6. Multiply the result by (-1)^(x+y) and take the real part
for x = 1 : 2 * M
    for y = 1 : 2 * N
        output(x, y) = real(output(x, y) * (-1)^(x + y));
    end
end
% 7. Extract the first M rows and N columns (original size)
output = output(1:M, 1:N);
imwrite(output, "Fig0444_b.png");
