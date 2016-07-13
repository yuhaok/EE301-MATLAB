kk=-20:20;
CC = zeros(1,41);

for i=2:2:40
    CC(1,i)=-(2/(pi*kk(i)))^2;
end

figure(1)
stem(kk,abs(CC));

xlabel('kk');
ylabel('Magnitude of Fourier Coefficient');
title('KK vs Magnitude of Fourier Coefficient');

[ss,tt]=fourier_synthesis(CC,0.1,5,500);
figure(2)
plot(tt,ss,'Linewidth', 1.01);

xlabel('t');
ylabel('signal');
title('Resynthesis signal');


%the single is A triangular wave signal
