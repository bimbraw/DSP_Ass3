function y = myNoiseShape( x, w, noise_type)
 q = 0;
 y = zeros(length(x), 1);
 dither_noise = myNoiseGen(length(x), w, noise_type);
for i = 1 : length(x)
    x(i) = x(i) - q;
    x_q = myQuantize(x(i)+dither_noise(i), w);
    y(i) = x_q;
    q = x_q - x(i);
end