function y = myDither( x, w, noise_type)
    dither_noise = myNoiseGen (length(x), w, noise_type);
    %y before quantization
    y_before= (dither_noise + x);
    y= myQuantize(y_before,w);
end


