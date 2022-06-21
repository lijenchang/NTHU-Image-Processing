function output_s = addGaussianNoise(input_s, mu, sigma)
% Gaussian Noise Generator
% input_s: 2D image in spatial domain, type uint8
[M, N] = size(input_s);

noise = sigma .* randn(M, N) + mu;

output_s = uint8(255 * mat2gray(double(input_s) + noise));

end