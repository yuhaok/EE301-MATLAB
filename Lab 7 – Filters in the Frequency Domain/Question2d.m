frqs = [697 770 852 941 1209 1336 1477];
results = zeros(7,200);
for i =1:7
    for j = 1:200
        [g,r]=dtmf_filt_char(j, frqs(i),0);
        results(i,j)= r;
    end
for j = 1:200
    if results(i,j)>10
        M_optimal = j;
        break;
    end
end
[resulting_gain,r] = dtmf_filt_char(M_optimal, frqs(i),0);
display('Frequency =');
disp(frqs(i));
display(M_optimal);
display('R = ');
disp(results(i,j));
disp('Corresponding Gain');
disp(resulting_gain(i));

figure(i)
plot(1:200, results(i,:));
xlabel('M');
ylabel('R');

end