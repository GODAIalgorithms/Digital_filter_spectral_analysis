echo on
% 1st order FIR - low pass
b = [1 1];   a = [1];
plot_filter(b,a);
pause
% 1st order FIR - high pass
b = [1 -1];   a = [1];
plot_filter(b,a);
pause
% 2nd order FIR (zeros inside unit circle)
angle = pi/4;
r = 0.9;
a = [1];
b = [1, -2*r*cos(angle), r*r];
plot_filter(b,a);
pause
% 2nd order FIR (zeros on unit circle)
angle = pi/4;
r = 1;
a = [1];
b = [1, -2*r*cos(angle), r*r];
plot_filter(b,a);
pause

% 1st order IIR - low pass
a = [1 0.9];   b = [1];
plot_filter(b,a);
pause
% 1st order IIR - high pass
a = [1 -0.9];   b = [1];
plot_filter(b,a);
pause
% 2nd order IIR (poles inside unit circle)
angle = pi/4;
r = 0.9;
a = [1, -2*r*cos(angle), r*r];
b = [1];
plot_filter(b,a);
pause
% 2nd order IIR (poles on unit circle)
angle = pi/4;
r = 1;
a = [1, -2*r*cos(angle), r*r];
b = [1];
plot_filter(b,a);
pause
% 2nd order IIR (poles outside unit circle)
angle = pi/4;
r = 1.1;
a = [1, -2*r*cos(angle), r*r];
b = [1];
plot_filter(b,a);


