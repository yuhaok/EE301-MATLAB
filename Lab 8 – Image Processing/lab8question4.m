load('lab8_data.mat');
peppers = im2double(imread('peppers.tif'));
peppers_blur = im2double(imread('peppers_blur.tif'));
[w,h] = size(peppers);

%Question4a
simple_1dflt = filter([1,-1], 1, simple);
figure(1)
plot(simple_1dflt);
title('One-dimensional First Difference Filter');

%{
five non-zero feature in the samples are circled. 
The correspond to sharp changes in the signal simple

%}

%Question4b
peppers_edge = filter2([1,-1], peppers, 'same');
figure(2)
imagesc(peppers_edge);
colorbar;
title('Peppers: One-dimensional First Difference Filter');

%{
 noticed that the resulting image has all non-edge areas 
filtered out and their values are close to zero. 
Looking at the edges, the larger the contrast, 
the larger the values are in the filtered image. 
If the left-edge is dark and right edge is bright, 
the filtered values are negative.
%}

%Question4c
peppers_sharp1 = sharpen(peppers, 1);
figure(3)
subplot(1,2,1);
imagesc(peppers);
colorbar;
title('Peppers: Original');
subplot(1,2,2);
imagesc(peppers_sharp1);
colorbar;
title('Peppers: Sharpened with amount 1');

%{
The sharpen filter makes the dark part on the edge darker 
bright part brighter. the effect makes the contrast of the noise 
 larger and therefore its obvious, which makes the picture very noisy


%}


%Question4d
MS_err_blur = sum(sum((peppers_blur - peppers).^2))/(w*h);
display(MS_err_blur);

SM = zeros(1,101);
for i = 1:101
    pepper_flt = sharpen(peppers_blur, 5*(i-1)/100);
    SM(1,i) = sum(sum(peppers - pepper_flt).^2)/(w*h);
end
figure(4)
plot(0:0.05:5, SM);
xlabel('Sharp Amount');
ylabel('Square-mean Error');
title('Filter Performance');
min_err = min(SM);
Amount = (find(SM <= min_err)-1)/20;
display(min_err);
display(Amount);
peppers_blur_opt = sharpen(peppers_blur, 1.75);
figure(5)
subplot(1,2,1);
imagesc(peppers_blur);
colorbar;
title('Peppers Blur');
subplot(1,2,2);
imagesc(peppers_blur_opt);
colorbar;
title('Peppers Blur: Sharpened with amount 1.75');


%{
MS_err_blur_vs_org =
0.0053
Min_err =
0.0521
Sharpen Amount =
1.7500!

%}
