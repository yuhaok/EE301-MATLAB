

% Demonstration of music convolved with various impulse responses.
% R Kozick modified by Satsuki Takahashi
fs = 44100; % Sampling freq, in Hz
T = 1/fs;
fc = 500; % Desired cutoff freq, in Hz
wc = 2*pi*fc;
% Make impulse response length equal to ?? time constants
t = 0:T:(14/wc);
g = wc*T*exp(-t*wc);
% Read the original audio sample
f = wavread('IMDR1.wav');
fprintf('This is the original music . . . ');
sound(f,44100)
pause(3)
figure(1)
plot(t, g);
title('Impulse response g(t)');
xlabel('Time (sec.)');
ylabel('Amplitude');
fprintf('\nComputing -- please wait . . . ');
y = conv(f(:,1), g);
fprintf('\nThis is after convolution with g(t) . . . ');
sound(y,44100);
pause(3)
fprintf('\nComputing -- please wait . . . ');
h = [g, zeros(size(0:T:1)), .5*g];
figure(2)
th = (1:length(h))*T;
plot(th, h)
title('Impulse response h(t)');
xlabel('Time (sec.)');
ylabel('Amplitude');
z = conv(f(:,1), h);
fprintf('\nThis is after convolution with h(t) . . . ');
sound(z,44100);
fprintf('\n');
fprintf('To repeat the sounds:\n')
fprintf('sound(f,44100) is the original\n')
fprintf('sound(y,44100) is convolved with g(t)\n')
fprintf('sound(z,44100) is convolved with h(t)\n')


%iv. line 10. filled the empty ?? with 14 


%v.
%because g(t) has a maximum amplitude at t=0 (which is 0.7), 
% it has an attenuation effect of the sound wave. 
%Moreover, g(t) is an exponential function not an impulse, 
%it will extend each sound in the original sound wave 
%in an attenuating exponential fashion.


%vi.
%h(t) has 2 impulses, 1. is at t=0 and the second is at t=0.1. 
%This means h(t) creates an echo for each sound sample, 
%and the echo is 0.1s later than the first occurrence of the sound. 
%Also, the first pulse has amplitude of 0.7, 
%it willl give out the 0.7time?s attenuation of the original sound. 
%The second pulse has amplitude of 0.35 it means the the echo 
%is half as loud as the first occurrence.
%Physical Mechanism in real life setting is echo.

%vii
%code(change size of zeros from 0.1 to 1):
