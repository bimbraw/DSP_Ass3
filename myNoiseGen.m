function y= myNoiseGen(num_samples, w, noise_type)
 delta = 1/(2^(w-1));
 R = [-delta/2, delta/2];

 % rectangular
 if strcmp(noise_type,'rect') == 1
     y= min (R)+ range(R) .* rand (num_samples, 1); 
  
 % triangular
 elseif strcmp(noise_type,'tri') == 1    
     y= (min (R)+ range(R) .* rand (num_samples, 1)) + (min (R)+ range(R) .* rand (num_samples, 1)); 
   
 % High Pass Triangular
 elseif strcmp(noise_type,'hp') == 1
     y= (min (R)+ range(R) .* rand (num_samples, 1)) + (min (R)+ range(R) .* rand (num_samples, 1)); 
     y= [0,y']'; % has to know to have the difference to the first value 
     y= diff(y);
end
 