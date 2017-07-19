clear all
close all
clc

L = 1000;
filtre = zeros(1, L);

%% 1
% a)
filtre(1:275)= 1;
filtre(276:760) = 0;
filtre(761:L)= 1;

filtre = [filtre, filtre(end), filtre(end:-1:2)];
ifftH = ifftshift(ifft(filtre));

h = ifftH.*[zeros(1, 985), ones(1, 31), zeros(1, 984)];
H = abs(fft(h));

figure
plot(filtre)
title('Carré')
axis([0 2*L 0 2])
hold on
plot(H)

% b)
h = ifftH.*[zeros(1, 985), triang(31)', zeros(1, 984)];
H = abs(fft(h));

figure
plot(filtre)
title('Triangle')
axis([0 2*L 0 2])
hold on
plot(H)

% c)
h = ifftH.*[zeros(1, 985), hamming(31)', zeros(1, 984)];
H = abs(fft(h));

figure
plot(filtre)
title('Hamming')
axis([0 2*L 0 2])
hold on
plot(H)

% d)
fenetreKaiser = [zeros(1, 985), kaiser(31, 2.65)', zeros(1, 984)];
h = ifftH.*fenetreKaiser;
H = abs(fft(h));

figure
plot(filtre)
axis([0 2*L 0 2])
title('Kaiser')
hold on
plot(H)

% e)
grpdelay(fenetreKaiser(985:1016),1)

% f)
y70 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,7,0)));
y61 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,6,1)));
y52 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,5,2)));
y43 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,4,3)));
y34 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,3,4)));
y25 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,2,5)));
y16 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,1,6)));
y07 = abs(fft(filter_Qmn([1 zeros(1,1999)],h,1,2,0,7)));

plot(y70)
plot(y61)
plot(y52)
plot(y43)
plot(y34)
plot(y25)
plot(y16)
plot(y07)
hold off

%% 2
wc = 0.4;
wc2 = 0.6;

% a)
[B,A] = butter(2, wc, 'low');
figure
freqz(B,A)
title('butter passe-bande ordre 20')
[B,A] = cheby1(2, 0.5, wc, 'low');
figure
freqz(B,A)
title('cheby1 passe-bande ordre 20')
[B,A] = cheby2(2, 20, wc, 'low');
figure
freqz(B,A)
title('cheby2 passe-bande ordre 20')

% b)
[B,A] = butter(10, wc, 'low');
figure
freqz(B,A)
title('butter passe-bande ordre 20')
[B,A] = cheby1(10, 0.5, wc, 'low');
figure
freqz(B,A)
title('cheby1 passe-bande ordre 20')
[B,A] = cheby2(10, 20, wc, 'low');
figure
freqz(B,A)
title('cheby2 passe-bande ordre 20')

% c)
[B,A] = butter(4, [wc wc2]);
figure
freqz(B,A)
title('butter passe-bande ordre 20')
[B,A] = cheby1(4, 0.5, [wc wc2]);
figure
freqz(B,A)
title('cheby1 passe-bande ordre 20')
[B,A] = cheby2(4, 20, [wc wc2]);
figure
freqz(B,A)
title('cheby2 passe-bande ordre 20')

% d)
[B,A] = butter(20, [wc wc2]);
figure
freqz(B,A)
title('butter passe-bande ordre 20')
[B,A] = cheby1(20, 0.5, [wc wc2]);
figure
freqz(B,A)
title('cheby1 passe-bande ordre 20')
[B,A] = cheby2(20, 20, [wc wc2]);
figure
freqz(B,A)
title('cheby2 passe-bande ordre 20')

