% 3D Plot of exp(jwt)

%fig=figure;
%set(fig,'DoubleBuffer','on');
%set(gca,'xlim',[-80 80],'ylim',[-80 80],...
%       'NextPlot','replace','Visible','off')

f = -1;
w = 2*pi*f;
ts = 0.01;
tmax = 2;
t = 0:ts:tmax;
signal = exp( j*w*t) ;
hold off
%plot3(real(signal), imag(signal), t, 'b-');
plot3(t, imag(signal), real(signal), 'b-');
grid on
axis square
%zlabel('t (s)');
%xlabel('Real part');
%ylabel('Imaginary part');
xlabel('t (s)');
zlabel('Real part');
ylabel('Imaginary part');
cameratoolbar
