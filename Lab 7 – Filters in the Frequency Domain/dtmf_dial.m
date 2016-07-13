function sig = dtmf_dial(nums,display);
%function sig = dtmf_dial(nums,display);
%
% DTMF_DIAL -- A function that takes a vector of numbers from 1 to 
%             twelve and produces the corresponding DTMF signal
%
% Input Parameter:
%   nums    -- a vector of numbers.  1 through 9 correspond to 
%              numbers 1-9; 10 is '#', 11 is '0', and 12 is '*'
%              0 will automatically be translated to 11
%   display -- indicates whether or not the function should display
%              a spectrogram of the resulting signal (optional)
%
% Output Parameter:
%   sig  -- the resulting dual-tone multi-frequency signal
%

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)


if ~exist('display','var') | isempty('display')
    display = 0;
end


% Just in case, let's translate zeros to 11
nums(nums == 0) = 11;

fs = 8192;

% The frequencies that are used in DTMF
frq1 = [1209 1336 1477];
frq2 = [697 770 852 941];

% The time axis: 1/2 second per number.  Note that 't' is a
%    column vector, so 'sig' will be, too.
t = (0:1/fs:(.5 - 1/fs))';

% Initialize 'sig'
sig = [];

for i=1:length(nums)
    % f1 and f2 are the frequencies of the two sinusoids that we need 
    %   to add together for the current DTMF tone
    f1 = frq1(mod(nums(i)-1,3)+1);
    f2 = frq2(ceil(nums(i)/3));
    
    % Use f1 and f2 to generate the DTMF signal for 'nums(i)' and
    %   append it to 'sig'
      sig = [sig; sin(2*pi*f1*t) + sin(2*pi*f2*t)];

    
    % Append 1/10 of a second of silence (i.e., zeros) if needed
    if i < length(nums)
      sig = [sig;zeros(round(length(t)/5),1)];
    end
end

if display
    [B,T,F] = specgram(sig,256,8192);
    imagesc(F,T,abs(B)); colormap(flipud(gray)); axis xy; colorbar
    xlabel('Time (sec)'); ylabel('Frequency (Hz)');
end
