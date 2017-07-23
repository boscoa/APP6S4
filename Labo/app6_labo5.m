clear all
close all
clc

% NUMERO 5
b = [1 -3.6639 3.9061 1.6121 -6.6983 5.2760 -1.4400];

a = [1 -3.5540 4.3901 -1.0694 -2.3340 2.1401 -0.5666];

[z, p, k] = tf2zpk(b, a)

[H, Omega] = freqz(b,a); 
main_filter = db(abs(H));
main_filter_Back = main_filter;
figure
plot( Omega, main_filter, 'b')
hold on

f1_z = [z(1) z(2)];
f1_p = [p(1) p(6)];
b1 = poly(f1_z);
a1 = poly(f1_p);

f2_z = [z(3) z(4)];
f2_p = [p(2) p(3)];
b2 = poly(f2_z);
a2 = poly(f2_p);

f3_z = [z(5) z(6)];
f3_p = [p(4) p(5)];
b3 = poly(f3_z);
a3 = poly(f3_p);

[H1, Omega] = freqz(b1,a1); 
[H2, Omega] = freqz(b2,a2); 
[H3, Omega] = freqz(b3,a3); 

test_result = db(abs(H1) .* abs(H2) .* abs(H3));
plot( Omega, test_result, 'r');

err = immse(main_filter, test_result)

% PART TWO
tr = 1000;

b = round(b*tr)/tr;
a = round(a*tr)/tr;
[H, Omega] = freqz(b,a); 
main_filter = db(abs(H));
figure
plot( Omega, main_filter, 'g')
hold on

f1_z = [z(1) z(2)];
f1_p = [p(1) p(6)];
b1 = poly(f1_z);
a1 = poly(f1_p);
b1 = round(b1*tr)/tr;
a1 = round(a1*tr)/tr;

f2_z = [z(3) z(4)];
f2_p = [p(2) p(3)];
b2 = poly(f2_z);
a2 = poly(f2_p);
b2 = round(b2*tr)/tr;
a2 = round(a2*tr)/tr;

f3_z = [z(5) z(6)];
f3_p = [p(4) p(5)];
b3 = poly(f3_z);
a3 = poly(f3_p);
b3 = round(b3*tr)/tr;
a3 = round(a3*tr)/tr;

[H1, Omega] = freqz(b1,a1); 
[H2, Omega] = freqz(b2,a2); 
[H3, Omega] = freqz(b3,a3); 
test_result = db(abs(H1) .* abs(H2) .* abs(H3));
plot( Omega, test_result, 'k');

err = immse(main_filter, test_result)

plot( Omega, main_filter_Back, 'r')

