# DSP_Ass3
Dither &amp; Noise Shaping

General Notes:

Make sure you use the exact function declarations given in the question descriptions. Changes of any kind will be penalized.
Save every function in a separate .m file with the correct function name (e.g. functionName.m)
Plots and discussion should be included in one single separate .pdf / .doc / .docx file
Plots should be properly and extensively labelled.
Core MATLAB functions are allowed. Functions from toolboxes (such as Signal Processing Toolbox) are not allowed unless explicitly specified otherwise.
Submit the MATLAB code and the .pdf report in one single zipped file
Clarification edits will be shown in red.
The purpose of this assignment is to guide you through the important concepts about dither and noise shaping, and eventually implement the basic algorithm in matlab.
 

Question 0: Setting up a MATLAB script (0 points)

Create a MATLAB script (.m file which is not a function) titled ass3main.m. This script should call the functions below in the specified order and generate all the required plots (with proper axes and labels wherever required). This script will be executed for grading.

Question 1:  Noise generation (30 points)

Implement a matlab function y = myNoiseGen(num_samples, w, noise_type) that will generate dither noises with different probability density functions (pdf): a) rectangular, b) triangular, and c) triangular using high-pass filtering. The output y is a column vector (num_samples x 1) of your generated noise. Note: For rectangular pdf noise, the amplitude = range( -delta/2, delta/2 ); For triangular pdf noise, the amplitude = range( -delta, delta ). Delta = 1/(2^(w -1)), w is the word length that user can determine. Function variable ‘noise_type' is a string: ‘rect’, ‘tri’, ‘hp’. (Useful functions: rand( ), strcmp( ), diff( ))
Make required function calls to myNoiseGen() in your main script and plot the histogram and magnitude spectrum of each type of noise. Use num_samples = 44100 and w = 4 for this part. 

Question 2: Dither & Quantization (20 points)

Implement a matlab function y = myQuantize(x,w) that will quantize the input signal 'x' using the the word-length 'w'. Both 'x' and 'y' are column vectors (num_samples x 1). w has the same definition as Question 1.1. Note: use mid-tread quantization. You may adapt the function that you wrote for the in-class exercise for this part. 
Implement a matlab function y = myDither( x, w, noise_type) that will generate and add a dither noise to the signal and quantize it. x is the input signal (column vector with dimension num_samples x 1). w and noise_type have the same definition as in Question 1.1. The output y is a column vector (num_samples x 1) vector of your dithered and quantized signal. Hint: The dither noise should have the same word length as the final output. Use myQuantize() and myNoiseGen() from the previous questions. 

Question 3: Noise Shaping (30 points)

Implement a matlab function y = myNoiseShape( x, w, noise_type) that performs first order noise shaping on your input signal x. In this part, you will have to implement the difference equation described in class. The output y is a numSamples * 1 vector of your noise shaped and quantized signal. x, w and noise_type have the same definitions as in Question 2. Noise shape should also include dithering.
Load sine-440-96k.wav
Play media comment. on your main script. Using this as the input signal, plot the magnitude spectrum of your quantization error for w = 4, noiseType = 'tri'. Hint: quantization error e(i) = y(i) - x(i). Useful functions: pwelch( ). 

Question 4: Discussion (20 points) 

Load flute-A4-96k.wav
Play media comment. in your main script.  Using this as the input signal, plot the magnitude spectrum of the outputs from these functions: myQuantize(), myDither(), myNoiseShape() for two different cases: w= 4 and w = 8 (use noiseType = 'hp' for all cases). Listen to the sounds of the outputs and discuss the results. What are the differences between these three approaches in both cases?  
