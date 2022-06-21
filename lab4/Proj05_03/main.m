clear;
close all;

input = imread("Fig0526(a)(original_DIP).tif");
input = im2single(input);
[M, N] = size(input);

% Add sinusoidal noise
A = 0.8;
u0 = M/4 - 1;
v0 = N/4 - 1;
noisified_s = addSinNoise(input, A, u0, v0);
imwrite(noisified_s, "proj05-03_2.png");

% Transform to frequency domain
%noisified_s = padarray(noisified_s, [M N], 'post');
for x = 1 : M
    for y = 1 : N
        noisified_s(x, y) = noisified_s(x, y) * (-1)^(x + y);
    end
end
noisified_f = fft2(noisified_s);

% Log transformation for displaying frequency spectrum
out_max = log(1 + max(abs(noisified_f), [], 'all'));
imwrite(uint8(round(log(1 + abs(noisified_f)) / out_max * 255)), "proj05-03_3.png");

% Notch filtering
D0 = 3;
[output_f, Notch] = notchFiltering(noisified_f, D0, u0, v0);

imwrite(Notch, "proj05-03_4.png");
out_max = log(1 + max(abs(output_f), [], 'all'));
imwrite(uint8(round(log(1 + abs(output_f)) / out_max * 255)), "proj05-03_5.png");

% Transform back to spatial domain
output_s = ifft2(output_f);
for x = 1 : M
    for y = 1 : N
        output_s(x, y) = real(output_s(x, y) * (-1)^(x + y));
    end
end
%output_s = output_s(1:M, 1:N);
imwrite(output_s, "proj05-03_6.png");

% Compute PSNR
psnr = computePSNR(input, output_s);
fprintf("PSNR: %f db\n", psnr);
