load('lab4_data.mat');
cs_1 = code_signal(170,10); cs_2 = code_signal(25,6);
figure(1);
subplot(3,1,1);
stairs(cs_1);
xlabel('t');
ylabel('cs_1');
axis([1, 100, -1.5, 1.5]);
title('Guided Exercises 3.3(a) Plot Code Signals CS 1'); subplot(3,1,2);
stairs(cs_2);
xlabel('t');
ylabel('cs_2');
axis([1, 60, -1.5, 1.5]);
title('Guided Exercises 3.3(a) Plot Code Signals CS 2'); subplot(3,1,3);
stairs(dsss);
xlabel('t');
ylabel('x_3(t)');
axis([1, 1000, -5, 5]);
title('Guided Exercises 3.1(a) Plot Code Signals dsss');
figure(2)
cor_1 = run_corr(cs_1,dsss);
sub_cor1 = cor_1(length(cs_1):length(cs_1):length(cor_1)); subplot(2,1,1);
plot(1:length(cor_1), cor_1);
title('Cor-1');
subplot(2,1,2);
stem(sub_cor1);title('Sub-cor-1');
figure(3)
cor_2 = run_corr(cs_2,dsss);
sub_cor2 = cor_2(length(cs_2):length(cs_2):length(cor_2)); subplot(2,1,1);
plot(1:length(cor_2), cor_2);
title('Cor-2');
subplot(2,1,2);
stem(sub_cor2);
title('Sub-cor-2');

%%Decode:
%%Sub_cor_1: 0 1 1 1 1 1 0 0 0 0
%%Sub_cor_2: 0 1 1 0 1 0 0 0 0 0 1 0 1 1 1 1 0
%%The decoding of code_2 the 4th 6th 7th 11th bits might be incorrect, 
%%because the original signal is periodic with a -1 -> 1 -> -1 -> 1 pattern, 
%%there should not be ?-1? in the ?1? segment