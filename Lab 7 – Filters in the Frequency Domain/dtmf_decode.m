function numbers = dtmf_decode(signal,display)
%function numbers = dtmf_decode(signal,display)
%
% DTMF_DECODE -- A function that takes a DTMF signal consisting of several 
%                DTMF tones and produces the corresponding set of key-presses
%
% Input Parameter:
%   signal    -- DTMF signal sampled at fs = 8192 
%   display   -- indicates whether or not the function should display
%                the rectified and smoothed filter bank outputs (optional)
%
% Output Parameter:
%   numbers   -- the decoded sequence of key-presses

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)


if ~exist('display','var') | isempty('display')
    display = 1;
end

% Sampling frequency
fs = 8192;

% The DTMF frequencies we are interested in
frqs = [ 697 770 852 941 1209 1336 1477 ];


% M is a vector of orders for the filters with center frequency given in frqs
M = [ 102 103 97 92 62 59 56 ];

% G is a vector of center frequency gains for each bandpass filter
G = [ 51.08 51.64 48.34 45.87 31.15 29.59 28.05 ];

M_LP=200;
% h_smooth is the impulse response of the post-rectifier
%   smoothing filter
h_smooth = ones(M_LP+1,1)/(M_LP+1);
% threshold is the cutoff for deciding whether or not a signal
%   is present; defined as the fraction of the maximum value
threshold = 0.3;


% Initialize the filter bank vector
filtered = [];

for i=1:length(frqs)
    % 'h' is the impulse response for the filter with frequency frqs(i), as 
    %    defined by equation 7.1, with order M(i)
    k =(0:1:M(i));
    h = sin(2*pi*frqs(i)*k/fs);
    
    % We want the center frequency gain to be equal to 1, so we divide by the
    %    gain factor included above
    h = h/G(i);
    
    % 'filtered' is the signal filtered by h
    filtered = [filtered filter(h,1,signal)];

end

% 'rectified' is the rectified filter
rectified = abs(filtered);
  
% 'smoothed' is the final output of the filter bank
smoothed = filter(h_smooth,1,rectified);
    

% Downsample the signal by some factor
factr = 100;
sm = smoothed(1:factr:end,:);


% Find the frames during which there appears to be no signal
signal_absent = find(max(sm,[],2) < threshold);


% Find the two bigest smoothed signals in each frame, and
%   recombine them into an estimated key press for each frame
[x,ind] = sort(sm,2);
number_select = [0 3 6 9 1 2 3];
number_select = number_select(ind);
numbers = sum(number_select(:,end-1:end),2);


% When the signal is absent, we'll assign a "null" key number
numbers(signal_absent) = -1;

% If a frame is the same as the one right before it, discard
numbers(1+find(diff(numbers) == 0)) = [];

% Get rid of "null" key numbers
numbers(numbers == -1) = [];


if display

    % Display a useful plot
    
    leg = {'697'; '770'; '852'; '941'; '1209'; '1336'; '1477'};
    t = (1:size(filtered,1))/fs;
    
    plot(t,smoothed);
    xlabel('Time'); ylabel('Amplitude')
    title('Rectified and Smoothed Filter Bank Outputs');
    legend(leg,0);
    hold on;
    plot(t([1 end]),[1 1]*threshold,'k:');
    hold off;

end
