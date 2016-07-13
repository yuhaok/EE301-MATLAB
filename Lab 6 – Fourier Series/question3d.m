load('lab6_data.mat');
step_sig_mean_sqr = sum(abs(step_signal).^2)/length(step_signal);

N = 1;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N);
[ss,tt]=fourier_synthesis(CC,1,1,16384);


diff = (ss - step_signal(1:16384));
S_mean_err = sum((abs(diff)).^2)/length(diff);
display(step_sig_mean_sqr);
display(S_mean_err);



while S_mean_err >= 0.005 * step_sig_mean_sqr
N = N + 1;
[CC, ww] = fourier_analysis(step_signal(1:16384), 1, N);
[ss,tt]=fourier_synthesis(CC,1,1,16384);

diff = (ss - step_signal(1:16384));
S_mean_err = sum((abs(diff)).^2)/length(diff);
end
display(N);


% n = 55