function output = powerlawTransform(input, c, r)
% Power-law Transformation: s = c * r^gamma

input = input * 255;
output = c * (input.^r);
output = output / (c * 255^r);   % rescale to [0, 1]

end