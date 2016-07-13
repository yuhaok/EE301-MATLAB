apc_support = 0:80;
apc_test = cos(apc_support*pi/15);

figure(1)
plot(apc_support, apc_test, 'k:', 'Linewidth', 1.01);
xlabel('t');
ylabel('apc_test');
title('Q2d apc-test');
[A,Phi] = apc(apc_test, apc_support, pi/15);
estimate_A = zeros(1,491);
estimate_Phi = zeros(1,491);
for i=10:500
    apc_support = 0:i;
    apc_test = cos(apc_support*pi/15);
    [A,Phi] = apc(apc_test, apc_support, pi/15);
    estimate_A(1,i-9) = A;
    estimate_Phi(1,i-9) = Phi;
    if A == 1
        disp('Valid A');
        display(A);
        display(i);
    end
    if (Phi <= 0.01) && (Phi >= -0.01)
        disp('Valid Phi');
        display(Phi);
        display(i);
    end
end
figure(2)
subplot(2,1,1);
plot(10:500, estimate_A, 'b*');
xlabel('Support Length');
ylabel('A');
title('Estimations of Amplitude');
grid on;

subplot(2,1,2);
plot(10:500, estimate_Phi, 'r*');
xlabel('Support Length');
ylabel('Phi');
title('Estimations of Phase');
grid on;