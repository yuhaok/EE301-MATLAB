peppers = im2double(imread('peppers.tif'));
peppers_noises1 = im2double(imread('peppers_noise1.tif'));
[w,h] = size(peppers);

SM = zeros(1,101);
for i = 1:101
    Coeff = g_smooth2((i-1)/100);
    pepper_flt = filter2(Coeff, peppers_noises1, 'same');
    SM(1,i) = sum(sum(peppers - pepper_flt).^2)/(w*h);
end
plot(0:0.01:1, SM);
xlabel('Filter Width');
ylabel('Square-mean Error');
title('Filter Performance');
min_err = min(SM);
width = (find(SM <= min_err)-1)/100;
display(min_err);
display(width);

peppers_min_filted = filter2(g_smooth2(0.39), peppers_noises1, 'same');
figure(2);
subplot(1,3,1);
imagesc(peppers);
title('Original Pepper');
colorbar;
subplot(1,3,2);
imagesc(peppers_noises1);
title('Noisy Pepper');
colorbar;
subplot(1,3,3);
imagesc(peppers_min_filted);
colorbar;
title('Noisy Pepper filted with minimun sm error');

%min_err =
%0.0076
%width =
%0.3900
%the filter effect is better when w=0.8 than using the minimum suquare-root error.
%bigger w produce worse image with more noise

