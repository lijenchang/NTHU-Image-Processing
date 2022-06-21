clear;
close all;

input = imread("Fig0507(a)(ckt-board-orig).tif");

mu = 0;
sigma = 20;
output_fig0507b = addGaussianNoise(input, mu, sigma);

output_fig0508a = addImpulseNoise(input, 0, 0.1); % Ps = 0, Pp = 0.1
output_fig0508b = addImpulseNoise(input, 0.1, 0); % Ps = 0.1, Pp = 0
output_fig0510a = addImpulseNoise(input, 0.1, 0.1); % Ps = 0.1, Pp = 0.1

imwrite(output_fig0507b, "Fig0507_b.png");
imwrite(output_fig0508a, "Fig0508_a.png");
imwrite(output_fig0508b, "Fig0508_b.png");
imwrite(output_fig0510a, "Fig0510_a.png");
