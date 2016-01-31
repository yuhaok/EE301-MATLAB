%% Script M-file graphically demonstrates the convolution process
%% By B. P. Lathi, Linear Systems and Signals, page 232, ex M2.4
%% Create figure window and make visible on screen
figure(1)
x = inline('1.5*sin(pi*t).*(t>=0 & t<1)');
h = inline('1.5*(t>=0 & t<1.5)-(t>=2 & t<2.5)');
dtau = 0.005;
tau = -1:dtau:4;
ti = 0;
tvec = -1:0.1:4;
%% Pre-allocate memory
y = NaN*zeros(1,length(tvec));
for t = tvec
 %% Time index
 ti = ti+1;
 xh = x(t-tau).*h(tau);
 lxh = length(xh);
 %% trapezoidal approximation of integral
 y(ti) = sum(xh.*dtau);

 subplot(2,1,1), plot(tau,h(tau), 'r-', tau, x(t-tau), 'b--',t,0,'ok');
 axis([tau(1) tau(end) -2.0 2.5]);
 %% patch command is used to create the gray-shaded area of convolution
 patch([tau(1:end-1); tau(1:end-1); tau(2:end); tau(2:end)],...
 [zeros(1,lxh-1); xh(1:end-1); xh(2:end); zeros(1,lxh-1)],...
 [0.8 0.8 0.8], 'edgecolor','none');
 xlabel('\tau');
 legend('h(\tau)', 'x(t-\tau)','t','h(\tau)x(t-\tau)',3);

 c = get(gca, 'children');
 set(gca,'children', [c(2);c(3);c(4);c(1)]);

 subplot(2,1,2), plot(tvec,y,'k',tvec(ti),y(ti),'ok');
 xlabel('t');
 ylabel('y(t)');
 title('y(t) = \int h(\tau)x(t-\tau) d\tau');
 axis([tau(1) tau(end) -1.0 2.0]);
 grid;
 %% drawnow command updates graphics windoe for each loop iteration
 drawnow;
 %% Using the pause command allows one to manually step through the
 %% convolution process
 % pause;
end