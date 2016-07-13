function [frq,A,phi,X] = fape(target,support)
%function [frq,A,phi,X] = fape(target,support)
%
% FAPE -- The "Frequency, Amplitude, and Phase Estimator"
%
% Input Parameters:
%   target  -- the target sinusoid whose frequency, amplitude, phase are unknown
%   support -- the support vector for the above sinusoid
%
% Output Parameters:
%   frq     -- the estimated frequency of the target sinusoid in radians per second
%   A       -- the estimated amplitude of the target sinusoid
%   phi     -- the estimated phase of the target sinusoid
%   X       -- the calculated vector of correlations

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)



% Make both "target" and "support" column vectors
target = target(:);
support = support(:);

% Initialize X to all zeros
X = zeros(floor(length(target)/2),1);

% Determine the correlation length, N
N = length(target);

% Use "support" to determine the sampling period, T_s
T_s = (support(length(support)) - support(1)) / N;


% Loop over values of k to calculate X(k)
for k = 1:N/2
    
    % Use "support" to generate a reference complex exponential with
    %   radian frequency of 2*pi*k/N/T_s radians per second
    ref = exp(-1i*2*pi*k/N*support);
    
    % Calculate the length-normalized correlation, X(k)
    %   (Hint: remember the complex conjugation!)
    X(k) = 1/N * sum(target.*ref);
end


% Find the largest correlation in X, max_val, and its index, k_max
[max_val, k_max] = max(X);
display(max_val);
display(k_max);
% Use "k_max" to estimate the target sinusoid's frequency
frq = 2 * pi * k_max / (N * T_s);

% Use max_val to estimate the amplitude and phase
A = 2*abs(max_val);
phi = angle(max_val);



%{
3a
b) frq= 79.3495
A= 0.5460
Phi= 0.4068
%}


figure(1)
stem(2*pi*(1:N/2)/N, abs(X));
xlabel('Frequencies');
title('Correlation Magnitudes');
    
figure(2)
plot(support, target,'r','Linewidth', 1.01);
hold on
plot(support, A*cos(frq*support+phi), 'b', 'Linewidth', 1.01);
hleg1 = legend('Original Signal','FAPE parsed signal');
xlabel('t');
ylabel('x(t)');
title('Signal Comparison');
hold off

    %{
this algorithm is inaccurate by comparing to the result of fape_test. 
i think is because the lots of none-zero correlations in the non-ideal case. 
That can imply a starting point which would possibly not be the actual starting point of the signal but 
this situation cannot be seen in the ideal case.
The ideal case plot above shows the signal generated by FAPE exactly overlaps with the original signal.
    %}
