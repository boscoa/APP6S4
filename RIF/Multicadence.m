function [ sig ] = Multicadence( SO )
%MULTICADENCE Summary of this function goes here
%   Detailed explanation goes here
[RIFlowpass,b] = RIFsetup();
SO = [SO; zeros(42,1)];
sig = filter(b(1:6:end),1,SO(1:6:end)) + filter(b(2:6:end),1,SO(2:6:end)) + filter(b(3:6:end),1,SO(3:6:end)) + filter(b(4:6:end),1,SO(4:6:end)) + filter(b(5:6:end),1,SO(5:6:end)) + filter(b(6:6:end),1,SO(6:6:end));
sig = sig(8:end);
%sig = downsample(sig,6);

end

