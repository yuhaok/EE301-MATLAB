peppers = im2double(imread('peppers.tif'));
peppers_noises2 = im2double(imread('peppers_noise2.tif'));
[w,h] = size(peppers);

%Question 3a
figure(1)
imagesc(peppers_noises2);
title('Peppers (Salt and pepper noise)');
colorbar;
MS_err = sum(sum((peppers_noises2 - peppers).^2))/(w*h);
display(MS_err);
%MS_err=0.0676

%Question3b
C = g_smooth(1.3);
peppers_noises2_filt = filter2(C, peppers_noises2, 'same');
figure(2)
imagesc(peppers_noises2_filt);
title('Peppers (Salt and pepper noise) - Filtered with 1.3 width value');
colorbar;
MS_err2 = sum(sum((peppers_noises2_filt - peppers).^2))/(w*h);
display(MS_err2);
%MS_err=0.0190


%Question3c
peppers_noises2_medfilt3 = medfilt1(medfilt1(peppers_noises2,3)',3)';
peppers_noises2_medfilt5 = medfilt1(medfilt1(peppers_noises2,5)',5)';
figure(3)
subplot(1,2,1);
imagesc(peppers_noises2_medfilt3);
title('Peppers (Salt and pepper noise) - Filtered with  medfilt, N=3');
colorbar;
subplot(1,2,2);
imagesc(peppers_noises2_medfilt5);
title('Peppers (Salt and pepper noise) - Filtered with  medfilt, N=5');
colorbar;

MS_err_med3 = sum(sum((peppers_noises2_medfilt3 - peppers).^2))/(w*h);
display(MS_err_med3);
MS_err_med5 = sum(sum((peppers_noises2_medfilt5 - peppers).^2))/(w*h);
display(MS_err_med5);

%{
MS_err_med3 =
0.0031
MS_err_med5 =
0.0027

Median filter has better effect in compensating lost pixels, 
with its much smaller median-square error. (order 5 is better than 3)


%}