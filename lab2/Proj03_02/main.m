clear;
close all;

input = imread("Fig0308(a)(fractured_spine).tif");

histVector = imageHist(input);
% Plot original histogram
bar(0:255, histVector);
title("Original Histogram");
saveas(gcf, "original_histogram.png");

[output, T] = histEqualization(input);
% Plot transformation function
stairs(0:255, T);
xlim([0 256]);
title("Transformation Function");
saveas(gcf, "transformation_function.png");

% Plot the enhanced image
imshow(output);
imwrite(output, "enhanced_image.tif");

% Plot histogram of the enhanced image
enhanced_histVector = imageHist(output);
bar(0:255, enhanced_histVector);
title("Enhanced Histogram");
saveas(gcf, "enhanced_histogram.png");

