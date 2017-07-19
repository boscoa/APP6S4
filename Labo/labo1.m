clear all
close all
clc

% L = 50;
% L = 100;
L = 1000;

N = 31;
alpha = 2.65;
H = [ones(1,275) zeros(1,485) ones(1,240)];
% H = [ones(1,27) zeros(1,49) ones(1,24)];
H = [H,H];
h = ifftshift(ifft(H));

% figure
% hold on
% plot(H);
% % plot(h);
% % ylim([0 1.1])
% hold off

% figure
% plot(abs(ifftshift(ifft(H))));
% ylim([0 1.1])

carree = [zeros(1,985) ones(1,31) zeros(1,984)];
triangle = [zeros(1,985) triang(31)' zeros(1,984)];
hann = [zeros(1,985) hanning(31)' zeros(1,984)];
ks = [zeros(1,985) kaiser(31,alpha)' zeros(1,984)];

figure,
hold on
plot(carree,'b')
plot(triangle,'r')
plot(hann,'g')
plot(ks,'c')
hold off 
xlim([0 2*L+1])
ylim([0 1.2])

% Carree = abs(fftshift(fft(carree)));
% Triangle = abs(fftshift(fft(triangle)));
% Hann = abs(fftshift(fft(hann)));
% Ks = abs(fftshift(fft(ks)));

% figure
% hold on
% plot(Carree,'b');
% plot(Triangle,'r');
% plot(Hann,'g');
% plot(Ks,'c');
% hold off 

r1 = h .* carree;
r2 = h .* triangle;
r3 = h .* hann;
r4 = h .* ks;

figure
subplot(2,2,1)
plot(abs(fft(r1)),'b');
subplot(2,2,2)
plot(abs(fft(r2)),'r');
subplot(2,2,3)
plot(abs(fft(r3)),'g');
subplot(2,2,4)
plot(abs(fft(r4)),'c');