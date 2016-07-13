%Q2b
frqs = [697 770 852 941 1209 1336 1477];
bb = sin(2*pi*770.*(0:50)/8192);
H = freqz(bb, 1, frqs/8192*2*pi);
display(H);
gain = abs(H);
display(gain);

index = find(frqs == 770);
R = abs(H(index))/max(gain(gain~=abs(H(index))));

display(R);

