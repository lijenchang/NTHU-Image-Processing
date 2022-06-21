clear;
close all;

scalingFactor = 1 / 12.5;
%scalingFactor = 12.5;

originalImage = imread("Fig0220a_chronometer.tif");
%originalImage = imread("Fig0220a_bilinear_0.08.tif");

resizedImage = resizeImage_bilinear(originalImage, scalingFactor);

imshow(resizedImage);

imwrite(resizedImage, sprintf("Fig0220a_bilinear_%.2f.tif", scalingFactor), 'Resolution', 100);
%imwrite(resizedImage, sprintf("Fig0220a_bilinear_%.2f.tif", scalingFactor), 'Resolution', 1250);
