clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

imgcheby1 = DecodeCheby1(s1,Fe);
imgchebyqmn1 = DecodeCheby1Qmn(1,8,s1,Fe);
% imgcheby2 = DecodeCheby1(s2,Fe);
% imgchebyqmn2 = DecodeCheby1Qmn(0,6,s2,Fe);

figure
imshow(imgcheby1,[0 63]);
figure
imshow(imgchebyqmn1,[0 63]);
figure
imshow(imgcheby2,[0 63]);
figure
imshow(imgchebyqmn2,[0 63]);

[ratio1 mse1] = PSNR(imgcheby1,imgchebyqmn1);
[ratio2 mse2] = PSNR(imgcheby2,imgchebyqmn2);





