clc
clear all
close all

%---------
%Q1 Gen.
r_n = myNoiseGen(44100, 4, 'rect');
t_n = myNoiseGen(44100, 4, 'tri');
hp_n = myNoiseGen(44100, 4, 'hp');

figure;
histogram(r_n);
title('Histogram for Rect');

figure;
pwelch(r_n);

figure;
histogram(t_n);
title('Histogram for Tri');

figure;
pwelch(t_n);

figure;
histogram(hp_n);
title('Histogram for Hp');

figure;
pwelch(hp_n);

%M. S. Q. 1 - using computeSpectrum function from Ass. 2
subplot(1,3,1)
[f,XAbs] = computeSpectrum(r_n, 44100);
plot(f,XAbs);
title('Magnitude Spectrum for rect')

subplot(1,3,2)
[f,XAbs] = computeSpectrum(t_n, 44100);
plot(f,XAbs);
title('Magnitude Spectrum for tri')

subplot(1,3,3)
[f,XAbs] = computeSpectrum(hp_n, 44100);
plot(f,XAbs);
title('Magnitude Spectrum for hp')

%--------
%Q3 Pwelch
x = audioread('sine-440-96k.wav');
%sound(x,96000);
y = myNoiseShape(x,4,'tri');
%sound(y,96000);
e = y - x;
%sound(e,96000)
figure;
pwelch(e);

%Q3 M. S.
[f,XAbs] = computeSpectrum(e, 44100);
figure;
plot(f,XAbs);
title('Magnitude Spectrum, w = 4, Tri on Sine')

%----------
%Pwelch Q.4
x = audioread('flute-A4-96k.wav');
y_q_4 = myQuantize(x,4);
%sound(y_q_4,96000)
figure;
pwelch(y_q_4)
y_q_8 = myQuantize(x,8);
%sound(y_q_8,96000)
figure;
pwelch(y_q_8)

y_d_4 = myDither(x,4,'hp');
%sound(y_d_4,96000)
figure;
pwelch(y_d_4)
y_d_8 = myDither(x,8,'hp');
%sound(y_d_8,96000)
figure;
pwelch(y_d_8)

y_n_4 = myNoiseShape(x,4,'hp');
sound(y_n_4,96000)
figure;
pwelch(y_n_4)
y_n_8 = myNoiseShape(x,8,'hp');
%sound(y_n_8,96000)
figure;
pwelch(y_n_8)

%Magnitude Spectrum - Q.4
subplot(3,2,1)
[f,XAbs] = computeSpectrum(y_q_4, 44100);
plot(f,XAbs);
title('Spect, w = 4, Quantize')
subplot(3,2,2)
[f,XAbs] = computeSpectrum(y_q_8, 44100);
plot(f,XAbs);
title('Spect, w = 8, Quantize')
subplot(3,2,3)
[f,XAbs] = computeSpectrum(y_d_4, 44100);
plot(f,XAbs);
title('Spect, w = 4, Dither')
subplot(3,2,4)
[f,XAbs] = computeSpectrum(y_d_8, 44100);
plot(f,XAbs);
title('Spect, w = 8, Dither')
subplot(3,2,5)
[f,XAbs] = computeSpectrum(y_n_4, 44100);
plot(f,XAbs);
title('Spect, w = 4, N. S.')
subplot(3,2,6)
[f,XAbs] = computeSpectrum(y_n_8, 44100);
plot(f,XAbs);
title('Spect, w = 8, N. S.')