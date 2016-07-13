%{
q4a  
The energy of the radar pulse is 37.5
We cannot identify the reflected pulse in the received signal by visual
inspection

q4b
Receive pulses appear at those points where the receiving signals and original signals are highly correlated.
The first peak is at the 667th sample, 
the second peak is at the 1032nd sample, 
the third peak is at the 1919th sample, 
and the fourth peak is at the 4290?s peak.
The first object: 667 / 10 ^ 7 * 3 * 10 ^ 8 / 2 = 10005 m 
The second object: 1032 / 10^7 * 3 * 10 ^ 8 / 2 = 15480 m 
The third object: 1919 / 10^7 * 3 * 10 ^ 8 / 2 = 28785 m 
The fourth object: 4290 / 10^7 * 3 * 10 ^ 8 / 2 = 64350 m

q4c
countGT = 118 countLT = 98
There are 118 samples greater than the threshold and 
98 samples less than the threshold.
false alarm rate: 118 / 5098 = 0.023
miss rate: 98 / 5098 = 0.019
Total error rate: 0.023 + 0.019 = 0.042

q4d
The threshold is +18.75 and -18.75.
We count from the bars the number of samples that is greater than 18.75 and - 18.75.
To get the total error rate we divide the number by the total sample numbers


q4e
As the false alarm rate should not exceed 0.004, 
we shall have at most 5098 * 0.004 = 20.392 
samples that exceed the threshold.
Threshold: 20.15
countGT = 20 countLT = 497
False alarm rate: 20 / 5098 = 0.0039
Miss alarm rate: 497 / 5098 = 0.097
Total error rate: 0.0039 + 0.097 = 0.1009
Compared with 4)c), the miss alarm rate increases significantly and the total error rate almost doubled.

%}
load('lab4_data.mat');
Ex = sum(radar_pulse.*radar_pulse);
display(Ex);

figure(1)
subplot(2,1,1);
stairs(radar_pulse);
xlabel('t');
ylabel('Radar Pulse');
axis([1, 100, -1.5, 1.5]);
title('Guided Exercises 3.4(a) Plot Radar Pulse'); subplot(2,1,2);
stairs(radar_received);
xlabel('t');
ylabel('Radar Received');
axis([1, 5000, -1.5, 1.5]);
title('Guided Exercises 3.4(a) Plot Radar Received');

figure(2)
radar_corr = run_corr(radar_pulse, radar_received); plot(1:length(radar_corr), radar_corr, 'black*');
grid on;
title('Correlation between radar pulse and radar received'); %hold on

figure(3)
noise_c = run_corr(radar_pulse, radar_noise);
threshold = Ex/2;
threshold2 = threshold - Ex;
countGT = sum(noise_c>=25.15);
countLT = sum(noise_c<=25.15-Ex);
display(countGT);
display(countLT);
plot(1:length(noise_c), noise_c);
title('Correlation between radar pulse and radar noise');
hold on
%plot(1:length(noise_c), ones(1,length(noise_c))*threshold); %plot(1:length(noise_c), ones(1,length(noise_c))*threshold2); plot(1:length(noise_c), ones(1,length(noise_c))*25.15); plot(1:length(noise_c), ones(1,length(noise_c))*(25.15-Ex));

figure(4)
hist(noise_c, 100);
grid on;
title('Noise C in 100 bins')