t_test = 0:99;
s_test = 1.3*cos(t_test*pi/10 + 2.8);
[A,phi] = apc_demo(s_test,t_test, pi/10)
[A,phi] = apc(s_test,t_test, pi/10)

[A,phi] = apc(s_samp, t_samp, 200*pi)


%{
1a
amplitude: 1.3
frequency: ?/10
phase 2.8
%}
%{
1b
test:
>> t_test = 0:99;
>> s_test = 1.3*cos(t_test*pi/10 + 2.8);
>> [A,phi] = apc_demo(s_test,t_test, pi/10)
A =
1.3000
phi =
2.8000
>> [A,phi] = apc(s_test,t_test, pi/10)
A =
1.3000
phi =
2.8000
%}
%{
1c
>> [A,phi] = apc(s_samp, t_samp, 200*pi)
Ts =
4.9750e-04
A =
20.3180
phi =
-3.0600
%}
%{
1d
Fundamental period: (2?)/(?/15) = 30a
Number of periods in this test: 80/30 = 2.67 periods
Amplitude and phase:
>> non_ideal_apc
Ts =
0.9877
A =
1.0294
Phi =
-0.0475
Error for amplitude: 0.0294
Error for phase: -0.0475
%}

%{
1e
Amplitude is 1 -> i= 149 and i= 164

>> non_ideal_apc
Valid A
A =
1
i =
149
Valid A
A =
1
i =
164
The min length that we need to be sure that the phase error is less than 0.01 radians: i= 14
>> Non_ideal_apc
Valid Phi
Phi =
-1.8504e-17
i =
14
For the signal s_test:
Frq= 0.3173
A= 1.3
Phi= 2.8

Although the amplitude and phi are correct, there is a small difference in frequency.
Frq = ?/10 = 0.314
The graph shows that there is only 1 point that has a correlation value (others are zero).

%}