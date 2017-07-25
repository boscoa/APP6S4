function sig = Multicadence(SO)

    [Hd,h] = RIFsetup();
%     SO = [SO; zeros(42,1)];
    sig = filter(h(6:6:end),1,SO(6:6:end));
    sig = sig + filter(h(5:6:end),1,SO(5:6:end));
    sig = sig + filter(h(4:6:end),1,SO(4:6:end));
    sig = sig + filter(h(3:6:end),1,SO(3:6:end));
    sig = sig + filter(h(2:6:end),1,SO(2:6:end));
    sig = sig + filter(h(1:6:end),1,SO(1:6:end));
%     sig = sig(43:end);
end