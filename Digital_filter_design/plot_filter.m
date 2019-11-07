function plot_filter(b, a);

figure(1)
zplane(b,a);
title('Pole Zero plot');
figure(2)
freqz(b,a);
title('Frequency Response');
x = zeros(50,1);
x(1) = 1;
y = filter(b,a,x);
figure(3);
plot(y);
ylabel('Magnitude');
xlabel('Sample number');
title('Impulse Response');
