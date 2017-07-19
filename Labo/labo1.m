clear all
close all
clc

% L = 50;
% L = 100;
L = 1000;

N = 31;
alpha = 2.65;
% H = [ones(1,13) zeros(1,25) ones(1,12)];
% H = [ones(1,27) zeros(1,49) ones(1,24)];
H = [ones(1,275) zeros(1,485) ones(1,240)];
H = [H,H(end), H(end:-1:2)];      % Le mettre sur 2PI pts
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

carree = [zeros(1,985) ones(1,30) zeros(1,985)];
triangle = [zeros(1,985) triang(31)' zeros(1,984)];
hann = [zeros(1,985) hanning(31)' zeros(1,984)];
ks = [zeros(1,985) kaiser(31,alpha)' zeros(1,984)];

% figure,
% hold on
% plot(carree,'b')
% plot(triangle,'r')
% plot(hann,'g')
% plot(ks,'c')
% hold off 
% xlim([0 2*L+1])
% ylim([0 1.2])

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

%% Delai de groupe

b1 = r1(985:1017);
a1 = 1;

b2 = r2(985:1017);
a2 = 1;

b3 = r3(985:1017);
a3 = 1;

b4 = r4(985:1017);
a4 = 1;

figure
grpdelay(b1,a1);
figure
grpdelay(b2,a2);
figure
grpdelay(b3,a3);
figure
grpdelay(b4,a4);