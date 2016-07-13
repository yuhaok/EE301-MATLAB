code_1 = code_signal(75,10);
mean_1 = sum(code_1)/length(code_1);
energy_1 = sum(code_1 .* code_1);
display(mean_1);
display(energy_1);

code_2 = code_signal(50,10);
mean_2 = sum(code_2)/length(code_2);
energy_2 = sum(code_2 .* code_2); 
display(mean_2);
display(energy_2);

code_3 = code_signal(204,10);
mean_3 = sum(code_3)/length(code_3);
energy_3 = sum(code_3 .* code_3);
display(mean_3);
display(energy_3);

subplot(3,1,1);
stairs(code_1);
xlabel('t');
ylabel('x_1(t)');
axis([1, 100, -1.5, 1.5]);
title('Guided Exercises 3.1(a) Plot Code Signals Code 1'); 
subplot(3,1,2);

stairs(code_2);
xlabel('t');
ylabel('x_2(t)');
axis([1, 100, -1.5, 1.5]);
title('Guided Exercises 3.1(a) Plot Code Signals Code 2'); 
subplot(3,1,3);

stairs(code_3);
xlabel('t');
ylabel('x_3(t)');
axis([1, 100, -1.5, 1.5]);
title('Guided Exercises 3.1(a) Plot Code Signals Code 3');

corr_12 = sum(code_1.*code_2);
corr_23 = sum(code_2.*code_3);
corr_13 = sum(code_1.*code_3);
display(corr_12);
display(corr_23);
display(corr_13);