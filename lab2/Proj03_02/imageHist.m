function histVector = imageHist(input)
% Obtain a row vector containing the histogram of an image
% input: a 2D grayscale image, type uint, range [0, 255]
% histVector: 256 elements, type single, range: integer

histVector = single(zeros(1, 256));
for i = 1 : size(input, 1)
    for j = 1 : size(input, 2)
        histVector(input(i, j) + 1) = histVector(input(i, j) + 1) + 1;
    end
end

end
