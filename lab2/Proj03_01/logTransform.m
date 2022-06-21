function output = logTransform(input, c)
% Log Transformation: s = c * log(1 + r), where c is a constant and r >= 0

input = input * 255;
output = c * log(1 + input);
output = output / (c * log(256));   % rescale to [0, 1]

end