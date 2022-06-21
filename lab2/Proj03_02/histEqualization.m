function [output, T] = histEqualization(input)
% Histogram Equalization
% input, output: a 2D grayscale image, type uint, range [0, 255]
% T: a row vector of transformation function, 256 elements, type uint8, range
% [0, 255]

histVector = imageHist(input);

T = zeros(1, 256);
for i = 1 : 256
    if i == 1
        T(i) = 255 / (size(input, 1) * size(input, 2)) * histVector(i);
    else
        T(i) = T(i - 1) + 255 / (size(input, 1) * size(input, 2)) * histVector(i);
    end
end
T = uint8(T);

output = uint8(zeros(size(input, 1), size(input, 2)));
for i = 1 : size(input, 1)
    for j = 1 : size(input, 2)
        output(i, j) = T(input(i, j) + 1);
    end
end

end