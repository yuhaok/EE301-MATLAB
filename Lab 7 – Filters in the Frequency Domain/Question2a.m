%Q2a
fc = 770;
fs = 8192;
hk = [];
for k=0:50
    hk = [hk, sin(2*pi*fc*k/fs)];
end
figure(1)
stem(hk);
title('Impulse Response of a 770 Hz Bandpass Filter');
xlabel('M');
ylabel('Impulse Response');
