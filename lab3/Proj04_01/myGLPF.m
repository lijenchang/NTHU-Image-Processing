function output = myGLPF(D0, M, N)
% Gaussian Low-pass Filtering
output = single(zeros(M, N));

for i = 1 : M
    for j = 1 : N
        u = i - 1;
        v = j - 1;
        D = ((u - M / 2)^2 + (v - N / 2)^2)^(1/2);
        output(i, j) = exp(-D^2 / (2 * D0^2));
    end
end

end
