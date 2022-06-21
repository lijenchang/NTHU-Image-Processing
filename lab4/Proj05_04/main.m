clear;
close all;

input = imread("Fig0526(a)(original_DIP).tif");
input = im2single(input);
original_img = input;
[M, N] = size(input);

% Transform to frequency domain
for x = 1 : M
    for y = 1 : N
        input(x, y) = input(x, y) * (-1)^(x + y);
    end
end
input_f = fft2(input);

% Motion blur
T = 1;
a = 0.1;
b = 0.1;
[output_blur_f, H] = addMotionBlur(input_f, T, a, b);

output_blur_s = ifft2(output_blur_f);
%output_blur_s = ifft2(input_f);
for x = 1 : M
    for y = 1 : N
        output_blur_s(x, y) = real(output_blur_s(x, y) * (-1)^(x + y));
    end
end
%out_min = min(output_blur_s, [], 'all');
%out_max = max(output_blur_s, [], 'all');
imwrite(output_blur_s, "Fig0526_b.png");
%out_max = log(1 + max(abs(output_blur_s), [], 'all'));
%output_blur_s = uint8(round(log(1 + abs(output_blur_s)) / out_max * 255));
%imwrite(output_blur_s, "Fig0526_b.png");

% Add Gaussian noise with 0 mean and variance of 10
output_blur_s = uint8(round(output_blur_s * 255));
output_blur_noise_s = addGaussianNoise(output_blur_s, 0, sqrt(10));

imwrite(output_blur_noise_s, "Fig0526_c.png");

% Wiener filtering
output_blur_noise_s = im2single(output_blur_noise_s);
for x = 1 : M
    for y = 1 : N
        output_blur_noise_s(x, y) = output_blur_noise_s(x, y) * (-1)^(x + y);
    end
end
output_blur_noise_f = fft2(output_blur_noise_s);

for K = [0.01, 0.001, 0.0001]
    output_f = wienerFiltering(output_blur_noise_f, H, K);
    
    output_s = ifft2(output_f);
    for x = 1 : M
        for y = 1 : N
            output_s(x, y) = real(output_s(x, y) * (-1)^(x + y));
        end
    end
    imwrite(output_s, sprintf("Fig0526_d_%f.png", K));
    % PSNR
    psnr = computePSNR(original_img, mat2gray(output_s));
    fprintf("PSNR (K = %f): %f\n", [K, psnr]);
end
