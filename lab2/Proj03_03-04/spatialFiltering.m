function output = spatialFiltering(input, mask)
% 2D Convolution
% input, output: 2D grayscale image, type single, range [0, 1]
% mask: a 2D mask, type single

mask_size = size(mask, 1);
pad_size = floor(mask_size / 2);

padded_input = padarray(input, [pad_size pad_size]);   % zero padding

vec_mask = reshape(flip(flip(mask, 1), 2)', [], 1);   % reverse mask & stack rows into a column vector
output = zeros(size(input));
for i = 1 : size(input, 1)
    for j = 1 : size(input, 2)
        % Extract the region and stack its rows into a row vector
        vec_padded_input = reshape(padded_input(i : i + mask_size - 1, j : j + mask_size - 1)', 1, []);
        output(i, j) = vec_padded_input * vec_mask;
    end
end

end
