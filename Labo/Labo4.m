close all
clear
clc


Fe = 1;
Te = 1/Fe;
Thetac = 0.5;

%a
[bz,az] = butter(4,Thetac,'low');

%b
wc = 2 * tan(Thetac*pi/2);

%c
[bs,as] = butter(4,wc,'low','s');

%d
[bd,ad] = bilinear(bs,as,Fe);

%e
figure
zplane(bz,az)
figure
pzmap(bs,as)

%f
[Hz,wz] = freqz(bz,az);
[Hd,wd] = freqz(bd,ad);
[Hs,ws] = freqs(bs,as);

figure
plot(2 * tan(wz/2),db(abs(Hz)))
hold on
plot(2 * tan(wd/2),db(abs(Hd)))
plot(ws,db(abs(Hs)))

axis([0,10,-80,10])


