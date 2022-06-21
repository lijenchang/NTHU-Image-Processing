clear;
close all;

input = imread("Fig0431(d)(blown_ic_crop).tif");
input = im2single(input);

[M, N] = size(input);

% 1. Zero padding to the double size
input = padarray(input, [M N], 'post');
imwrite(input, "Fig0435_b.png");
% 2. Multiply the input image by (-1)^(x+y) to center the transform for filtering
for x = 1 : 2 * M
    for y = 1 : 2 * N
        input(x, y) = input(x, y) * (-1)^(x + y);
    end
end
imwrite(input, "Fig0435_c.png");
% 3. DFT
output = myDFT2(input);
out_max = log(1 + max(abs(output), [], 'all'));
imwrite(uint8(round(log(1 + abs(output)) / out_max * 255)), "Fig0435_d.png");
% 4. Multiply the resulting (complex) array by a real filter function
D0 = 10;
filter = myGLPF(D0, 2 * M, 2 * N);
output = filter .* output;
imwrite(filter, "Fig0435_e.png");
imwrite(abs(output), "Fig0435_f.png");
% 5. IDFT
output = myIDFT2(output);
% 6. Multiply the result by (-1)^(x+y) and take the real part
for x = 1 : 2 * M
    for y = 1 : 2 * N
        output(x, y) = real(output(x, y) * (-1)^(x + y));
    end
end
imwrite(output, "Fig0435_g.png");
% 7. Extract the first M rows and N columns (original size)
output = output(1:M, 1:N);
imwrite(output, "Fig0435_h.png");
