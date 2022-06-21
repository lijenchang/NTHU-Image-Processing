function [output_f, H] = addMotionBlur(input_f, T, a, b)
% input_f: 2D image in frequency domain (centered), type single
[M, N] = size(input_f);

U = repmat((0:M-1)', 1, N);
V = repmat((0:N-1), M, 1);

%COMP = pi * (U * a + V * b);
COMP = pi * ((U - M/2) * a + (V - N/2) * b);

H = (T ./ COMP) .* sin(COMP) .* exp(-1j * COMP);
H(isnan(H)) = T;

output_f = H .* input_f;

end