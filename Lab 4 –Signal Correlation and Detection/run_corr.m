function out = run_corr(x,y);
%function out = run_corr(x,y);
%
% RUN_CORR  --  This function implements the "real-time" running
%               correlation algorithm.
%
% Input Parameters:
%   x  -- the signal to correlate with (i.e., the transmitted signal)
%   y  -- the signal to correlate against (i.e., the received signal)
%
% Output Parameters:
%   out  -- the resulting correlation signal with size equal to
%             length(x) + length(y) - 1

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)



% Initialize the output vector to all zeros.  It should have 
%    length(x) + length(y) - 1 elements.
out = zeros(1,length(x)+length(y)-1);

% Make x and y column vectors, regardless of incoming size
x = x(:);
y = y(:);

% Beyond the end of the signal y, the input is zero
y(end+1:end+length(x)) = 0;

% Buffer is just a column vector.  We initialize it to
%    all zeros (with the same size as x) to begin with.
buffer = zeros(length(x), 1);

for n = 1:length(out)
    
    % current_sample is the single-sample input to our "correlation box"
    current_sample = y(n);
    
    % Update the buffer.  Discard the first sample in the buffer, and put
    %   current_sample at the end of the buffer.  
temp = zeros(length(buffer),1); 

for i = 1:length(buffer)-1
    temp(i,1)=buffer(i+1,1);
end

temp(end,1)=current_sample; 
buffer = temp;
%buffer = [buffer(2:end), current_sample];
% From x and the contents of buffer, we can calculate % the next output sample

out(n) = sum(x.*buffer);
end
plot(1:length(out), out);
end

