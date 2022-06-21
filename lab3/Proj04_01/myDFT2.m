function output = myDFT2(input)
% 2D Discrete Fourier Transform
output = zeros(size(input));

[M, N] = size(input);

DFT_C = exp(-1i * 2 * pi * [0:M-1].' * [0:M-1] / M);
DFT_R = exp(-1i * 2 * pi * [0:N-1].' * [0:N-1] / N);

output = DFT_C * input * DFT_R.';

%for u = 0 : M - 1
%    for v = 0 : N - 1
%        % 2D DFT pair
%        for x = 0 : M - 1
%            for y = 0 : N - 1
%                output(u+1, v+1) = output(u+1, v+1) + input(x+1, y+1) * exp(-1i * 2 * pi * (u * x / M + v * y / N));
%            end
%        end
%    end
%end

end
