success_rate = [];
for i = 0:0.02:1
     success_rate = [success_rate, dtmf_attack(i)];
end
plot(0:0.02:1, success_rate);
xlabel('Noise Power Ratio');
ylabel('Success Rate');

%The type of error: when noise power is high,
%the decoder keep on duplicating same number and providing sequences 
%such as 1 2 2 2 3 3 3 3 3 4 4 4 5 5 6 6 
%0.48

