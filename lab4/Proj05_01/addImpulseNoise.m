function output_s = addImpulseNoise(input_s, Ps, Pp)
% Gaussian Noise Generator
% input_s: 2D image in spatial domain, type uint8
output_s = input_s;

prob = rand(size(input_s));

output_s(prob <= Ps) = 255;   % add salt
output_s((prob > Ps) & (prob <= Ps + Pp)) = 0;   % add pepper

end