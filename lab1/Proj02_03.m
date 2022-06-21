clear;
close all;

scalingFactor = 0.1;

originalImage = imread("Fig0220a_chronometer.tif");
%originalImage = imread("Fig0220a_scaled_by_0.10.tif");

resizedImage = resizeImage_replication(originalImage, scalingFactor);

imshow(resizedImage);

imwrite(resizedImage, sprintf("Fig0220a_scaled_by_%.2f.tif", scalingFactor));
