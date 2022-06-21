function output_s = addSinNoise(input_s, A, u0, v0)
% input_s: 2D image in spatial domain, type single, range 0 ~ 1
[M, N] = size(input_s);

X = repmat(u0 * (0:M-1)' / M, 1, N);
Y = repmat(v0 * (0:N-1) / N, M, 1);
noise = A * sin(2 * pi * (X + Y));

output_s = input_s + noise;

end