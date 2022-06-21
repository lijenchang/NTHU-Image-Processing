function quantizedImage = reduceIntensityLevel(originalImage, intensityLevel)
% Reduce the number of intensity levels in a image from 256 to 2, in integer powers of 2
originalImage = double(originalImage);

max_original_val = 255;
max_quantized_val = intensityLevel - 1;

step = floor(256 / intensityLevel);

quantizedImage = floor(originalImage / step) * max_original_val / max_quantized_val;
quantizedImage = uint8(quantizedImage);

end