%%%%Question 1
[rec fs] = audioread('omg.mp4'); % load
sound(rec,fs); % playback
rec = rec(1:fs,:); % trim
rec(:,2) = rec(:,1); % convert to mono
specgram(rec(:,1));



%%%%Question 2

%%width is (0.23m/300)* the hz of the sound

rec(:,2) = circshift(rec(:,1),34) % shift right channel
new = rec; % copy
sound(new,fs);

rec(:,1) = circshift(rec(:,2),35) % shift left channel
new = rec; % copy
sound(new,fs);

rec(:,1) = circshift(rec(:,2),0) % shift center channel
new = rec; % copy
sound(new,fs);

%%%extra credit


%%%%Question 3
rec(:,1) = 2.*rec(:,1);
new = rec; % copy
sound(new,fs);