clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

ffts1 = abs(fft(s1,Fe));
plot(1:Fe/2,ffts1(1:Fe/2));

figure
[b,a] = cheby1(6,10,[300/(Fe/2) 3300/(Fe/2)]);
freqz(b,a);

figure
r1 = filter(b,a,s1);
fftr1 = abs(fft(r1,Fe));
plot(fftr1);

