clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

ffts1 = abs(fft(s1,Fe));
plot(1:Fe/2,ffts1(1:Fe/2));