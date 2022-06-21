function output = myIDFT2(input)
% 2D Inverse Discrete Fourier Transform
output = zeros(size(input));

[M, N] = size(input);

IDFT_C = exp(1i * 2 * pi * [0:M-1].' * [0:M-1] / M);
IDFT_R = exp(1i * 2 * pi * [0:N-1].' * [0:N-1] / N);

output = (IDFT_C * input * IDFT_R.') ./ (M * N);

%for x = 0 : M - 1
%    for y = 0 : N - 1
%        % 2D IDFT pair
%        for u = 0 : M - 1
%            for v = 0 : N - 1
%                output(x+1, y+1) = output(x+1, y+1) + input(u+1, v+1) * exp(1i * 2 * pi * (u * x / M + v * y / N));
%            end
%        end
%        output(x+1, y+1) = output(x+1, y+1) / (M * N);
%    end
%end

end