function psnr = computePSNR(input1_s, input2_s)
% input1_s, input2_s: 2D image in spatial domain, type single, range 0 ~ 1
[M, N] = size(input1_s);

psnr = 10 * log10(M * N * 1^2 / sum((input1_s - input2_s).^2, 'all'));

end