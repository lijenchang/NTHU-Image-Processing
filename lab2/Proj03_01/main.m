clear;
close all;

c = 1;

input = imread("Fig0308(a)(fractured_spine).tif");
input = single(input) / 255;   % uint8 with range [0, 255] -> single with range [0, 1]

% Demo for log transformation
output = logTransform(input, c);

output = uint8(output * 255);   % single with range [0, 1] -> uint8 with range [0, 255]
imshow(output);

imwrite(output, "Fig0308a_log.tif");

% Demo for power-law transformation
gamma_list = [0.3, 0.4, 0.6, 3, 5];

for r = gamma_list
    output = powerlawTransform(input, c, r);
    output = uint8(output * 255);   % single with range [0, 1] -> uint8 with range [0, 255]
    imwrite(output, sprintf("Fig0308a_gamma_%.1f.tif", r));
end
