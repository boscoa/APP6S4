clear all
close all
clc

[s1, Fe] = audioread('Sons/signal_A.wav');
[s2, Fe] = audioread('Sons/signal_B.wav');

RIFlowpass = RIFsetup();

s1 = filter(RIFlowpass,s1);
s1 = downsample(s1,6);
Fe = Fe/6;

for id = 1:32:length(s1);
    sig1 = s1(id:id+32);

    figure
    subplot(3,2,1);
    [b,a] = cheby1(1,10,[499 501]/(Fe/2));
    r = filter(b,a,sig1);
    []
%     plot(abs(fft(r,Fe)));

    subplot(3,2,2);
    [b,a] = cheby1(1,10,[999 1001]/(Fe/2));
    r = filter(b,a,sig1);
%     plot(abs(fft(r,Fe)));

    subplot(3,2,3);
    [b,a] = cheby1(1,10,[1499 1501]/(Fe/2));
    r = filter(b,a,sig1);
%     plot(abs(fft(r,Fe)));

    subplot(3,2,4);
    [b,a] = cheby1(1,10,[1999 2001]/(Fe/2));
    r = filter(b,a,sig1);
%     plot(abs(fft(r,Fe)));

    subplot(3,2,5);
    [b,a] = cheby1(1,10,[2499 2501]/(Fe/2));
    r = filter(b,a,sig1);
%     plot(abs(fft(r,Fe)));

    subplot(3,2,6);
    [b,a] = cheby1(1,10,[2999 3001]/(Fe/2));
    r = filter(b,a,sig1);
%     plot(abs(fft(r,Fe)));
end



    % dTheta = 0.01;
    % delta1 = 0.01;
    % delta2 = 0.01;
    % beta = 0;
    % A = -20*log(delta1);
    % if A> 50
    %     beta = 0.1102*(A-8.7);
    % elseif (21<A)&&(50>A)
    %     beta = 0.5842*((A-21).^0.4) + 0.07886*(A-21);
    % else 
    %     beta = 0;
    % end
    % N = int32((A-8)/(2.285*dTheta));

    % fKaiser = kaiser(N,beta);
    % plot(fKaiser);