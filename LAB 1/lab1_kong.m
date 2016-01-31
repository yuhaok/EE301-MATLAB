%Yu-Hao Kong
%lab 1
%Student ID 7131384364


disp('Question 1:');

z = 35000;
y = 4
y = z


disp('Question 2a:');

i = [9 8 7 6 5 4 3];
j = [9:-1:3];
m = i - j
m(:,5)

disp('The fifth element is 0');

disp('Question 2b:');
 z=zeros(1,3)
 z=ones(1,3)
disp('Yes');


disp('Question 3a:'); 
m=[1 4 5;4 6 9;5 9 3];
m(3,1)
m(:,2)

disp('Question 3b:'); 
u=[0.2996;0.5361;-0.7892];
r=m*u
s=-5.0125*u

disp('R and S are almost the same');

disp('Question 3c:'); 

a = eye(4,4)

disp('The command is eye'); 

disp('Question 4a:'); 
figure;
Ts=pi/2; t=[0:Ts:2*pi]; plot(t,sin(t));
xlabel('x');ylabel('y');title('curve');

figure;
t1=[0:0.01:2*pi]; plot(t1,sin(t1));
xlabel('x');ylabel('y');title('curve2');

disp('Question 4b:'); 
disp('There is a way');
x = linspace(0,2*pi,100);
y1 = sin(x);
y2 = sin(x-pi/4);
figure
plot(x,y1,x,y2)

disp('Question 4c:'); 
fs=8000;
tstart=0;tend=2;
t=[tstart:1/fs:tend];
f=3;w=2*pi*f;
figure
plot(t,sin(w*t));

astart=1;aend=6;
da=(aend-astart)/(length(t)-1)
A=[astart:da:aend];
figure
plot(t,A.*sin(w*t));

disp('Question 5:'); 

fs = 8000; dt = 1/fs;
t = [0 : 1/fs : 3]; % We'll sample for 3 seconds
f = 1; % f = 1 Hz is the fundamental frequency
X1 = sin(2*pi*f*t);
X3 = sin(2*pi*3*f*t)/3;
X5 = sin(2*pi*5*f*t)/5;
X7 = sin(2*pi*7*f*t)/7;

z= X1+X3+X5+X7;

plot (X1); xlabel('x-axis'), ylabel('y-axis'), title('X1');
figure
plot (t,z); xlabel('x-axis'), ylabel('y-axis'), title('z vs t');
 
z1= zeros(1, length(t));
b=0;
for f =1:2:31
    z= sin(2*pi*f*t)/f;
    z1= z1 + z;
end
figure
plot (t,z1); xlabel('x-axis'), ylabel('y-axis'), title('z1 vs t');


disp('Question 6:'); 

t=-3:0.01:6;
u=heaviside(t+1)+heaviside(t-4)-heaviside(t-1);
figure
plot(t,u)
ylim([-0.1 1.1])

disp('Question 7:'); 

t= 0:.1:5;
x=t.*exp(-t);
y=-t.*sinh(t);
z=t.*cosh(t);
a=y+z;
figure
subplot(2,2,1);plot(t,x),xlabel 'x', ylabel 'y', title 'original';
subplot(2,2,2);plot(t,y),xlabel 'x', ylabel 'y', title 'odd';
subplot(2,2,3);plot(t,z),xlabel 'x', ylabel 'y', title 'even';
subplot(2,2,4);plot(t,a),xlabel 'x', ylabel 'y', title 'even + odd';

disp('Question 8:'); 
for x=10:100
Tstart=2;
Tend=5;
Nr=x; % number of rectangles
Dx=(Tend-Tstart)/(Nr);
t=Tstart:Dx:Tend-Dx; % sampling points
fs=t.^2; % our function evaluated at points t
A=sum(Dx*fs);
E(x)= 39-A;
end
E(10)
disp('E(10)= |39-35.895| = 3.105'); 
disp('Yes, the number is closer to 39'); 
E(63)
disp('63 rectangles are required'); 

figure
plot (E); xlabel('x-axis'), ylabel('y-axis'), title('graph');
xlim([10 100])

disp('Extra Credit:'); 


