function resizedImage = resizeImage_replication(originalImage, scalingFactor)
% Zooming and Shrinking Images by Pixel Replication
[H, W] = size(originalImage);

new_H = round(H * scalingFactor);
new_W = round(W * scalingFactor);

resizedImage = uint8(zeros(new_H, new_W));

for i = 1 : new_H
    for j = 1 : new_W
        % -1: convert to index starting with 0
        % +1: convert back to index starting with 1
        % min: avoid index out of range caused by rounding
        pos_i = min(round((i - 1) / scalingFactor) + 1, H);
        pos_j = min(round((j - 1) / scalingFactor) + 1, W);
        resizedImage(i, j) = originalImage(pos_i, pos_j);
    end
end

end
