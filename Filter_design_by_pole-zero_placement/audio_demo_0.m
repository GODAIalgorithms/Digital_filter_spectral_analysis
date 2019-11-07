[x,fs,nbits] = wavread('Audio Sample.wav');
%wavplay(x,fs);  % Play audio
xn = 0.9 * x(:,1)';
N = length(xn);
n = 1:N;
Ts = 1/fs;  % sampling time
t = n * Ts;
f0 = 1000; % 1KHz
noise_gain = 0.25;
noise = noise_gain * cos(2*pi*f0*t);
xn = xn + noise;
display ('Signal in the Time Domain');
td = figure('Name', 'Time Domain');
plot(t,xn);
xlabel('Time (s)');
ylabel('Amplitude');
pause;

display ('Play');
wavplay(xn,fs);  % Play short clip
pause

Xk = fft(xn); % DFT
%save fftData Xk
%load fftData
k = 0:N-1; 
f=k*fs/N;   % Frequency in Hz
display ('Signal in the Frequency Domain');
fd = figure('Name', 'Frequency Domain');
plot(f,abs(Xk));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
pause;
axis([0,1500,0,65000]);
pause;

%------------------------------------------------------------------------
% Filter 1
display ('Filter 1');
angle = 2*pi * (f0-700)/ fs;
radius = 0.99;
b1 = [1, -2*cos(angle), 1];
a1 = [1, -2*radius*cos(angle), radius*radius];
flt = figure('Name', 'Filter 1');
zplane(b1,a1);
pause
freqz(b1,a1)
pause

%Filter
yn = filter(b1,a1,xn);
display ('Play Signal filtered with Filter 1');
wavplay (yn,fs);  % Play short clip
pause
display ('Show filtered Signal');
fltsg = figure ('Name', 'Filtered Signal');
plot(t,yn);
xlabel('Time (s)');
ylabel('Amplitude');
pause;
Yk = fft(yn); % DFT
%save fftData Xk
%load fftData
k = 0:N-1; 
f=k*fs/N;   % Frequency in Hz
plot(f,abs(Yk));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
pause;
axis([0,1500,0,65000]);
pause;

%------------------------------------------------------------------------
% Filter 2
display ('Filter 2');
angle = 2*pi * (f0-400)/ fs;
radius = 0.89;
b2 = [1, -1.05*cos(angle)];
a2 = 1;
flt2 = figure('Name', 'Filter 2');
zplane(b2,a2);
pause
freqz(b2,a2)
pause

%Filter
yn = filter(b2,a2,xn);
display ('Play Signal filtered with Filter 2');
wavplay (yn,fs);  % Play short clip
pause
figure(fltsg);
plot(t,yn);
xlabel('Time (s)');
ylabel('Amplitude');
pause;
Yk = fft(yn); % DFT
%save fftData Xk
%load fftData
k = 0:N-1; 
f=k*fs/N;   % Frequency in Hz
plot(f,abs(Yk));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
pause;
axis([0,1500,0,10000]);
pause;

%------------------------------------------------------------------------
% Filter 3
display ('Filter 3');
angle = 2*pi * (f0)/ fs;
radius = 0.99;
b3 = [1];
a3 = [1, -1*radius*cos(angle), radius*radius];
flt3 = figure('Name', 'Filter 3');
zplane(b3,a3);
pause
freqz(b3,a3)
pause

%Filter
yn = filter(b3,a3,xn);
display ('Play Filter 3');
wavplay (yn,fs);  % Play short clip
pause
figure(fltsg);
plot(t,yn);
xlabel('Time (s)');
ylabel('Amplitude');
pause;
Yk = fft(yn); % DFT
%save fftData Xk
%load fftData
k = 0:N-1; 
f=k*fs/N;   % Frequency in Hz
plot(f,abs(Yk));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
pause;
axis([0,1500,0,10000]);
pause;

%------------------------------------------------------------------------
% Filter 4
display ('Filter 4');
angle = 2*pi * f0 / fs;
radius = 0.99;
b4 = [1, -2*cos(angle), 1];
a4 = [1, -2*radius*cos(angle), radius*radius];
flt4 = figure('Name', 'Filter 4');
zplane(b4,a4);
pause
freqz(b4,a4)
pause

%Filter
yn = filter(b4,a4,xn);
display ('Play Filter 4');
wavplay (yn,fs);  % Play short clip
figure(fltsg);
plot(t,yn);
xlabel('Time (s)');
ylabel('Amplitude');
pause;
Yk = fft(yn); % DFT
%save fftData Xk
%load fftData
k = 0:N-1; 
f=k*fs/N;   % Frequency in Hz
plot(f,abs(Yk));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
pause;
axis([0,1500,0,10000]);
pause;



