clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

imgcheby1 = DecodeCheby1(s1,Fe);
imgchebyqmn1 = DecodeCheby1Qmn(1,8,s1,Fe);
imgcheby2 = DecodeCheby1(s2,Fe);
imgchebyqmn2 = DecodeCheby1Qmn(1,8,s2,Fe);

imgbutter1 = Butterworth(s1,Fe);
imgbutterqmn1 = ButterworthQmn(1,8,s1,Fe);
imgbutter2 = Butterworth(s2,Fe);
imgbutterqmn2 = ButterworthQmn(1,8,s2,Fe);
 
% figure
% imshow(imgcheby1,[0 63]);
% figure
% imshow(imgchebyqmn1,[0 63]);
% figure
% imshow(imgcheby2,[0 63]);
% figure
% imshow(imgchebyqmn2,[0 63]);
% figure
% imshow(imgbutter1,[0 63]);
% figure
% imshow(imgbutterqmn1,[0 63]);
% figure
% imshow(imgbutter2,[0 63]);
% figure
% imshow(imgbutterqmn2,[0 63]);


[ratio1, ms1] = PSNR(imgcheby1,imgchebyqmn1);
[ratio2, ms2] = PSNR(imgcheby2,imgchebyqmn2);
[ratio3, ms3] = PSNR(imgbutter1,imgbutterqmn1);
[ratio4, ms4] = PSNR(imgbutter2,imgbutterqmn2);

