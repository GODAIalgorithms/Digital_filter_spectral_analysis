echo on
N = 8;  % 8 notches on comb
r = 0.95;
rN = r.^N;

% FIR comb  - type 1
b = zeros(1,N+1);
b(1) = 1; b(N+1) = -1
a = [1];
plot_filter(b,a);
pause
% IIR comb - type 1
b = zeros(1,N+1);
b(1) = 1; b(N+1) = -1
a = zeros(1,N+1);
a(1) = 1; a(N+1) = -rN
plot_filter(b,a);
pause

% FIR comb  - type 2
b = zeros(1,N+1);
b(1) = 1; b(N+1) = 1
a = [1];
plot_filter(b,a);
pause
% IIR comb - type 2
b = zeros(1,N+1);
b(1) = 1; b(N+1) = 1
a = zeros(1,N+1);
a(1) = 1; a(N+1) = rN
plot_filter(b,a);



