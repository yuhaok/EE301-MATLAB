load('lab6_data.mat');
figure(1)
plot(step_time, step_signal,'Linewidth', 1.01);

N1 = 25;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N1);
[ss,tt]=fourier_synthesis(CC,1,1,16384);
figure(2)
subplot(4,1,1);
plot(tt,ss, 'Linewidth', 1.01);
xlabel('t');
ylabel('signal');
title('Resynthesized signal for N = 25');
%display(N);

diff = (ss - step_signal(1:16384));
S_mean1 = sum((abs(diff)).^2)/length(diff);
squaredCC1 = sum(abs(CC).^2);


N2 = 50;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N2);
[ss,tt]=fourier_synthesis(CC,1,1,16384);
subplot(4,1,2);
plot(tt,ss, 'Linewidth', 1.01);
xlabel('t');
ylabel('signal');
title('Resynthesized signal for N = 50');

diff = (ss - step_signal(1:16384));
S_mean2 = sum((abs(diff)).^2)/length(diff);
squaredCC2 = sum(abs(CC).^2);


N3 = 100;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N3);
[ss,tt]=fourier_synthesis(CC,1,1,16384);
subplot(4,1,3);
plot(tt,ss, 'Linewidth', 1.01);
xlabel('t');
ylabel('signal');
title('Resynthesized signal for N = 100');
%display(N);

diff = (ss - step_signal(1:16384));
S_mean3 = sum((abs(diff)).^2)/length(diff);
squaredCC3 = sum(abs(CC).^2);
%display(S_mean);
%display(squaredCC);


N4 = 200;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N4);
[ss,tt]=fourier_synthesis(CC,1,1,16384);
subplot(4,1,4);
plot(tt,ss, 'Linewidth', 1.01);
xlabel('t');
ylabel('signal');
title('Resynthesized signal for N = 200');

diff = (ss - step_signal(1:16384));
S_mean4 = sum((abs(diff)).^2)/length(diff);
squaredCC4 = sum(abs(CC).^2);

step_sig_mean_sqr = sum(abs(step_signal).^2)/length(step_signal);
display(step_sig_mean_sqr);
display(N1);
display(S_mean1);
display(squaredCC1);

display(N2);
display(S_mean2);
display(squaredCC2);

display(N3);
display(S_mean3);
display(squaredCC3);

display(N4);
display(S_mean4);
display(squaredCC4);


figure(3)
plot([S_mean1, S_mean2, S_mean3, S_mean4], [squaredCC1, squaredCC2, squaredCC3, squaredCC4],'r+', 'Linewidth', 1.01);
xlabel('mean-squared error');
ylabel('sum of squared magnitudes');

%It shows that the sum of squared magnitude of the signals CC and the mean squared error of the resynthesis signal has a linear relationship, such as: 
%Sum= -mean_squared_error + 0.375


