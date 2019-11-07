% Animation of  exp(jwt) spit up into real and imaginary components
% Uncomment these lines containing 'mov' to create an avi file

% mov = avifile('eg1.avi', 'fps', 5)
% mov.Compression = 'None'

f = 0.5;
w = 2*pi*f;
nMax = 100;
ts = 1/25;
n = 0:nMax;
x = exp( j*w*n*ts );
t = n*ts;
for ni = 0:nMax;
    ti = ni*ts 
    omega = j*w*ti
    xi = exp( omega )
    clf
    subplot(2,2,[1 3])
    hold on
    plot([-2,2], [0,0], 'k');
    plot([0,0], [-2,2], 'k');
    axis equal
    axis([-1.1,1.1,-1.1,1.1]);
    plot( x );
    plot( real(xi), imag(xi), 'rx' );
    plot( [0,real(xi)], [0,imag(xi)], 'r' );
    subplot(2,2,2)
    hold on
    plot([0,4], [0,0], 'k');
    axis([0,4,-1.1,1.1]);
    plot(t, real(x) );
    plot( ti,real(xi), 'rx' );
    plot( [ti,ti], [0,real(xi)], 'r' );
    subplot(2,2,4)
    hold on
    plot([0,4], [0,0], 'k');
    axis([0,4,-1.1,1.1]);
    plot(t, imag(x) );
    plot( ti,imag(xi), 'rx' );
    plot( [ti,ti], [0,imag(xi)], 'r' );
    F = getframe(gcf);
    % mov = addframe(mov,F);
end

%mov = close(mov);
