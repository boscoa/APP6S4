clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

RIFlowpass = RIFsetup();

r = filter(RIFlowpass,s1);
r = downsample(r,6);

plot(abs(fft(r,Fe/6)));