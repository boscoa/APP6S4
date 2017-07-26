clear
close all
clc

N = 1;

k = N-1;

Fe = 1;

ph = (pi/2 + pi*(2*k+1)/(2*N));

delta = 0.11;

e = sqrt(1/(1-delta)^2-1);
beta = ((sqrt(1+e^2)+1)/e)^(1/N);

wb = 2*Fe*tan(0.15*pi/2); %wb=ws
wa = 2*Fe*tan(0.1*pi/2); %wa=wp

r1 = wa*((beta^2+1)/(2*beta));
r2 = wa*((beta^2-1)/(2*beta));

p0 = r2;

b0 = 2*p0*(wb-wa)*Fe;
b1 = 0;
b2 = -2*p0*(wb-wa)*Fe;

a0 = 4*Fe^2 + 2*p0*(wb-wa)*Fe + wa*wb;
a1 = (2*wa*wb - 8*Fe^2);
a2 = (4*Fe^2 - 2*p0*(wb-wa)*Fe + wa*wb);

b = [b0 b1 b2] / -a1;
a = [a0 a1 a2] / -a1;

freqz(b,a);