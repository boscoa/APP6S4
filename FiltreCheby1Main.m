clear
close all
clc

Fe = 8000;

wb = 2*Fe*tan(0.15*pi/2);
wa = 2*Fe*tan(0.1*pi/2);

b0 = 2*(wb-wa)*Fe;
b1 = 0;
b2 = -2*(wb-wa)*Fe;

a0 = 4*Fe^2 + 2*(wb-wa)*Fe + wa*wb;
a1 = (2*wa*wb - 8*Fe^2);
a2 = (4*Fe^2 - 2*(wb-wa)*Fe + wa*wb);

b = [b0 b1 b2] / -a1;
a = [a0 a1 a2] / -a1;

freqz(b,a);