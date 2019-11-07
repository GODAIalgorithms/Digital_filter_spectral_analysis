% 3D plot of cos(wt) split up as (exp(jwt) + exp(-jwt)) / 2

%fig=figure;
%set(fig,'DoubleBuffer','on');
%set(gca,'xlim',[-80 80],'ylim',[-80 80],...
%       'NextPlot','replace','Visible','off')

f = 1;
w = 2*pi*f;
ts = 0.01;
tmax = 2;
t = 0:ts:tmax;
signal1 = exp( j*w*t) ;
signal2 = exp(-j*w*t) ;
signal = (signal1 + signal2)/2;
hold off
plot3(t, imag(signal1), real(signal1), 'r-');
hold on
plot3(t, imag(signal2), real(signal2), 'g-');
plot3(t, imag(signal), real(signal), 'b-');
grid on
axis square
xlabel('t (s)');
zlabel('Real part');
ylabel('Imaginary part');
cameratoolbar
