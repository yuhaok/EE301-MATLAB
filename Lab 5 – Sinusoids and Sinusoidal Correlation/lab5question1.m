

%{
1a
Estimated value:
Amplitude: 1.0
Continues-time frequency: 2.2 cycles in 1s = 2.2 Hz
Phase: -1/6?
Phasor: num = exp(2*2.2*(-1/6)*pi*pi*j)
Num = 0.5780 ? 0.8160i
%}
t = linspace(-0.5, 2, 1000);
plot(t,cos(linspace(-7.5,27,1000)),'k:');
t = linspace(-0.5, 2, 1000);
plot(t,cos(linspace(-7.5,27,1000)),'k:','LineWidth',1.01);
grid on;
hold on
plot(t, exp(1i*(2*pi*2.2*t - 1/6*pi)),'b:','LineWidth',1.01);
xlabel('t');
ylabel('x(t)');
title('Reconstructing Signal By Observation');
hold off;
