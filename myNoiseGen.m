function y= myNoiseGen(num_samples, w, noise_type)
%rectangular
 delta = 1/(2^(w-1));
 R = (-delta/2, delta/2);

 %y= rand (num_samples, 1)
  % rectangular
 if strcmp(noisetype,'rect') == 1
     y= min (R)+ range(R) .* rand (num_samples, 1); 
   % triangular
 elseif strcmp(noisetype,'tri') == 1
     
     y= (min (R)+ range(R) .* rand (num_samples, 1)) + (min (R)+ range(R) .* rand (num_samples, 1)); 
     
 elseif strcmp(noisetype,'hp') == 1
     
      y= (min (R)+ range(R) .* rand (num_samples, 1)) + (min (R)+ range(R) .* rand (num_samples, 1)); 
      y= {0,y'}; % has to know to have the difference to the first value 
      y= diff (y);
end
 