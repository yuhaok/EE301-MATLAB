%c. Setting M_LP to 20 gives the best tradeoff between transient effects andsmoothing

%d. Choosing the threshold value to be 0.55 makes this threshold can
%filter out all frequency responses that correspond to the target frequencies. 
%It also leaves some spaces for the noises in the signal (if there is some).

%e.
sig = dtmf_dial([2 1 3 7 1 6 2 0 2 3 8],1);
numbers = dtmf_decode(sig,1);
numbers;

%
%numbers =
%2
%1
%3
%7
% 1
% 6
% 11
% 3
%The decoded results match the inputs
