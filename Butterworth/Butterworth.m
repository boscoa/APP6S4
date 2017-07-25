function img = Butterworth(s1,Fe)
    RIFlowpass = RIFsetup();
    s1 = [s1; zeros(42,1)];
    sig1 = filter(RIFlowpass,s1);
    sig1 = sig1(43:end);
    sig1 = downsample(sig1,6);
    Fe = Fe/6;
    delai = 13;

    sig1 = [sig1; zeros(delai-1,1)];

    d1 = 400;
    d2= 600;
    [b,a] = butter(1, [d1 d2]/4000);
    r1 = filter(b,a,sig1);
    r1 = r1(delai:end);

    d1 = 900;
    d2= 1100;
    [b,a] = butter(1, [d1 d2]/4000);
    r2 = filter(b,a,sig1);
    r2 = r2(delai:end);

    d1 = 1400;
    d2= 1600;
    [b,a] = butter(1, [d1 d2]/4000);
    r3  = filter(b,a,sig1);
    r3 = r3(delai:end);

    d1 = 1900;
    d2= 2100;
    [b,a] = butter(1, [d1 d2]/4000);
    r4 = filter(b,a,sig1);
    r4 = r4(delai:end);

    d1 = 2400;
    d2= 2600;
    [b,a] = butter(1, [d1 d2]/4000);
    r5 = filter(b,a,sig1);
    r5 = r5(delai:end);

    d1 = 2900;
    d2= 3100;
    [b,a] = butter(1, [d1 d2]/4000);
    r6 = filter(b,a,sig1);
    r6 = r6(delai:end);

    thresbits = [];
    img = [];
    thres = 0.03;
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

        img = [img bi2de(bits)];
    end

    thresbits = reshape(thresbits, [6,16384]);

%     subplot(3,2,1)
%     plot(thresbits(1,:),'.');
% 
%     subplot(3,2,2)
%     plot(thresbits(2,:),'.');
% 
%     subplot(3,2,3)
%     plot(thresbits(3,:),'.');
% 
%     subplot(3,2,4)
%     plot(thresbits(4,:),'.');
% 
%     subplot(3,2,5)
%     plot(thresbits(5,:),'.');
% 
%     subplot(3,2,6)
%     plot(thresbits(6,:),'.');

    img = reshape(img,[128,128]);
end
