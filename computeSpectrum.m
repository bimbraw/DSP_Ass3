function [f,XAbs] = computeSpectrum(x, sample_rate_Hz)
    spect = fft(x);
    fftLen = round(length(spect)/2);
    spect = spect(1:fftLen);
    XAbs = abs(spect);
    f = (0:fftLen-1)*(sample_rate_Hz/fftLen);
end