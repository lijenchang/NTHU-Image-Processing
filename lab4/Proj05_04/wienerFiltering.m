function output_f = wienerFiltering(input_f, H, K)
% input_f: 2D image in frequency domain (centered), type single

output_f = 1 ./ H .* (abs(H).^2 ./ (abs(H).^2 + K)) .* input_f;
%output_f = (conj(H) ./ (abs(H).^2 + K)) .* input_f;

end