load('lab8_data');

%Question1a
simple_filter = filter(1/7*ones(1,7), 1, simple);
simple_filter2 = filter2((ones(1,7)/7)', simple, 'same');
figure(1)
subplot(3,1,1);
plot(simple,'b','Linewidth', 1.01);
title('Signal: simple');
subplot(3,1,2);
plot(simple_filter, 'g','Linewidth', 1.01);
title('Signal: simple, with filter');
subplot(3,1,3);
plot(simple_filter2, 'm','Linewidth', 1.01);
title('Signal: simple, with filter2');

smError_flt1 = sum((simple_filter-simple).^2)/length(simple_filter);
smError_flt2 = sum((simple_filter2-simple).^2)/length(simple_filter);
display(smError_flt1);
display(smError_flt2);

%sing filter function introduces a delay. 
%There are 7 samples of delay, 
%the reason is that the bb vector we applied is [1/7 1/7 1/7 1/7 1/7 1/7 1/7].

% The mean-squared error:
%smError_flt1 =
%160.3250
%smError_flt2 =
%43.6464
%The error with second filter is much lower


%Question 1b
MS_v1 = sum((simple - simple_noise).^2)/length(simple);
simple_ns_filter2 = filter2((ones(1,7)/7)', simple_noise, 'same');
MS_s2_x1 = sum((simple_ns_filter2 - simple).^2)/length(simple);
MS_x2_x1 = sum((simple_filter2 - simple).^2)/length(simple);
MS_v2 = MS_s2_x1 - MS_x2_x1;
display(MS_v1);
display(MS_s2_x1);
display(MS_x2_x1);
display(MS_v2);
display('--------------------');
%b)
%MS_v1 =
%19.7631
%MS_s2_x1 =
%48.3135
%MS_x2_x1 =
%43.6464
%MS_v2 =
%4.6671
%MS(v[n]) = 19.7631;
%MS(s^[n] - x[n]) = 48.3135;
%MS(v^[n]) = 4.6671;
%Noise is the dominant source of distortion in this filtered signal

%question 1c
simple_ns_3pt = filter2((ones(3,1)/3), simple_noise, 'same');
simple_ns_5pt = filter2((ones(5,1)/5), simple_noise, 'same');
simple_ns_9pt = filter2((ones(9,1)/9), simple_noise, 'same');

figure(2)
subplot(4,2,[1,2]);
plot(simple,'b','Linewidth', 1.01);
title('Signal: simple');
subplot(4,2,3);
plot(simple_ns_3pt,'g','Linewidth', 1.01);
title('Singal with 3pt average');
subplot(4,2,4);
stem((ones(3,1)/3),'g','Linewidth', 1.01);
title('Singal with 3pt average - Filter Coefficient');
subplot(4,2,5);
plot(simple_ns_5pt,'r','Linewidth', 1.01);
title('Singal with 5pt average');
subplot(4,2,6);
stem((ones(5,1)/5),'r','Linewidth', 1.01);
title('Singal with 5pt average - Filter Coefficient');
subplot(4,2,7);
plot(simple_ns_9pt,'m','Linewidth', 1.01);
title('Singal with 9pt average');
subplot(4,2,8);
stem((ones(9,1)/9),'m','Linewidth', 1.01);
title('Singal with 9pt average - Filter Coefficient');

MS_3pt_x1 = sum((simple_ns_3pt - simple).^2)/length(simple);
MS_5pt_x1 = sum((simple_ns_5pt - simple).^2)/length(simple);
MS_9pt_x1 = sum((simple_ns_9pt - simple).^2)/length(simple);

display(MS_3pt_x1);
display(MS_5pt_x1);
display(MS_9pt_x1);
display('--------------------');
%{
MS_v1 =
19.7631
MS_3pt_x1 =
24.5223
MS_5pt_x1 =
36.2779
MS_9pt_x1 =
60.9562
Three-point moving average filter has the lowest mean-squared error, 
which is closest to MS(v[n])
%}

%Question 1d

C1 = g_smooth(0.5);
C2 = g_smooth(0.75);
C3 = g_smooth(1);


simple_ns_C1 = filter2(C1, simple_noise, 'same');
simple_ns_C2 = filter2(C2, simple_noise, 'same');
simple_ns_C3 = filter2(C3, simple_noise, 'same');

figure(3)
subplot(3,2,1);
plot(simple_ns_C1,'g','Linewidth', 1.01);
title('Singal filted with C1');
subplot(3,2,2);
stem(C1,'g','Linewidth', 1.01);
title('Singal filted with C1 - Filter Coefficient');
subplot(3,2,3);
plot(simple_ns_C2,'r','Linewidth', 1.01);
title('Singal filted with C2');
subplot(3,2,4);
stem(C2,'r','Linewidth', 1.01);
title('Singal filted with C2 - Filter Coefficient');
subplot(3,2,5);
plot(simple_ns_C3,'m','Linewidth', 1.01);
title('Singal filted with C3');
subplot(3,2,6);
stem(C3,'m','Linewidth', 1.01);
title('Singal filted with C3 - Filter Coefficient');

MS_C1_x1 = sum((simple_ns_C1 - simple).^2)/length(simple);
MS_C2_x1 = sum((simple_ns_C2 - simple).^2)/length(simple);
MS_C3_x1 = sum((simple_ns_C3 - simple).^2)/length(simple);

display(MS_C1_x1);
display(MS_C2_x1);
display(MS_C3_x1);

%{

d)
MS_C1_x1 =
14.9318
MS_C2_x1 =
16.9504
MS_C3_x1 =
21.4572
filter with C1 generates the lowest mean squared error. 
Compared with filters in Q1-a,b,c, 
when use the smoothed filter parameter has the lowest mean squared error. 
For MS_C1_x1, it is even less than the mean squared error of the noise itself

}%