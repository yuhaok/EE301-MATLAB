function [A, phi] = apc(target, support, frq);
%function [A, phi] = apc(target, support, frq);
%
% APC -- The "Amplitude and Phase Calculator"
%
% Input Parameters:
%   target  -- the target sinusoid whose amplitude and phase are unknown
%   support -- the support vector for the above sinusoid
%   frq     -- the frequency of the target in radians per second
%
% Output Parameters:
%   A   -- the target sinusoid's amplitude
%   phi -- the target sinusoid's phase

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)

% Get the length of the target
N = length(target);
Ts = (support(N)-support(1))/N;
%display(Ts);


% Make both "target" and "support" column vectors
target = target(:);
support = support(:);


% Use "support" and "frq"  to generate the reference complex exponential
%   (Hint: Given the units of frq, do we need to use a 2*pi factor?)
ref = exp(1i*frq*support);

% Calculate the target-place correlation between "target" and "ref"
%   (Hint: Remember the complex conjugation!)
C = sum(target.*conj(ref))*Ts;


% Use "C" to calulate the amplitude of "target"
A = 2*abs(C)/(support(N)-support(1));

% Use "C" to calculate the phase of "target"
phi = angle(C);
