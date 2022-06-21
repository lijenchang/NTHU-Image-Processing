function resizedImage = resizeImage_bilinear(originalImage, scalingFactor)
% Zooming and Shrinking Images by Bilinear Interpolation
[H, W] = size(originalImage);

new_H = round(H * scalingFactor);
new_W = round(W * scalingFactor);

resizedImage = uint8(zeros(new_H, new_W));

for i = 1 : new_H
    for j = 1 : new_W
        % -1: convert to index starting with 0
        % +1: convert back to index starting with 1
        i_prime = (i - 1) / scalingFactor + 1;
        j_prime = (j - 1) / scalingFactor + 1;

        % min: avoid index out of range
        i1 = min(floor(i_prime), H);
        j1 = min(floor(j_prime), W);
        i2 = min(i1 + 1, H);
        j2 = min(j1 + 1, W);

        % interpolate midpoint in i-axis
        if i1 == i2
            point1 = originalImage(i1, j1);
            point2 = originalImage(i1, j2);
        else
            point1 = (i2 - i_prime) * originalImage(i1, j1) + (i_prime - i1) * originalImage(i2, j1);
            point2 = (i2 - i_prime) * originalImage(i1, j2) + (i_prime - i1) * originalImage(i2, j2);
        end
        
        % interpolate midpoint in j-axis
        if j1 == j2
            resizedImage(i, j) = point1;
        else
            resizedImage(i, j) = (j2 - j_prime) * point1 + (j_prime - j1) * point2;
        end

        resizedImage(i, j) = uint8(round(resizedImage(i, j)));
    end
end

end