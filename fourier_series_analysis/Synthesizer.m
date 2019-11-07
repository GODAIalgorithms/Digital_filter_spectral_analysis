% Load and play
load('trumpet.mat');
sound(trumpet,11025);
wavwrite(trumpet,11025,'trumpetW.wav');
plot(trumpet(1:500));

pause;
% Fourier Series
FS = 11025;
Y = fft(trumpet,512)/512;
Ymag = abs(Y);
f = FS * (0:256)/512;
figure;
plot(f,Ymag(1:257)*2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');


