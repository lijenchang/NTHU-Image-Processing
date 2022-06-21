function [output_f, Notch] = notchFiltering(input_f, D0, u0, v0)
% input_f: 2D image in frequency domain (centered), type single
[M, N] = size(input_f);

D1 = (repmat(((0:M-1)' - M/2 - u0).^2, 1, N) + repmat(((0:N-1) - N/2 - v0).^2, M, 1)).^(1/2);
D2 = (repmat(((0:M-1)' - M/2 + u0).^2, 1, N) + repmat(((0:N-1) - N/2 + v0).^2, M, 1)).^(1/2);

Notch = ones(M, N);
Notch((D1 <= D0) | (D2 <= D0)) = 0;

output_f = Notch .* input_f;

end