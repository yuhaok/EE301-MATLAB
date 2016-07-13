load('lab6_data.mat');
figure(1)
plot(step_time, step_signal,'Linewidth', 1.01);
title('Step Signal');

signal_mean = sum(abs(step_signal).^2)/length(step_signal);
display(signal_mean);

[CC, ww] = fourier_analysis(step_signal(1:16384), 1, 50);
mag = abs(CC);
phase = angle(CC);
figure(2)
subplot(2,1,1);
stem(ww,mag,'Linewidth', 1.01);
xlabel('frequency');
ylabel('magnitude');
title('Frequency VS Magnitude');



subplot(2,1,2);
stem(ww,phase,'Linewidth', 1.01);
xlabel('frequency');
ylabel('phase');
title('Frequency VS Phase');