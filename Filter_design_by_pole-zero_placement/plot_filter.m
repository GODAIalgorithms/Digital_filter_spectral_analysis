function plot_filter(b, a)

figure(1)
zplane(b,a);

figure(2)
freqz(b,a);

figure(3)
x = zeros(100,1);
x(1) = 1;
y = filter(b,a,x);
plot(0:99,y)
title('Impulse response');