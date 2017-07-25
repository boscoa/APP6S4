function img = DecodeCheby1Qmn(m,n,SO,Fe)
    RIFlowpass = RIFsetup();
    SO = [SO; zeros(42,1)];
    sig = filter(RIFlowpass,SO);
    sig = sig(43:end);
    sig = downsample(sig,6);
    Fe = Fe/6;
    delai = 8;

    sig = [sig; zeros(delai-1,1)];
    
    [b,a] = cheby1(1,1,[400 600]/(Fe/2));
    r1 = filter_Qmn(sig,b,a,2,m,n)';
    r1 = r1(delai:end);

    [b,a] = cheby1(1,1,[900 1100]/(Fe/2));
    r2 = filter_Qmn(sig,b,a,2,m,n)';
    r2 = r2(delai:end);

    [b,a] = cheby1(1,1,[1400 1600]/(Fe/2));
    r3  = filter_Qmn(sig,b,a,2,m,n)';
    r3 = r3(delai:end);

    [b,a] = cheby1(1,1,[1900 2100]/(Fe/2));
    r4 = filter_Qmn(sig,b,a,2,m,n)';
    r4 = r4(delai:end);

    [b,a] = cheby1(1,1,[2400 2600]/(Fe/2));
    r5 = filter_Qmn(sig,b,a,2,m,n)';
    r5 = r5(delai:end);

    [b,a] = cheby1(1,1,[2900 3100]/(Fe/2));
    r6 = filter_Qmn(sig,b,a,2,m,n)';
    r6 = r6(delai:end);

    thresbits = [];
    img = zeros(1,128*128);
    thres = 0.03;
    i = 0;
    for id = 1:32:length(r1)-31
        bits = [];
        t1 = r1(id:id+31) .* triang(32);
        t2 = r2(id:id+31) .* triang(32);
        t3 = r3(id:id+31) .* triang(32);
        t4 = r4(id:id+31) .* triang(32);
        t5 = r5(id:id+31) .* triang(32);
        t6 = r6(id:id+31) .* triang(32);
        bit1 = mean(abs(t1));
        bit2 = mean(abs(t2));
        bit3 = mean(abs(t3));
        bit4 = mean(abs(t4));
        bit5 = mean(abs(t5));
        bit6 = mean(abs(t6));

        thresbits = [thresbits bit1 bit2 bit3 bit4 bit5 bit6];

        if (bit1 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        if (bit2 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        if (bit3 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        if (bit4 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        if (bit5 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        if (bit6 > thres)
            bits = [bits 1];
        else
            bits = [bits 0];
        end
        i = i+1;
        img(i) = bi2de(bits);
    end
    thresbits = reshape(thresbits, [6,16384]);

    % figure
    % subplot(3,2,1)
    % plot(thresbits(1,:),'.');
    % 
    % subplot(3,2,2)
    % plot(thresbits(2,:),'.');
    % 
    % subplot(3,2,3)
    % plot(thresbits(3,:),'.');
    % 
    % subplot(3,2,4)
    % plot(thresbits(4,:),'.');
    % 
    % subplot(3,2,5)
    % plot(thresbits(5,:),'.');
    % 
    % subplot(3,2,6)
    % plot(thresbits(6,:),'.');

    img = reshape(img,[128,128]);
end
