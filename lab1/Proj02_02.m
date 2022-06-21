clear;
close all;

intensityLevel = 2^7;

originalImage = imread("Fig0221a_ctskull-256.tif");

quantizedImage = reduceIntensityLevel(originalImage, intensityLevel);

imshow(quantizedImage);

imwrite(quantizedImage, sprintf("Fig0221a_%d.tif", intensityLevel));
